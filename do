#!/bin/sh -e

# supercop/do
version=20081111
# D. J. Bernstein
# Public domain.

shorthostname=`hostname | sed 's/\..*//' | tr -cd '[a-z][A-Z][0-9]'`

top="`pwd`/bench/$shorthostname"
bin="$top/bin"
lib="$top/lib"
include="$top/include"
work="$top/work"

PATH="/usr/local/bin:$PATH"
PATH="/usr/sfw/bin:$PATH"
PATH="$bin:$PATH"
export PATH

LD_LIBRARY_PATH="/usr/local/lib/sparcv9:/usr/local/lib:$LD_LIBRARY_PATH"
LD_LIBRARY_PATH="/usr/sfw/lib/sparcv9:/usr/sfw/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH

# and wacky MacOS X
DYLD_LIBRARY_PATH="/usr/local/lib/sparcv9:/usr/local/lib:$DYLD_LIBRARY_PATH"
DYLD_LIBRARY_PATH="/usr/sfw/lib/sparcv9:/usr/sfw/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH

# and work around bug in GNU sort
LANG=C
export LANG

rm -rf "$top"
mkdir -p "$top"
mkdir -p "$bin"
mkdir -p "$lib"
mkdir -p "$include"

cp include/* "$include"

exec >"$top/log"
exec 2>&1
exec 5>"$top/data"
exec </dev/null

echo "=== `date` === starting"

echo "=== `date` === hostname"
hostname || :
echo "=== `date` === uname -a"
uname -a || :
echo "=== `date` === uname -M"
uname -M || :
echo "=== `date` === uname -F"
uname -F || :
echo "=== `date` === /usr/sbin/lscfg | grep proc"
/usr/sbin/lscfg | grep proc || :
echo "=== `date` === /usr/sbin/lsattr -El proc0"
/usr/sbin/lsattr -El proc0 || :
echo "=== `date` === cat /proc/cpuinfo"
cat /proc/cpuinfo || :
echo "=== `date` === sysctl hw.model"
sysctl hw.model || :
echo "=== `date` === /usr/sbin/psrinfo -v"
/usr/sbin/psrinfo -v || :

echo "=== `date` === building okcompilers"
rm -rf "$work"
mkdir -p "$work"
cp -pr okcompilers/* "$work"
( cd "$work" && sh do )
cp -p "$work"/bin/* "$bin"

echo "=== `date` === building cpuid"
rm -rf "$work"
mkdir -p "$work"
cp -pr cpuid/* "$work"
( cd "$work" && sh do )
cp -pr "$work"/include/* "$include"

echo "=== `date` === building inttypes"
rm -rf "$work"
mkdir -p "$work"
cp -pr inttypes/* "$work"
( cd "$work" && sh do )
cp -pr "$work"/include/* "$include"

echo "=== `date` === building cpucycles"
rm -rf "$work"
mkdir -p "$work"
cp -pr cpucycles/* "$work"
( cd "$work" && sh do )
cp -pr "$work"/lib/* "$lib"
cp -pr "$work"/include/* "$include"

okabi \
| while read abi
do
  echo "=== `date` === building gmp for $abi"
  mkdir -p "$lib/$abi"
  mkdir -p "$include/$abi"
  okc-$abi | head -1 \
  | while read c copts
  do
    okcpp-$abi | head -1 \
    | while read cpp cppopts
    do
      for gmpabi in 64 32 2.0w 2.0n 1.0 o32 n32 aix64 mode64 mode32
      do
	[ -s "$lib/$abi/libgmp.a" ] && continue
	echo "=== `date` === trying CC=$c CXX=$cpp CFLAGS=$copts CXXFLAGS=$cppopts ABI=$gmpabi"
	rm -rf "$work"
	mkdir -p "$work"
	cp -pr gmp-4.2.4/* "$work"
	( cd "$work" \
	  && ./configure --enable-cxx \
	     ABI="$gmpabi" \
	     CC="$c" CXX="$cpp" CFLAGS="$copts" CXXFLAGS="$cppopts" LDFLAGS="$copts" \
	  && make \
	  && make check \
	  && cp gmp.h gmpxx.h gmp-impl.h longlong.h config.h gmp-mparam.h fib_table.h mp_bases.h "$include/$abi" \
	  && ( ranlib ".libs/libgmp.a" || : ) \
	  && cp .libs/libgmp.a "$lib/$abi/libgmp.a" \
	  && chmod 644 "$lib/$abi/libgmp.a" \
	  && ( ranlib ".libs/libgmpxx.a" || : ) \
	  && ( cp .libs/libgmpxx.a "$lib/$abi/libgmpxx.a" || : ) \
	  && ( chmod 644 "$lib/$abi/libgmpxx.a" || : )
	) && break
      done
    done
  done
done

okabi \
| while read abi
do
  rm -rf "$work"
  mkdir -p "$work"
  echo 'void supercop_base(void) { ; }' > "$work/supercop_base.c"
  okc-$abi \
  | while read compiler
  do
    ( cd "$work" && $compiler -c supercop_base.c ) && break
  done
  okar-$abi cr "$lib/$abi/libsupercop.a" "$work/supercop_base.o"
  ( ranlib "$lib/$abi/libsupercop.a" || exit 0 )
done

# loop over operations
cat OPERATIONS \
| while read o macros prototypes
do
  [ -d "$o" ] || continue

  # for each operation, loop over primitives
  ls "$o" \
  | sort \
  | while read p
  do
    [ -d "$o/$p" ] || continue
    checksum=''
    [ -f "$o/$p/checksum" ] && checksum=`cat "$o/$p/checksum"`
    op="${o}_${p}"

    # for each operation primitive, loop over abis
    okabi \
    | while read abi
    do
      echo "=== `date` === $abi $o/$p"
      libs=`"oklibs-$abi"`
      libs="$lib/$abi/cpucycles.o $libs"
      [ -f "$lib/$abi/libgmp.a" ] && libs="$lib/$abi/libgmp.a $libs"
      [ -f "$lib/$abi/libsupercop.a" ] && libs="$lib/$abi/libsupercop.a $libs"

      rm -rf "$work"
      mkdir -p "$work"
      mkdir -p "$work/best"

      # for each operation primitive abi, loop over implementations
      find "$o/$p" -follow -name "api.h" \
      | sort \
      | while read doth
      do
	implementationdir=`dirname $doth`
	opi=`echo "$implementationdir" | tr ./- ___`

	echo "=== `date` === $abi $implementationdir"

	rm -rf "$work/compile"
	mkdir -p "$work/compile"
	cp -pr "$implementationdir"/* "$work/compile"
  
	cfiles=`ls "$work/compile" | grep '\.c$' || :`
	sfiles=`ls "$work/compile" | grep '\.[sS]$' || :`
	ccfiles=`ls "$work/compile" | grep '\.cc$' || :`
	cppfiles=`ls "$work/compile" | grep '\.cpp$' || :`

	language=c
	[ "x$cppfiles" = x ] || language=cpp
	[ "x$ccfiles" = x ] || language=cpp
  
	cp -p "$o/try.c" "$work/compile/try.$language"
	cp -p "$o/measure.c" "$work/compile/measure.$language"
	cp -p "try-anything.c" "$work/compile/try-anything.$language"
	cp -p "measure-anything.c" "$work/compile/measure-anything.$language"

	(
	  cd "$work/compile"
	  (
	    echo "#ifndef ${o}_H"
	    echo "#define ${o}_H"
	    echo ""
	    echo "#include \"${op}.h\""
	    echo ""
	    echo "$macros" | tr : '\012' | while read macro
	    do
	      echo "#define ${o}${macro} ${op}${macro}"
	    done
	    echo "#define ${o}_PRIMITIVE \"${p}\""
	    echo "#define ${o}_IMPLEMENTATION ${op}_IMPLEMENTATION"
	    echo "#define ${o}_VERSION ${op}_VERSION"
	    echo ""
	    echo "#endif"
	  ) > "$o.h"
	  (
	    echo "#ifndef ${op}_H"
	    echo "#define ${op}_H"
	    echo ""
            sed 's/[    ]CRYPTO_/ '"${opi}"'_/g' < api.h
	    if [ $language = c ]
	    then
	      echo '#ifdef __cplusplus'
	      echo 'extern "C" {'
	      echo '#endif'
	    fi
	    echo "$prototypes" | tr : '\012' | while read prototype
	    do
	      echo "extern int ${opi}${prototype};"
	    done
	    if [ $language = c ]
	    then
	      echo '#ifdef __cplusplus'
	      echo '}'
	      echo '#endif'
	    fi
	    echo ""
	    echo "$macros" | tr : '\012' | while read macro
	    do
	      echo "#define ${op}${macro} ${opi}${macro}"
	    done
	    echo "#define ${op}_IMPLEMENTATION \"${implementationdir}\""
	    echo "#ifndef ${opi}_VERSION"
	    echo "#define ${opi}_VERSION \"-\""
	    echo "#endif"
	    echo "#define ${op}_VERSION ${opi}_VERSION"
	    echo ""
	    echo "#endif"
	  ) > "$op.h"

	  ok${language}-$abi \
	  | while read compiler
	  do
	    echo "=== `date` === $abi $implementationdir $compiler"
	    ok=1
	    for f in $cfiles $sfiles $ccfiles $cppfiles
	    do
	      if [ "$ok" = 1 ]
	      then
		$compiler \
		  -I. -I"$include" -I"$include/$abi" \
		  -c "$f" >../errors 2>&1 \
		|| ok=0
		if [ `wc -l < ../errors` -lt 25 ]
		then
		  cat ../errors
		else
		  head ../errors
		  echo ...
		  tail ../errors
		fi
	      fi
	    done
	    [ "$ok" = 1 ] \
	    && okar-$abi cr "$op.a" *.o \
	    && ( ranlib "$op.a" || exit 0 ) \
	    && $compiler -D'COMPILER="'"$compiler"'"' \
	      -I. -I"$include" -I"$include/$abi" \
	      -o try try.$language try-anything.$language \
	      "$op.a" $libs \
	    && ./try "$version" "$shorthostname" "$abi" "$o" "$p" "$checksum" >&5 \
	    && $compiler -D'COMPILER="'"$compiler"'"' \
	      -I. -I"$include" -I"$include/$abi" \
	      -o measure measure.$language measure-anything.$language \
	      "$op.a" $libs \
	    && rm -f ../best/*.o ../best/measure \
	    && for f in *.o
	    do
	      cp -p "$f" "../best/${opi}-$f"
	    done \
	    && cp -p "$op.h" "../$op.h" \
	    && cp -p "$o.h" "../$o.h" \
	    && cp -p measure ../best/measure \
	    || :
	  done
	)
      done

      echo "=== `date` === $abi $o/$p measuring"

      "$work/best/measure" "$version" "$shorthostname" "$abi" "$o" "$p" >&5

      [ -f "$o/$p/used" ] \
      && okar-$abi cr "$lib/$abi/libsupercop.a" "$work/best"/*.o \
      && ( ranlib "$lib/$abi/libsupercop.a" || exit 0 ) \
      && cp -p "$work/$op.h" "$include/$abi/$op.h" \
      && [ -f "$o/$p/selected" ] \
      && cp -p "$work/$o.h" "$include/$abi/$o.h" \
      || :
    done
  done
done

echo "=== `date` === finishing"

sed 's/^/+ /' <"$top/log" >&5
gzip -9 "$top/data"
