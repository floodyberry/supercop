CC = /usr/bin/gcc
CFLAGS = -Wall -g

all: test/test_gfe_mul \
 	   test/test_gfe_square \
 	   test/test_gfe_invert \
 	   test/test_smult 

test/test_gfe_mul: test/test_gfe_mul.c gfe.c gfe.h
	$(CC) $(CFLAGS) -o $@ test/test_gfe_mul.c gfe.c

test/test_gfe_square: test/test_gfe_square.c gfe.c gfe.h
	$(CC) $(CFLAGS) -o $@ test/test_gfe_square.c gfe.c

test/test_gfe_invert: test/test_gfe_invert.c gfe.c gfe.h
	$(CC) $(CFLAGS) -o $@ test/test_gfe_invert.c gfe.c

test/test_smult: test/test_smult.c gfe.c gfe.h smult.c
	$(CC) $(CFLAGS) -o $@ test/test_smult.c gfe.c smult.c


.PHONY: clean

clean:
	-rm *.o
	-rm test/test_gfe_mul
	-rm test/test_gfe_square
	-rm test/test_gfe_invert
