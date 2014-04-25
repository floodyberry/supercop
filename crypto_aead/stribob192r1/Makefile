# Makefile for stribob192r1  
# 16-Jan-14 	Markku-Juhani O. Saarinen <mjos@iki.fi>

BIN	= xsbob

OBJS	= testmain.o \
	ref/encrypt.o \
	ref/stribob.o \
	ref/sbob_tab64.o \
	ref/sbob_pi64.o
#	xmm/sbob_x86pi.o
#	8bit/sbob_pi8.o
#	These are 8-bit and 128-bit alternatives to ref/sbob_pi64.c

DIST 	= stribob192r1

CC	= gcc
CFLAGS 	= -Wall -Ofast -march=native
LIBS 	=
LDFLAGS =
INCS	= -Iref

$(BIN):	$(OBJS)
	$(CC) $(LDFLAGS) -o $(BIN) $(OBJS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) $(INCS) -c $< -o $@

clean:
	rm -rf $(DIST)-*.tgz $(OBJS) $(BIN) *~ 

dist:	clean
	cd ../..; \
	tar cfvz crypto_aead/$(DIST)/$(DIST)-`date "+%Y%m%d%H%M00"`.tgz \
		crypto_aead/$(DIST)/*
