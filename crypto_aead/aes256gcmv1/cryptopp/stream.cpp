#include "crypto_aead.h"
#include <cryptopp/aes.h>
#include <cryptopp/gcm.h>
#include <cryptopp/filters.h>
#include <cryptopp/channels.h>

// int crypto_stream(
// unsigned char *out,
// unsigned long long outlen,
// const unsigned char *n,
// const unsigned char *k
// )
// {
// 	CryptoPP::CTR_Mode<CryptoPP::AES>::Encryption s;
// 	s.SetKeyWithIV(k, 32, n);
// 	s.GenerateBlock(out, (size_t)outlen);
// 	return 0;
// }

int crypto_aead_encrypt(
  unsigned char *c,unsigned long long *clen,
  const unsigned char *m,unsigned long long mlen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *nsec,
  const unsigned char *npub,
  const unsigned char *k
)
{
  try {
    std::string cipher;
    CryptoPP::GCM<CryptoPP::AES>::Encryption e;
    e.SetKeyWithIV(k, 32, npub, 12);
    CryptoPP::AuthenticatedEncryptionFilter aef(e, new CryptoPP::StringSink( cipher ), false, 16);
    aef.ChannelPut(CryptoPP::AAD_CHANNEL, ad, adlen);
    aef.ChannelMessageEnd(CryptoPP::AAD_CHANNEL);
    aef.ChannelPut(CryptoPP::DEFAULT_CHANNEL, m, mlen);
    aef.ChannelMessageEnd(CryptoPP::DEFAULT_CHANNEL);
    
    *clen = mlen + 16;
    
    memcpy(c, cipher.c_str(), *clen);
    
    return 0;
  } catch (CryptoPP::Exception& e ) {
    return -111;
  }
}

int crypto_aead_decrypt(
  unsigned char *m,unsigned long long *outputmlen,
  unsigned char *nsec,
  const unsigned char *c,unsigned long long clen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *npub,
  const unsigned char *k
)
{
  try {
    std::string plain;
    CryptoPP::GCM<CryptoPP::AES>::Decryption d;
    d.SetKeyWithIV(k, 32, npub, 12);
    CryptoPP::AuthenticatedDecryptionFilter adf( d, NULL, CryptoPP::AuthenticatedDecryptionFilter::MAC_AT_BEGIN | CryptoPP::AuthenticatedDecryptionFilter::THROW_EXCEPTION, 16 );
    *outputmlen = clen-16;
    adf.ChannelPut(CryptoPP::DEFAULT_CHANNEL, c+clen-16, 16);
    adf.ChannelPut(CryptoPP::AAD_CHANNEL, ad, adlen); 
    adf.ChannelPut(CryptoPP::DEFAULT_CHANNEL, c, clen-16);
    adf.ChannelMessageEnd(CryptoPP::AAD_CHANNEL);
    adf.ChannelMessageEnd(CryptoPP::DEFAULT_CHANNEL);
    if (!adf.GetLastResult())
      return -111;
    adf.SetRetrievalChannel(CryptoPP::DEFAULT_CHANNEL);
    adf.Get(m, *outputmlen);
    return 0;
  } catch (CryptoPP::Exception& e ) {
    return -111;
  }
}
