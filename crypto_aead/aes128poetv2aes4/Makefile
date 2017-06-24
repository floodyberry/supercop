CC = clang
CFLAGS = -W -Wall -Wextra -std=c99 -march=native
REF = ref

ifdef DEBUG
	CFLAGS += -O1 -g -DDEBUG -fsanitize=undefined -fsanitize=address \
	          -fsanitize=alignment -ftrapv -fno-omit-frame-pointer \
	          -fno-optimize-sibling-calls
else
	CFLAGS += -O3 -fomit-frame-pointer
endif

.PHONY: all clean poet-ref-test-vectors

all: crypto_aead.h poet-ref-test-vectors

$(REF)/%.o: $(REF)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

encrypt-ref.o: encrypt.c
	$(CC) $(CFLAGS) -I$(REF) -c $< -o $@

poet-ref-test-vectors: encrypt-ref.o $(REF)/poet.o $(REF)/aes.o
	$(CC) $(CFLAGS) -I$(REF) -o $@ $^ poet-test-vectors.c

crypto_aead.h:
	touch crypto_aead.h

clean:
	rm -f *.o $(REF)/*.o core* *.gch *~ 
	rm -f poet-ref-test-vectors



