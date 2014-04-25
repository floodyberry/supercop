readme.txt
----------

For the stribob192r1 reference implementation.
11-Mar-14  Markku-Juhani O. Saarinen <mjos@iki.fi>

This software is released under CC0 license; it is effectively Public Domain.
See LICENSE 

The directory structure is mandated by the CAESAR call for algorithms.
Under crypto_aead/stribob192r1 we have the Makefile, independent test 
driver, and this file:

    Makefile
    testmain.c
    LICENSE
    readme.txt

Reference implementation and glue for CAESAR api:

    ref/api.h
    ref/crypto_aead.h
    ref/stribob.h
    ref/stribob.c
    ref/encrypt.c
    ref/sbob_pi64.c
    ref/sbob_tab64.c

Mixing function optimized for SSE4.2 architecture. Link with this instead
of ref/sbob_pi64.c to get 2x+ speed on those CPUs:

    xmm/sbob_x86pi.c


We are also providing a 8-bit version. If you link with this, you don't
have to link either ref/sbob_pi64.c or ref/sbob_tab64.c:

    8bit/sbob_pi8.c


To build and test the reference implementation:

    $ make
    gcc -Wall -O2  -Iref -c testmain.c -o testmain.o
    gcc -Wall -O2  -Iref -c ref/encrypt.c -o ref/encrypt.o
    gcc -Wall -O2  -Iref -c ref/stribob.c -o ref/stribob.o
    gcc -Wall -O2  -Iref -c ref/sbob_tab64.c -o ref/sbob_tab64.o
    gcc -Wall -O2  -Iref -c ref/sbob_pi64.c -o ref/sbob_pi64.o
    gcc  -o xsbob testmain.o ref/encrypt.o ref/stribob.o ref/sbob_tab64.o 
    ref/sbob_pi64.o  

    $ ./xsbob 
    sbob_selftest() PASS
    632098.88 kB/s (1024000kB/1.62s)
    $ 

Cheers,
- markku

