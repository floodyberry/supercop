For full paper see http://eprint.iacr.org/2014/852

Copyright - level 0 (No known present or future claims)

Patents - level 0: (No known present or future claims)

Secret keys are 104-bytes (104 signed 5-bit windows).
Public Keys are 144-bytes, 72 bytes for each of x and y coordinates.
This includes some redundancy and could be compressed to 132-bytes.
The Shared secret is the 72 byte x-coordinate, could be compressed to 66 bytes.
It is assumed that shared secrets would be hashed before use.

Secure against all known side-channel attacks.
Good for 64-bit processors, code will break on 32-bit machines.
Pre-computation is not exploited for calculating key-pair.
