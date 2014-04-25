#POLAWIS v1.0 for CAESAR
#15-04-2014, Wysokinski Arkadiusz, e-mail: polawis@sedkomp.com.pl

#!/bin/bash

gcc -lgmp encode_POLAWIS.c -o encode_POLAWIS

gcc -lgmp decode_POLAWIS.c -o decode_POLAWIS

gcc -lgmp -o key_gen_POLAWIS key_gen_POLAWIS.c

