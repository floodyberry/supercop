CC = clang
CFLAGS = -W -Wall -Wextra -std=c99 -march=native
CNIFLAGS = -msse4.2 -mavx -maes -DNI_ENABLED
BENCHMARK_FLAGS = 
NI = ni
REF = ref

ifdef DEBUG
	CFLAGS += -O1 -g -DDEBUG -fsanitize=undefined -fsanitize=address \
	          -fsanitize=alignment -ftrapv -fno-omit-frame-pointer \
	          -fno-optimize-sibling-calls
else
	CFLAGS += -O3 -fomit-frame-pointer
endif
ifdef DECRYPT
	BENCHMARK_FLAGS += -DBENCH_DECRYPT
endif
ifdef ENC_ONLY
	BENCHMARK_FLAGS += -DBENCH_ENC_ONLY
endif
ifdef FINE_GRAINED
	BENCHMARK_FLAGS += -DBENCH_FINE_GRAINED
endif

.PHONY: all clean 

all: crypto_aead.h poet-ni-test-vectors poet-ni-benchmark poet-ref-test-vectors

$(NI)/%.o: $(NI)/%.c
	$(CC) $(CFLAGS) $(CNIFLAGS) -I$(NI) -c $< -o $@

$(REF)/%.o: $(REF)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

encrypt-ref.o: encrypt.c
	$(CC) $(CFLAGS) -I$(REF) -c $< -o $@

encrypt-ni.o: encrypt.c
	$(CC) $(CFLAGS) $(CNIFLAGS) -I$(NI) -c $< -o $@

poet-ni-test-vectors: encrypt-ni.o $(NI)/poet.o
	$(CC) $(CFLAGS) $(CNIFLAGS) -I$(NI) -o $@ $^ poet-test-vectors.c

poet-ni-benchmark: encrypt-ni.o $(NI)/poet.o
	$(CC) $(CFLAGS) $(CNIFLAGS) $(BENCHMARK_FLAGS) -I$(NI) -o $@ $^ poet-benchmark.c

poet-ref-test-vectors: encrypt-ref.o $(REF)/poet.o $(REF)/aes.o
	$(CC) $(CFLAGS) -I$(REF) -o $@ $^ poet-test-vectors.c

crypto_aead.h:
	touch crypto_aead.h

clean:
	rm -f *.o $(NI)/*.o $(REF)/*.o core* *.gch *~ 
	rm -f poet-ref-test-vectors poet-ni-test-vectors poet-ni-benchmark


