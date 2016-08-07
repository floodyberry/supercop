CC = clang
CFLAGS = -W -Wall -Wextra -std=c99 -march=native
CNIFLAGS = -msse4.2 -mavx -maes -DNI_ENABLED
NI = ref

ifdef DEBUG
	CFLAGS += -O1 -g -DDEBUG -fsanitize=undefined -fsanitize=address \
	          -fsanitize=alignment -ftrapv -fno-omit-frame-pointer \
	          -fno-optimize-sibling-calls
else
	CFLAGS += -O3 -fomit-frame-pointer
endif

.PHONY: all clean poet-ni-test-vectors poet-ni-benchmark

all: crypto_aead.h poet-ni-test-vectors poet-ni-benchmark

$(NI)/%.o: $(NI)/%.c
	$(CC) $(CFLAGS) $(CNIFLAGS) -I$(NI) -c $< -o $@

encrypt-ni.o: encrypt.c
	$(CC) $(CFLAGS) $(CNIFLAGS) -I$(NI) -c $< -o $@

poet-ni-test-vectors: encrypt-ni.o $(NI)/poet.o
	$(CC) $(CFLAGS) $(CNIFLAGS) -I$(NI) -o $@ $^ poet-test-vectors.c

poet-ni-benchmark: encrypt-ni.o $(NI)/poet.o
	$(CC) $(CFLAGS) $(CNIFLAGS) $(BENCHMARK_FLAGS) -I$(NI) -o $@ $^ poet-benchmark.c

crypto_aead.h:
	touch crypto_aead.h

clean:
	rm -f *.o $(NI)/*.o core* *.gch *~ 
	rm -f poet-ni-test-vectors poet-ni-benchmark



