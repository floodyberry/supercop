# Makefile
# 16-Jan-14 	Markku-Juhani O. Saarinen <mjos@iki.fi>

BIN	= xsbob

OBJS	= testmain.o \
	ref/encrypt.o \
	ref/stribob.o \
	ref/sbob_tab64.o \
	ref/sbob_pi64.o

# 8-bit version: 8bit/sbob_pi8.o
# If you link with the sbob_pi8.c, no need for sbob_pi64.c or sbob_tab64.c 
	
DIST 	= stribob192r1

CC	= gcc
CFLAGS 	= -Wall -O2
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
