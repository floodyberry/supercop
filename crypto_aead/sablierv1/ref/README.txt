The files are organized as:
	api.h                standard header
	crypto_aead.h        standard header
	encrypt.c            implementation of the standard APIs
	sablier.h            implementation of encryption functions
	authenticate.h       implementation of authentication functions
	sbox.h               helper sboxes for authentication functions
	test.c               test program
	test vectors.txt     test vectors
	README.txt           current file

Note:
1. The macro SABLIER_VERSION which represents the version of the algorithm is defined in api.h.
2. crypto_aead.h is commented out in encrypt.c.