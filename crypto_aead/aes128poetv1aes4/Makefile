CC = clang
CFLAGS = -W -Wall -Wextra -std=c99 -march=native
CNIFLAGS = -msse4.2 -mavx -maes -DNI_ENABLED
NI = ni
REF = ref

ifdef DEBUG
	CFLAGS += -O1 -g -DDEBUG -fsanitize=undefined -fsanitize=address \
	          -fsanitize=alignment -ftrapv -fno-omit-frame-pointer \
	          -fno-optimize-sibling-calls
else
	CFLAGS += -O3 -fomit-frame-pointer
endif

.PHONY: all clean poet-ni-test-vectors poet-ni-benchmark poet-ref-test-vectors

all: crypto_aead.h poet-ni-test-vectors poet-ni-benchmark poet-ref-test-vectors

$(NI)/%.o: $(NI)/%.c
	$(CC) $(CFLAGS) $(CNIFLAGS) -I$(NI) -c $< -o $@

$(REF)/%.o: $(REF)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

poet-ni-test-vectors: $(NI)/encrypt.o $(NI)/poet.o
	$(CC) $(CFLAGS) $(CNIFLAGS) -I$(NI) -o $@ $^ poet-test-vectors.c

poet-ni-benchmark: $(NI)/encrypt.o $(NI)/poet.o
	$(CC) $(CFLAGS) $(CNIFLAGS) $(BENCHMARK_FLAGS) -I$(NI) -o $@ $^ poet-benchmark.c

poet-ref-test-vectors: $(REF)/encrypt.o $(REF)/poet.o $(REF)/aes.o
	$(CC) $(CFLAGS) -I$(REF) -o $@ $^ poet-test-vectors.c

crypto_aead.h:
	touch crypto_aead.h

clean:
	rm -f *.o $(NI)/*.o $(REF)/*.o core* *.gch *~ 
	rm -f poet-ref-test-vectors poet-ni-test-vectors poet-ni-benchmark



