run: test_it
	./test_it

CFLAGS=-DTESTING -Wall
OBJ=test.o enchilada.o aes.o chacha.o auth.o
SRC = test.c enchilada.c aes.c chacha.c auth.c enchilada.h

test_it : $(OBJ)
	gcc $(OBJ) -o test_it

test_no_encrypt: $(SRC) enchilada.h
	gcc -DTESTING -DNO_ENCRYPT $(SRC) -o test_no_encrypt
	./test_no_encrypt

%.o: %.c enchilada.h
	gcc $(CFLAGS) -c -o $@ $<

clean:
	rm test_it test_no_encrypt random_data $(OBJ)