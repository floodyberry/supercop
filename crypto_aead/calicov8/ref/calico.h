#ifdef __cplusplus
extern "C" {
#endif

void siphash24_mac(void *tag_p /* 8 bytes */,
				   const unsigned char *key /* 32 bytes */,
				   const void *public_msg_num_p /* 8 bytes */,
				   const void *msg, const unsigned long long msg_len,
				   const void *ad, const unsigned long long ad_len);

void chacha(const unsigned char *key /* 32 bytes */,
			const unsigned char *public_msg_num_p /* 8 bytes */,
			const unsigned char *input,
			unsigned long long len,
			unsigned char *output);

#ifdef __cplusplus
}
#endif
