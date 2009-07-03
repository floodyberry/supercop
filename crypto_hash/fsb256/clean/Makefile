CC = gcc
CFLAGS = -g -Wall -DMYTEST

TARGETS = fsb-test fsb-speed
OBJECTS = first_line.o hash.o fsb.o cpucycles/cpucycles.o
ASMFILES = performHash256.s
QHASM = ~/bin/qhasm/qhasm-amd64
MAQ = ~/bin/maq/maq

DEPENDFILES = $(TARGETS:%=.%.depend) $(OBJECTS:%.o=.%.depend)

all: $(TARGETS)

-include $(DEPENDFILES)

fsb-test: fsb-test.c $(OBJECTS) $(ASMFILES) .fsb-test.depend 
	$(CC) $(CFLAGS) $(LFLAGS) $(OBJECTS) $(ASMFILES) $(INCLUDES) $@.c -o $@

fsb-speed: fsb-speed.c $(OBJECTS) $(ASMFILES) .fsb-speed.depend 
	$(CC) $(CFLAGS) $(LFLAGS) $(OBJECTS) $(ASMFILES) $(INCLUDES) $@.c -o $@

.%.depend: %.c
	$(CC) $(INCLUDES) -MT $(@:.%.depend=%) -MM $< > $@

%.s: %.q
	$(QHASM) < $< > $@

%.q: %.pq
	$(MAQ) $< > $@

.PHONY: clean

clean: 
	rm *.o fsb-speed fsb-test
