CC=gcc
CFLAGS=-W -O3 -msse4.2 -maes
LIBS =

all: test-poet test-encrypt poet-test-vectors

test-poet:
	$(CC) $(CFLAGS) -Wall -o $@ $@.c poet.c aes-ni.c 

test-encrypt:
	touch crypto_aead.h
	$(CC) $(CFLAGS) -o $@ $@.c encrypt.c poet.c aes-ni.c 

poet-test-vectors:
	$(CC) $(CFLAGS) -Wall -o $@ $@.c poet.c aes-ni.c 


m32-test-poet:
	$(CC) $(CFLAGS) -m32 -o $@ test-poet.c poet.c aes-ni.c 

clean:
	rm -f crypto_aead.h
	rm -f *.o *.gch 
	rm -f test-poet test-encrypt poet-test-vectors m32-test-poet
	rm -f *~

