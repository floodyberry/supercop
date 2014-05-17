#include "crypto_aead.h"
#include "encrypt.h"

/**
 * Wheesht Reference Implementation (Wheesht-5-7-256)
 * 
 * Peter Maxwell 20140415
 * 
 */




void aead_enc_block( 
	aead_params_t * params,
	aead_state_t * pre_state,
	aead_block_t * fin_stream,
	aead_block_t * fin_auth,
	uint32_t flags  ) {

	uint64_t m0 = 0LLU;
	uint64_t m1 = 0LLU;
	uint64_t m2 = 0LLU;
	uint64_t m3 = 0LLU;
	uint64_t m4 = 0LLU;
	uint64_t m5 = 0LLU;
	uint64_t m6 = 0LLU;
	uint64_t m7 = 0LLU;
	uint64_t t04 = 0LLU;
	uint64_t t26 = 0LLU;

#ifdef DEBUG
	printf( "\n\n\naead_enc_block; block = %llu\n", params->block0 );
#endif
	
	if ( ! ( FLG_PRE_CALC & flags ) ) {
	
		m0 = params->k0 ^ C0;
		m1 = params->k1 ^ C1;
		m2 = params->k2 ^ C2;
		m3 = params->k3 ^ C3;
		m4 = params->k0 ^ C4;
		m5 = params->k1 ^ C5;
		m6 = params->k2 ^ C6;
		m7 = params->k3 ^ C7;  	  
		
		// Mix in s0, s1
		PRINTSTATE( "Mix s0,s1,p0,p1" );
		MIX( m0, m1, m2, m3, m4, m5, m6, m7, params->s0, params->s1, params->p0, params->p1 );
		PRINTSTATE( "" );		
		PARTROUND5( m0, m1, m2, m3 );				
		PARTROUND5( m4, m5, m6, m7 );
		PRINTSTATE( "" );	
		
		// Mix halves (swap 0<->4 and 2<->6)
		t04 = m0; m0 = m4; m4 = t04;	
		t26 = m2; m2 = m6; m6 = t26;
		
		// Save pre-state for future use
		pre_state->r0 = m0;
		pre_state->r1 = m1;
		pre_state->r2 = m2;
		pre_state->r3 = m3;
		pre_state->r4 = m4;
		pre_state->r5 = m5;
		pre_state->r6 = m6;
		pre_state->r7 = m7;
	
	} else {
		
		m0 = pre_state->r0;
		m1 = pre_state->r1;
		m2 = pre_state->r2;
		m3 = pre_state->r3;
		m4 = pre_state->r4;
		m5 = pre_state->r5;
		m6 = pre_state->r6;
		m7 = pre_state->r7;
				
	}
	    
	// Mix in blocks and mode and len
	PRINTSTATE( "Mix block0, block1, len, mode" );
	MIX( m0, m1, m2, m3, m4, m5, m6, m7, params->block0, params->block1, params->len, params->mode_bits );		
	PRINTSTATE( "" );		
	PARTROUND5( m0, m1, m2, m3 );				
	PARTROUND5( m4, m5, m6, m7 );
	PRINTSTATE( "" );		
	
	// Mix halves (swap 0<->4 and 2<->6)
	t04 = m0; m0 = m4; m4 = t04;	
	t26 = m2; m2 = m6; m6 = t26;
		
	// Do final transform
	PRINTSTATE( "Final transform" );				
	PARTROUND7( m0, m1, m2, m3 );				
	PARTROUND7( m4, m5, m6, m7 );
	PRINTSTATE( "" );		

	// Mix halves (swap 0<->4 and 2<->6)
	t04 = m0; m0 = m4; m4 = t04;	
	t26 = m2; m2 = m6; m6 = t26;

	// Finalise
	PRINTSTATE( "XOR key" );
	m0 ^= params->k0;
	m1 ^= params->k1;
	m2 ^= params->k2;
	m3 ^= params->k3;
	m4 ^= params->k0;
	m5 ^= params->k1;
	m6 ^= params->k2;
	m7 ^= params->k3;
		
	PRINTSTATE( "Result" );

	fin_stream->r0 = m0;
	fin_stream->r1 = m1;
	fin_stream->r2 = m2;
	fin_stream->r3 = m3;
	fin_auth->r0 = m4;
	fin_auth->r1 = m5;
	fin_auth->r2 = m6;
	fin_auth->r3 = m7;

}



void aead_auth_block( 
	aead_block_t * cipher_text,
	aead_block_t * auth_block_key,
	aead_block_t * fin_auth_block ) {

	uint64_t m0 = 0LLU;
	uint64_t m1 = 0LLU;
	uint64_t m2 = 0LLU;
	uint64_t m3 = 0LLU;

#ifdef DEBUG	
	printf("\n\n\naead_auth_block\n");	
	printf( "ciphertextin: m0:  %016llx; m1:  %016llx; m2:  %016llx; m3:  %016llx\n", cipher_text->r0, cipher_text->r1, cipher_text->r2, cipher_text->r3 );
	printf( "auth_block_key: m0:  %016llx; m1:  %016llx; m2:  %016llx; m3:  %016llx\n", auth_block_key->r0, auth_block_key->r1, auth_block_key->r2, auth_block_key->r3 );
	printf( "fin_auth_block: m0:  %016llx; m1:  %016llx; m2:  %016llx; m3:  %016llx\n", fin_auth_block->r0, fin_auth_block->r1, fin_auth_block->r2, fin_auth_block->r3 );
#endif
	
	m0 = auth_block_key->r0 ^ cipher_text->r0;
	m1 = auth_block_key->r1 ^ cipher_text->r1;
	m2 = auth_block_key->r2 ^ cipher_text->r2;
	m3 = auth_block_key->r3 ^ cipher_text->r3;
	
	PRINTHALFSTATE( "Auth mix" );
	PARTROUND5( m0, m1, m2, m3 );
	PRINTHALFSTATE( "" );	

	// Finalise
	fin_auth_block->r0 = m0 ^ auth_block_key->r0;
	fin_auth_block->r1 = m1 ^ auth_block_key->r1;
	fin_auth_block->r2 = m2 ^ auth_block_key->r2;
	fin_auth_block->r3 = m3 ^ auth_block_key->r3;
		
}



void aead_auth_fin( 
	aead_params_t * params,
	aead_block_t * auth_key,
	aead_block_t * fin_auth_block ) {

	uint64_t m0 = C0 ^ auth_key->r0;
	uint64_t m1 = C1 ^ auth_key->r1;
	uint64_t m2 = C2 ^ auth_key->r2;
	uint64_t m3 = C3 ^ auth_key->r3;
	uint64_t m4 = C4 ^ auth_key->r0;
	uint64_t m5 = C5 ^ auth_key->r1;
	uint64_t m6 = C6 ^ auth_key->r2;
	uint64_t m7 = C7 ^ auth_key->r3;
	uint64_t t04 = 0LLU;
	uint64_t t26 = 0LLU;

#ifdef DEBUG	
	printf( "\n\n\naead_auth_fin\n");
#endif
	
	PRINTSTATE( "Auth fin mix s0,s1,p0,p1" );
	MIX( m0, m1, m2, m3, m4, m5, m6, m7, params->s0, params->s1, params->p0, params->p1 );	
	PRINTSTATE( "" );		
	PARTROUND5( m0, m1, m2, m3 );				
	PARTROUND5( m4, m5, m6, m7 );
	PRINTSTATE( "" );	
	
	// Mix halves (swap 0<->4 and 2<->6)
	t04 = m0; m0 = m4; m4 = t04;	
	t26 = m2; m2 = m6; m6 = t26;

	// Mix in blocks, mode and len
	PRINTSTATE( "Mix blocks, len and mode" );
	MIX( m0, m1, m2, m3, m4, m5, m6, m7, params->block0, params->block1, params->len, params->mode_bits );
	PRINTSTATE( "" );		
	PARTROUND5( m0, m1, m2, m3 );				
	PARTROUND5( m4, m5, m6, m7 );
	PRINTSTATE( "" );		
	
	// Mix halves (swap 0<->4 and 2<->6)
	t04 = m0; m0 = m4; m4 = t04;	
	t26 = m2; m2 = m6; m6 = t26;	

	// Do final transform
	PRINTSTATE( "Final transform" );				
	PARTROUND7( m0, m1, m2, m3 );				
	PARTROUND7( m4, m5, m6, m7 );
	PRINTSTATE( "" );

	// Finalise
	fin_auth_block->r0 = m0 ^ m4 ^ auth_key->r0;
	fin_auth_block->r1 = m1 ^ m5 ^ auth_key->r1;
	fin_auth_block->r2 = m2 ^ m6 ^ auth_key->r2;
	fin_auth_block->r3 = m3 ^ m7 ^ auth_key->r3;
		
}



int crypto_aead_encrypt(
	unsigned char *c,unsigned long long *clen,
	const unsigned char *m,unsigned long long mlen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
) {

	// Set things up
	aead_params_t aead_params;	
	aead_params.k0 = *( (uint64_t*)( k + 0 ) );
	aead_params.k1 = *( (uint64_t*)( k + 8 ) );
	aead_params.k2 = *( (uint64_t*)( k + 16 ) );
	aead_params.k3 = *( (uint64_t*)( k + 24 ) );
	
	// Because I misread the requirements, got the secret number mixed-up
	// so have in effect removed the secret number and doubled size of
	// public number, for now at least.
	aead_params.p0 = *( (uint64_t*)( npub ) );
	aead_params.p1 = *( (uint64_t*)( npub + 8 ) );
	aead_params.s0 = *( (uint64_t*)( npub + 16 ) );
	aead_params.s1 = *( (uint64_t*)( npub + 24 ) );
	
	aead_block_t aead_block_afinkey;
	aead_block_afinkey.r0 = *( (uint64_t*)( k + 32 ) );
	aead_block_afinkey.r1 = *( (uint64_t*)( k + 40 ) );
	aead_block_afinkey.r2 = *( (uint64_t*)( k + 48 ) );
	aead_block_afinkey.r3 = *( (uint64_t*)( k + 56 ) );	
	
#ifdef DEBUG
	printf( "\n\n\n----------\n" );	
	printf( "K_c   : %016llx; %016llx; %016llx; %016llx;\n", aead_params.k0, aead_params.k1, aead_params.k2, aead_params.k3 );
	printf( "K_f   : %016llx; %016llx; %016llx; %016llx;\n", aead_block_afinkey.r0, aead_block_afinkey.r1, aead_block_afinkey.r2, aead_block_afinkey.r3 );
	printf( "npub  : %016llx; %016llx;\n", aead_params.p0, aead_params.p1 );
	printf( "nsec  : %016llx; %016llx;\n", aead_params.s0, aead_params.s1 );
	printf( "mlen  : %016llx (%llu);\n", mlen, mlen );
	printf( "adlen : %016llx (%llu);\n", adlen, adlen );
	printf( "----------\n\n\n" );
#endif
	
	// Cur block stream cipher result
	aead_block_t aead_block_cfin = { 0LLU, 0LLU, 0LLU, 0LLU };
	
	// Cur block auth value returned key and result
	aead_block_t aead_block_atkey = { 0LLU, 0LLU, 0LLU, 0LLU };
	aead_block_t aead_block_afin = { 0LLU, 0LLU, 0LLU, 0LLU };
	
	// Cur working block
	aead_block_t aead_block_work = { 0LLU, 0LLU, 0LLU, 0LLU };
			
	// Total auth value result (word-wise addition of all previous values)
	aead_block_t aead_block_auth = { 0LLU, 0LLU, 0LLU, 0LLU };	
	
	// Pre-calc'd states
	aead_state_t pre_state = { 0LLU, 0LLU, 0LLU, 0LLU, 0LLU, 0LLU, 0LLU, 0LLU };	
		
	// Counters and such like
	uint64_t m_block0 = 0LLU;
	uint64_t m_block1 = 0LLU; // Obviously we'll never get this far, more for the sake of completeness
	uint64_t ad_block0 = 0LLU;
	uint64_t ad_block1 = 0LLU; // Obviously we'll never get this far, more for the sake of completeness	
	uint64_t m_bytes_left = mlen;
	uint64_t ad_bytes_left = adlen;
	uint32_t cur_flags = 0LLU;
	
	// Current pointer within the output ciphertext buffer
	unsigned char * cur_c = c;
	
	// Make sure we zero out the c buffer
	memset( c, 0, mlen + 32 );
	
	// Encrypt first
	while ( m_bytes_left > 0 ) {
	
		// Test whether we've got a whole 256-bit == 32 byte block to work with or not
		if ( m_bytes_left < BLOCKSIZE_BYTES ) {
				
			// Partial block this time
			memset( (unsigned char*)&aead_block_work, 0, sizeof( aead_block_t ) );
			memcpy( (unsigned char*)&aead_block_work, (unsigned char*)m + ( m_block0 * BLOCKSIZE_BYTES ), m_bytes_left );
			
			// Setup parameters
			aead_params.block0 = m_block0;
			aead_params.block1 = 0LLU;
			aead_params.mode_bits = CRYPT_CIPHERTEXTBLOCK || CRYPT_HASNSEC  || CRYPT_HASNPUB || CRYPT_LASTBLOCK;
			aead_params.len = m_bytes_left * 8;
			
			// Set pre-calc mode(s) if not the first block
			cur_flags = 0LLU;
			cur_flags |= ( 0 == m_block0 ) ? 0 : FLG_PRE_CALC;
		
			// Calculate this block
			aead_enc_block( &aead_params, &pre_state, &aead_block_cfin, &aead_block_atkey, cur_flags  );
					
			// XOR with plaintext
			aead_block_work.r0 ^= aead_block_cfin.r0;
			aead_block_work.r1 ^= aead_block_cfin.r1;
			aead_block_work.r2 ^= aead_block_cfin.r2;
			aead_block_work.r3 ^= aead_block_cfin.r3;
						
			// Calculate auth for this block			
			aead_block_afin.r0 = 0LLU;
			aead_block_afin.r1 = 0LLU;
			aead_block_afin.r2 = 0LLU;
			aead_block_afin.r3 = 0LLU;
			aead_auth_block( &aead_block_work, &aead_block_atkey, &aead_block_afin );			
			
			// Copy ciphertext into buffer
			memcpy( (unsigned char*)cur_c, (unsigned char*)&aead_block_work, m_bytes_left );
			cur_c += m_bytes_left;
			
			// Decrement m_bytes_left to zero
			m_bytes_left = 0;
			
			
		} else {
			
			// We've got a whole block so it's easy
			memset( (unsigned char*)&aead_block_work, 0, sizeof( aead_block_t ) );
			memcpy( (unsigned char*)&aead_block_work, (unsigned char*)m + ( m_block0 * BLOCKSIZE_BYTES ), BLOCKSIZE_BYTES );			
			
			// Setup parameters
			aead_params.block0 = m_block0;
			aead_params.block1 = 0LLU;
			aead_params.mode_bits = CRYPT_CIPHERTEXTBLOCK || CRYPT_HASNSEC  || CRYPT_HASNPUB;
			aead_params.len = 256LLU;
			
			// Set pre-calc mode(s) if not the first block
			cur_flags = 0LLU;
			cur_flags |=  ( 0 == m_block0 ) ? 0 : FLG_PRE_CALC;

			// Calculate this block
			aead_enc_block( &aead_params, &pre_state, &aead_block_cfin, &aead_block_atkey, cur_flags  );
			
			// XOR with plaintext
			aead_block_work.r0 ^= aead_block_cfin.r0;
			aead_block_work.r1 ^= aead_block_cfin.r1;
			aead_block_work.r2 ^= aead_block_cfin.r2;
			aead_block_work.r3 ^= aead_block_cfin.r3;

			// Calculate auth for this block
			aead_block_afin.r0 = 0LLU;
			aead_block_afin.r1 = 0LLU;
			aead_block_afin.r2 = 0LLU;
			aead_block_afin.r3 = 0LLU;
			aead_auth_block( &aead_block_work, &aead_block_atkey, &aead_block_afin );			
			
			// Copy ciphertext into buffer
			memcpy( (unsigned char*)cur_c, (unsigned char*)&aead_block_work, sizeof( aead_block_t ) );
			cur_c += BLOCKSIZE_BYTES;
			
			// Decrement m_bytes_left by blocksize
			m_bytes_left -= BLOCKSIZE_BYTES;
			
		}
						
		// Add auth word-wise into total auth value
		aead_block_auth.r0 += aead_block_afin.r0;
		aead_block_auth.r1 += aead_block_afin.r1;
		aead_block_auth.r2 += aead_block_afin.r2;
		aead_block_auth.r3 += aead_block_afin.r3;
			
		// Increment block counter
		++m_block0;
		
	}

	// Do ad
	while ( ad_bytes_left > 0 ) {
	
		// Test whether we've got a whole 256-bit == 32 byte block to work with or not
		if ( ad_bytes_left < BLOCKSIZE_BYTES ) {
				
			// Partial block this time
			memset( (unsigned char*)&aead_block_work, 0, sizeof( aead_block_t ) );
			memcpy( (unsigned char*)&aead_block_work, (unsigned char*)ad + ( ad_block0 * BLOCKSIZE_BYTES ), ad_bytes_left );			
			
			// Setup parameters
			aead_params.block0 = ad_block0;
			aead_params.block1 = 0LLU;
			aead_params.mode_bits = CRYPT_ADBLOCK || CRYPT_HASNSEC  || CRYPT_HASNPUB || CRYPT_LASTBLOCK;
			aead_params.len = ad_bytes_left * 8;
			
			// Set pre-calc mode(s) if not the first block
			cur_flags = 0LLU;
			cur_flags |= ( 0 == ad_block0 ) ? 0 : FLG_PRE_CALC;
		
			// Calculate this block
			aead_enc_block( &aead_params, &pre_state, &aead_block_cfin, &aead_block_atkey, cur_flags  );
			
			// XOR with plaintext
			aead_block_work.r0 ^= aead_block_cfin.r0;
			aead_block_work.r1 ^= aead_block_cfin.r1;
			aead_block_work.r2 ^= aead_block_cfin.r2;
			aead_block_work.r3 ^= aead_block_cfin.r3;
			
			// Decrement ad_bytes_left to zero
			ad_bytes_left = 0;
			
			
		} else {
			
			// We've got a whole block so it's easy
			memset( (unsigned char*)&aead_block_work, 0, sizeof( aead_block_t ) );
			memcpy( (unsigned char*)&aead_block_work, (unsigned char*)ad + ( ad_block0 * BLOCKSIZE_BYTES ), BLOCKSIZE_BYTES );
			
			// Setup parameters
			aead_params.block0 = ad_block0;
			aead_params.block1 = 0LLU;
			aead_params.mode_bits = CRYPT_ADBLOCK || CRYPT_HASNSEC  || CRYPT_HASNPUB;
			aead_params.len = 256LLU;
			
			// Set pre-calc mode(s) if not the first block
			cur_flags = 0LLU;
			cur_flags |= ( 0 == ad_block0 ) ? 0 : FLG_PRE_CALC;

			// Calculate this block
			aead_enc_block( &aead_params, &pre_state, &aead_block_cfin, &aead_block_atkey, cur_flags  );
			
			// XOR with plaintext
			aead_block_work.r0 ^= aead_block_cfin.r0;
			aead_block_work.r1 ^= aead_block_cfin.r1;
			aead_block_work.r2 ^= aead_block_cfin.r2;
			aead_block_work.r3 ^= aead_block_cfin.r3;
		
			// Decrement ad_bytes_left by blocksize
			ad_bytes_left -= BLOCKSIZE_BYTES;
			
		}
				
		// Calculate auth for this block
		aead_block_afin.r0 = 0LLU;
		aead_block_afin.r1 = 0LLU;
		aead_block_afin.r2 = 0LLU;
		aead_block_afin.r3 = 0LLU;
		aead_auth_block( &aead_block_work, &aead_block_atkey, &aead_block_afin );
		
		// Add word-wise into total auth value
		aead_block_auth.r0 += aead_block_afin.r0;
		aead_block_auth.r1 += aead_block_afin.r1;
		aead_block_auth.r2 += aead_block_afin.r2;
		aead_block_auth.r3 += aead_block_afin.r3;
		
		// Increment block counter
		++ad_block0;
		
	}
	
#ifdef DEBUG
	printf( "\nAuth before finalisation tag added: %016llx; %016llx; %016llx; %016llx;\n", aead_block_auth.r0, aead_block_auth.r1, aead_block_auth.r2, aead_block_auth.r3 );
#endif		
	
	// Final auth
	aead_params.block0 = m_block0 + ad_block0;
	aead_params.mode_bits = CRYPT_AUTHFINAL || CRYPT_HASNSEC  || CRYPT_HASNPUB || CRYPT_LASTBLOCK;
	aead_params.len = 256LLU;
	aead_auth_fin( &aead_params, &aead_block_afinkey, &aead_block_atkey );
	aead_block_auth.r0 += aead_block_atkey.r0;
	aead_block_auth.r1 += aead_block_atkey.r1;
	aead_block_auth.r2 += aead_block_atkey.r2;
	aead_block_auth.r3 += aead_block_atkey.r3;
	
#ifdef DEBUG
	printf( "\nAuth Tag: %016llx; %016llx; %016llx; %016llx;\n", aead_block_auth.r0, aead_block_auth.r1, aead_block_auth.r2, aead_block_auth.r3 );
#endif	
		
	// Add auth tag to end of ciphertext stream
	memcpy( (unsigned char*)cur_c, (unsigned char*)&aead_block_auth, sizeof( aead_block_t ) );
	
	// Before I forget, set the output clen
	*clen = mlen + BLOCKSIZE_BYTES;
	
	return 0;
}




int crypto_aead_decrypt(
    unsigned char *m,unsigned long long *outputmlen,
    unsigned char *nsec,
    const unsigned char *c,unsigned long long clen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k
) {
 
	// Set things up
	aead_params_t aead_params;	
	aead_params.k0 = *( (uint64_t*)( k + 0 ) );
	aead_params.k1 = *( (uint64_t*)( k + 8 ) );
	aead_params.k2 = *( (uint64_t*)( k + 16 ) );
	aead_params.k3 = *( (uint64_t*)( k + 24 ) );
	
	// Because I misread the requirements, got the secret number mixed-up
	// so have in effect removed the secret number and doubled size of
	// public number, for now at least.
	aead_params.p0 = *( (uint64_t*)( npub ) );
	aead_params.p1 = *( (uint64_t*)( npub + 8 ) );
	aead_params.s0 = *( (uint64_t*)( npub + 16 ) );
	aead_params.s1 = *( (uint64_t*)( npub + 24 ) );
	
	aead_block_t aead_block_afinkey;
	aead_block_afinkey.r0 = *( (uint64_t*)( k + 32 ) );
	aead_block_afinkey.r1 = *( (uint64_t*)( k + 40 ) );
	aead_block_afinkey.r2 = *( (uint64_t*)( k + 48 ) );
	aead_block_afinkey.r3 = *( (uint64_t*)( k + 56 ) );	
	
#ifdef DEBUG
	printf( "\n\n\n----------\n" );	
	printf( "K_c   : %016llx; %016llx; %016llx; %016llx;\n", aead_params.k0, aead_params.k1, aead_params.k2, aead_params.k3 );
	printf( "K_f   : %016llx; %016llx; %016llx; %016llx;\n", aead_block_afinkey.r0, aead_block_afinkey.r1, aead_block_afinkey.r2, aead_block_afinkey.r3 );
	printf( "npub  : %016llx; %016llx;\n", aead_params.p0, aead_params.p1 );
	printf( "nsec  : %016llx; %016llx;\n", aead_params.s0, aead_params.s1 );
	printf( "clan  : %016llx (%llu);\n", clen, clen );
	printf( "adlen : %016llx (%llu);\n", adlen, adlen );
	printf( "----------\n\n\n" );
#endif
	
	// Cur block stream cipher result
	aead_block_t aead_block_cfin = { 0LLU, 0LLU, 0LLU, 0LLU };
	
	// Cur block auth value returned key and result
	aead_block_t aead_block_atkey = { 0LLU, 0LLU, 0LLU, 0LLU };
	aead_block_t aead_block_afin = { 0LLU, 0LLU, 0LLU, 0LLU };
	
	// Cur working block
	aead_block_t aead_block_work = { 0LLU, 0LLU, 0LLU, 0LLU };

	// Comparator final tag
	aead_block_t aead_block_giventag = { 0LLU, 0LLU, 0LLU, 0LLU };
			
	// Total auth value result (word-wise addition of all previous values)
	aead_block_t aead_block_auth = { 0LLU, 0LLU, 0LLU, 0LLU };	
	
	// Pre-calc'd states
	aead_state_t pre_state = { 0LLU, 0LLU, 0LLU, 0LLU, 0LLU, 0LLU, 0LLU, 0LLU };	
	
	// Temp mask
	aead_state_t temp_mask = { 0LLU, 0LLU, 0LLU, 0LLU };
		
	// Calculate the message length (ciphertext length less the auth tag) 
	signed long long message_len = ( clen - BLOCKSIZE_BYTES );
	assert( message_len >= 0 );
	*outputmlen = message_len;
	
	// Counters and such like
	uint64_t m_block0 = 0LLU;
	uint64_t m_block1 = 0LLU; // Obviously we'll never get this far, more for the sake of completeness
	uint64_t ad_block0 = 0LLU;
	uint64_t ad_block1 = 0LLU; // Obviously we'll never get this far, more for the sake of completeness	
	uint64_t m_bytes_left = message_len;
	uint64_t ad_bytes_left = adlen;
	uint32_t cur_flags = 0LLU;
	
	// Current pointer within the input ciphertext buffer
	const unsigned char * cur_c = c;
	
	// Make sure we zero out the m buffer
	memset( m, 0, message_len );
	
	// Encrypt first
	while ( m_bytes_left > 0 ) {
	
		// Test whether we've got a whole 256-bit == 32 byte block to work with or not
		if ( m_bytes_left < BLOCKSIZE_BYTES ) {

			// Copy ciphertext into working state
			memset( (unsigned char*)&aead_block_work, 0, sizeof( aead_block_t ) );			
			memcpy( (unsigned char*)&aead_block_work, (unsigned char*)cur_c, m_bytes_left );
			cur_c += m_bytes_left;			
						
			// Setup parameters
			aead_params.block0 = m_block0;
			aead_params.block1 = 0LLU;
			aead_params.mode_bits = CRYPT_CIPHERTEXTBLOCK || CRYPT_HASNSEC  || CRYPT_HASNPUB || CRYPT_LASTBLOCK;
			aead_params.len = m_bytes_left * 8;
			
			// Set pre-calc mode(s) if not the first block
			cur_flags = 0LLU;
			cur_flags |= ( 0 == m_block0 ) ? 0 : FLG_PRE_CALC;
		
			// Calculate this block
			aead_enc_block( &aead_params, &pre_state, &aead_block_cfin, &aead_block_atkey, cur_flags  );
			
			// Because we calc auth on whole blocks, even the last, and the
			// cipher text doesn't have the last n bytes, we must use the
			// calculated result and mask it in.
			memset( (unsigned char*)&temp_mask, 0, BLOCKSIZE_BYTES );
			memset( (unsigned char*)(&temp_mask) + m_bytes_left, (char)0xff, BLOCKSIZE_BYTES - m_bytes_left );
			temp_mask.r0 &= aead_block_cfin.r0;
			temp_mask.r1 &= aead_block_cfin.r1;
			temp_mask.r2 &= aead_block_cfin.r2;
			temp_mask.r3 &= aead_block_cfin.r3;
			aead_block_work.r0 |= temp_mask.r0;
			aead_block_work.r1 |= temp_mask.r1;
			aead_block_work.r2 |= temp_mask.r2;
			aead_block_work.r3 |= temp_mask.r3;
						
			// Calculate auth for this block
			aead_block_afin.r0 = 0LLU;
			aead_block_afin.r1 = 0LLU;
			aead_block_afin.r2 = 0LLU;
			aead_block_afin.r3 = 0LLU;
			aead_auth_block( &aead_block_work, &aead_block_atkey, &aead_block_afin );			
			
			// XOR with plaintext
			aead_block_work.r0 ^= aead_block_cfin.r0;
			aead_block_work.r1 ^= aead_block_cfin.r1;
			aead_block_work.r2 ^= aead_block_cfin.r2;
			aead_block_work.r3 ^= aead_block_cfin.r3;
			
			// Partial block this time
			memcpy( (unsigned char*)m + ( m_block0 * BLOCKSIZE_BYTES ), (unsigned char*)&aead_block_work, m_bytes_left );
			
			// Decrement m_bytes_left to zero
			m_bytes_left = 0;
			
			
		} else {
		
			// Copy ciphertext into working state
			memset( (unsigned char*)&aead_block_work, 0, sizeof( aead_block_t ) );			
			memcpy( (unsigned char*)&aead_block_work, cur_c, BLOCKSIZE_BYTES );
			cur_c += BLOCKSIZE_BYTES;
						
			// Setup parameters
			aead_params.block0 = m_block0;
			aead_params.block1 = 0LLU;
			aead_params.mode_bits = CRYPT_CIPHERTEXTBLOCK || CRYPT_HASNSEC  || CRYPT_HASNPUB;
			aead_params.len = 256LLU;
			
			// Set pre-calc mode(s) if not the first block
			cur_flags = 0LLU;
			cur_flags |=  ( 0 == m_block0 ) ? 0 : FLG_PRE_CALC;

			// Calculate this block
			aead_enc_block( &aead_params, &pre_state, &aead_block_cfin, &aead_block_atkey, cur_flags  );
			
			// Calculate auth for this block
			aead_block_afin.r0 = 0LLU;
			aead_block_afin.r1 = 0LLU;
			aead_block_afin.r2 = 0LLU;
			aead_block_afin.r3 = 0LLU;
			aead_auth_block( &aead_block_work, &aead_block_atkey, &aead_block_afin );			
			
			// XOR with plaintext
			aead_block_work.r0 ^= aead_block_cfin.r0;
			aead_block_work.r1 ^= aead_block_cfin.r1;
			aead_block_work.r2 ^= aead_block_cfin.r2;
			aead_block_work.r3 ^= aead_block_cfin.r3;

			// We've got a whole block so it's easy			
			memcpy( (unsigned char*)m + ( m_block0 * BLOCKSIZE_BYTES ), (unsigned char*)&aead_block_work, BLOCKSIZE_BYTES );
			
			// Decrement m_bytes_left by blocksize
			m_bytes_left -= BLOCKSIZE_BYTES;
			
		}
		
		// Add word-wise into total auth value
		aead_block_auth.r0 += aead_block_afin.r0;
		aead_block_auth.r1 += aead_block_afin.r1;
		aead_block_auth.r2 += aead_block_afin.r2;
		aead_block_auth.r3 += aead_block_afin.r3;
			
		// Increment block counter
		++m_block0;
		
	}

	// Do ad
	while ( ad_bytes_left > 0 ) {
	
		// Test whether we've got a whole 256-bit == 32 byte block to work with or not
		if ( ad_bytes_left < BLOCKSIZE_BYTES ) {
				
			// Copy ad into working state
			memset( (unsigned char*)&aead_block_work, 0, sizeof( aead_block_t ) );			
			memcpy( (unsigned char*)&aead_block_work, (unsigned char*)ad + ( ad_block0 * BLOCKSIZE_BYTES ), ad_bytes_left );			
			
			// Setup parameters
			aead_params.block0 = ad_block0;
			aead_params.block1 = 0LLU;
			aead_params.mode_bits = CRYPT_ADBLOCK || CRYPT_HASNSEC  || CRYPT_HASNPUB || CRYPT_LASTBLOCK;
			aead_params.len = ad_bytes_left * 8;
			
			// Set pre-calc mode(s) if not the first block
			cur_flags = 0LLU;
			cur_flags |= ( 0 == ad_block0 ) ? 0 : FLG_PRE_CALC;
		
			// Calculate this block
			aead_enc_block( &aead_params, &pre_state, &aead_block_cfin, &aead_block_atkey, cur_flags  );
			
			// XOR with plaintext
			aead_block_work.r0 ^= aead_block_cfin.r0;
			aead_block_work.r1 ^= aead_block_cfin.r1;
			aead_block_work.r2 ^= aead_block_cfin.r2;
			aead_block_work.r3 ^= aead_block_cfin.r3;
			
			// Decrement ad_bytes_left to zero
			ad_bytes_left = 0;
			
			
		} else {
			
			// Copy ad into working state
			memset( (unsigned char*)&aead_block_work, 0, sizeof( aead_block_t ) );			
			memcpy( (unsigned char*)&aead_block_work, (unsigned char*)ad + ( ad_block0 * BLOCKSIZE_BYTES ), BLOCKSIZE_BYTES );			
			
			
			// Setup parameters
			aead_params.block0 = ad_block0;
			aead_params.block1 = 0LLU;
			aead_params.mode_bits = CRYPT_ADBLOCK || CRYPT_HASNSEC  || CRYPT_HASNPUB;
			aead_params.len = 256LLU;
			
			// Set pre-calc mode(s) if not the first block
			cur_flags = 0LLU;
			cur_flags |= ( 0 == ad_block0 ) ? 0 : FLG_PRE_CALC;

			// Calculate this block
			aead_enc_block( &aead_params, &pre_state, &aead_block_cfin, &aead_block_atkey, cur_flags  );
			
			// XOR with plaintext
			aead_block_work.r0 ^= aead_block_cfin.r0;
			aead_block_work.r1 ^= aead_block_cfin.r1;
			aead_block_work.r2 ^= aead_block_cfin.r2;
			aead_block_work.r3 ^= aead_block_cfin.r3;	
			
			// Decrement ad_bytes_left by blocksize
			ad_bytes_left -= BLOCKSIZE_BYTES;
			
		}
				
		// Calculate auth for this block
		aead_block_afin.r0 = 0LLU;
		aead_block_afin.r1 = 0LLU;
		aead_block_afin.r2 = 0LLU;
		aead_block_afin.r3 = 0LLU;
		aead_auth_block( &aead_block_work, &aead_block_atkey, &aead_block_afin );
		
		// Add word-wise into total auth value
		aead_block_auth.r0 += aead_block_afin.r0;
		aead_block_auth.r1 += aead_block_afin.r1;
		aead_block_auth.r2 += aead_block_afin.r2;
		aead_block_auth.r3 += aead_block_afin.r3;
		
		// Increment block counter
		++ad_block0;
		
	}

#ifdef DEBUG
	printf( "\nAuth before finalisation tag added: %016llx; %016llx; %016llx; %016llx;\n", aead_block_auth.r0, aead_block_auth.r1, aead_block_auth.r2, aead_block_auth.r3 );
#endif	
		
	// Final auth
	aead_params.block0 = m_block0 + ad_block0;
	aead_params.mode_bits = CRYPT_AUTHFINAL || CRYPT_HASNSEC  || CRYPT_HASNPUB || CRYPT_LASTBLOCK;
	aead_params.len = 256LLU;
	aead_auth_fin( &aead_params, &aead_block_afinkey, &aead_block_atkey );
	aead_block_auth.r0 += aead_block_atkey.r0;
	aead_block_auth.r1 += aead_block_atkey.r1;
	aead_block_auth.r2 += aead_block_atkey.r2;
	aead_block_auth.r3 += aead_block_atkey.r3;
	
#ifdef DEBUG
	printf( "\nAuth Tag: %016llx; %016llx; %016llx; %016llx;\n", aead_block_auth.r0, aead_block_auth.r1, aead_block_auth.r2, aead_block_auth.r3 );
#endif	
	
	// Compare auth tags
	memcpy( (unsigned char*)&aead_block_giventag, (unsigned char*)cur_c, BLOCKSIZE_BYTES );
	if ( 	( aead_block_auth.r0 == aead_block_giventag.r0 ) &&
			( aead_block_auth.r1 == aead_block_giventag.r1 ) &&
			( aead_block_auth.r2 == aead_block_giventag.r2 ) &&
			( aead_block_auth.r3 == aead_block_giventag.r3 ) ) {
		
		return 0;
	
	} else {
	
		return -1;
		
	}
	
	
}


	/*
	unsigned char ourconst[] = "Gloomy Winter's noo awa'; saft the westlin' breezes blaw. 1808\n";
	int ourconstlen = strlen( ourconst );
	printf( "String: %s\nLength: %d\n", ourconst, ourconstlen );
	
	aead_block_t aead_block_ourconst = { 0LLU, 0LLU, 0LLU, 0LLU };
	aead_bytestream_to_u64block( ourconst, &aead_block_ourconst, 0, 32 );
	aead_bytestream_to_u64block( ourconst, &aead_block_ourconst, 32, 32 ); */

