#POLAWIS v1.0 for CAESAR
#15-04-2014, Wysokinski Arkadiusz, e-mail: polawis@sedkomp.com.pl

#!/bin/bash

if [ -e ./.key*.txt ]; 
then
#echo "KEY OK"
true
else
./key_gen_POLAWIS -s
fi

#exit 0
tar -zcpf testmes.tgz  *.c *.sh .k*.txt

cat testmes.tgz | ./encode_POLAWIS > C1
sleep 3
cat testmes.tgz | ./encode_POLAWIS > C2
cat ./C2  | ./decode_POLAWIS > testmes2.tgz 

sleep 3
cat testmes.tgz | ./encode_POLAWIS > C3
cat ./C3  | ./decode_POLAWIS > testmes3.tgz 

sleep 3
cat ./C3 | sed s/b/a/5  | ./decode_POLAWIS > testmes3b.tgz 

cat ./C1  | ./decode_POLAWIS > testmes1.tgz 

cmp -l testmes.tgz testmes1.tgz  > testmes_diff1.txt
cmp -l testmes.tgz testmes2.tgz  > testmes_diff2.txt
cmp -l testmes.tgz testmes3.tgz  > testmes_diff3.txt
cmp -l testmes.tgz testmes3b.tgz > testmes_diff3b.txt

cmp -l ./C1 ./C2 > C_diff12.txt
cmp -l ./C1 ./C3 > C_diff13.txt
cmp -l ./C2 ./C3 > C_diff23.txt
