SRC:=$(wildcard src/eb/*.c) $(wildcard src/fb/*.c) $(wildcard src/bn/*.c) $(wildcard src/*.c) $(wildcard src/dv/*.c) $(wildcard src/md/*.c) $(wildcard src/low/*.c)
ASM:=$(wildcard src/low/*.s)
OBJ:=$(SRC:.c=.o) $(ASM:.s=.o) curve2251.o

CC:=gcc
CFLAGS:=-O3 -std=c99 -I include/low -I target/include -I . -I$(GMP) -funroll-loops -fomit-frame-pointer -msse4 -mpclmul -DMAIN -march=native

%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o:%.s
	$(CC) $(CFLAGS) -c $< -o $@

curve2251: $(OBJ)
	$(CC) -static $(OBJ) $(LIB) -o $@

clean:
	-rm -f $(OBJ) curve2251 
