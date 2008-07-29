SOURCES:=$(wildcard *.c)
OBJS:=$(SOURCES:.c=.o) main.o


ifndef	GMP
GMP:=../../libraries/gmp-4.2.1
endif

CC:=gcc
CFLAGS:=-msse2 -O3 -DTUNING="unroll" -I. -I$(GMP) -DNDEBUG -funroll-loops -fomit-frame-pointer
LIBS:=-lgmp

%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@

bat: $(OBJS)
	$(CC) $(OBJS) $(LIBS) -o $@
main.o:other/main.c
	$(CC) $(CFLAGS) -c $< -o $@

TEXSOURCES:=$(wildcard *.tex)
PDFS:=$(TEXSOURCES:.tex=.pdf)

%.pdf:	%.tex
	pdflatex $<
	pdflatex $<

doc:	$(PDFS)

clean:
	-rm -f $(OBJS) bat *~ *.aux *.dvi *.log
