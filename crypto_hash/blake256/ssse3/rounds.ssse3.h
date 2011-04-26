buf1 = _mm_set_epi32(m.u32[6], m.u32[4], m.u32[2], m.u32[0]);

buf2 = _mm_set_epi32(3964562569, 698298832, 57701188, 2242054355);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(137296536, 2752067618, 320440878, 608135816);
buf2 = _mm_set_epi32(m.u32[7], m.u32[5], m.u32[3], m.u32[1]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[14], m.u32[12], m.u32[10], m.u32[8]);

buf2 = _mm_set_epi32(3041331479, 3380367581, 887688300, 953160567);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(1065670069, 3232508343, 3193202383, 1160258022);
buf2 = _mm_set_epi32(m.u32[15], m.u32[13], m.u32[11], m.u32[9]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[13], m.u32[9], m.u32[4], m.u32[14]);

buf2 = _mm_set_epi32(137296536, 3041331479, 1160258022, 3193202383);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3380367581, 953160567, 2752067618, 1065670069);
buf2 = _mm_set_epi32(m.u32[6], m.u32[15], m.u32[8], m.u32[10]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[5], m.u32[11], m.u32[0], m.u32[1]);

buf2 = _mm_set_epi32(57701188, 3964562569, 320440878, 3232508343);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(698298832, 887688300, 608135816, 2242054355);
buf2 = _mm_set_epi32(m.u32[3], m.u32[7], m.u32[2], m.u32[12]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[15], m.u32[5], m.u32[12], m.u32[11]);

buf2 = _mm_set_epi32(3380367581, 320440878, 608135816, 1160258022);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3041331479, 698298832, 3232508343, 887688300);
buf2 = _mm_set_epi32(m.u32[13], m.u32[2], m.u32[0], m.u32[8]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[9], m.u32[7], m.u32[3], m.u32[10]);

buf2 = _mm_set_epi32(2752067618, 2242054355, 137296536, 1065670069);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(953160567, 3964562569, 57701188, 3193202383);
buf2 = _mm_set_epi32(m.u32[4], m.u32[1], m.u32[6], m.u32[14]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[11], m.u32[13], m.u32[3], m.u32[7]);

buf2 = _mm_set_epi32(1065670069, 3232508343, 2242054355, 953160567);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(887688300, 3380367581, 57701188, 3964562569);
buf2 = _mm_set_epi32(m.u32[14], m.u32[12], m.u32[1], m.u32[9]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[15], m.u32[4], m.u32[5], m.u32[2]);

buf2 = _mm_set_epi32(1160258022, 608135816, 3193202383, 137296536);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3041331479, 2752067618, 698298832, 320440878);
buf2 = _mm_set_epi32(m.u32[8], m.u32[0], m.u32[10], m.u32[6]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[10], m.u32[2], m.u32[5], m.u32[9]);

buf2 = _mm_set_epi32(3041331479, 2752067618, 3964562569, 608135816);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3193202383, 320440878, 698298832, 953160567);
buf2 = _mm_set_epi32(m.u32[15], m.u32[4], m.u32[7], m.u32[0]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[3], m.u32[6], m.u32[11], m.u32[14]);

buf2 = _mm_set_epi32(3380367581, 1160258022, 3232508343, 2242054355);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(57701188, 137296536, 887688300, 1065670069);
buf2 = _mm_set_epi32(m.u32[13], m.u32[8], m.u32[12], m.u32[1]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[8], m.u32[0], m.u32[6], m.u32[2]);

buf2 = _mm_set_epi32(57701188, 887688300, 3193202383, 3232508343);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(1160258022, 608135816, 137296536, 320440878);
buf2 = _mm_set_epi32(m.u32[3], m.u32[11], m.u32[10], m.u32[12]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[1], m.u32[15], m.u32[7], m.u32[4]);

buf2 = _mm_set_epi32(953160567, 1065670069, 698298832, 3380367581);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(2242054355, 3041331479, 3964562569, 2752067618);
buf2 = _mm_set_epi32(m.u32[9], m.u32[14], m.u32[5], m.u32[13]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[4], m.u32[14], m.u32[1], m.u32[12]);

buf2 = _mm_set_epi32(3193202383, 3380367581, 3041331479, 698298832);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(2752067618, 1065670069, 2242054355, 3232508343);
buf2 = _mm_set_epi32(m.u32[10], m.u32[13], m.u32[15], m.u32[5]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[8], m.u32[9], m.u32[6], m.u32[0]);

buf2 = _mm_set_epi32(887688300, 320440878, 57701188, 3964562569);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(1160258022, 953160567, 137296536, 608135816);
buf2 = _mm_set_epi32(m.u32[11], m.u32[2], m.u32[3], m.u32[7]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[3], m.u32[12], m.u32[7], m.u32[13]);

buf2 = _mm_set_epi32(953160567, 2242054355, 1065670069, 887688300);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(57701188, 3232508343, 3964562569, 3380367581);
buf2 = _mm_set_epi32(m.u32[9], m.u32[1], m.u32[14], m.u32[11]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[2], m.u32[8], m.u32[15], m.u32[5]);

buf2 = _mm_set_epi32(3193202383, 137296536, 2752067618, 608135816);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(320440878, 1160258022, 3041331479, 698298832);
buf2 = _mm_set_epi32(m.u32[10], m.u32[6], m.u32[4], m.u32[0]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[0], m.u32[11], m.u32[14], m.u32[6]);

buf2 = _mm_set_epi32(1160258022, 57701188, 953160567, 3041331479);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(608135816, 887688300, 1065670069, 137296536);
buf2 = _mm_set_epi32(m.u32[8], m.u32[3], m.u32[9], m.u32[15]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[10], m.u32[1], m.u32[13], m.u32[12]);

buf2 = _mm_set_epi32(698298832, 2752067618, 3964562569, 320440878);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3193202383, 2242054355, 3380367581, 3232508343);
buf2 = _mm_set_epi32(m.u32[5], m.u32[4], m.u32[7], m.u32[2]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[1], m.u32[7], m.u32[8], m.u32[10]);

buf2 = _mm_set_epi32(698298832, 137296536, 2752067618, 320440878);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(2242054355, 3964562569, 1160258022, 3193202383);
buf2 = _mm_set_epi32(m.u32[5], m.u32[6], m.u32[4], m.u32[2]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[13], m.u32[3], m.u32[9], m.u32[15]);

buf2 = _mm_set_epi32(608135816, 3232508343, 1065670069, 887688300);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3380367581, 57701188, 953160567, 3041331479);
buf2 = _mm_set_epi32(m.u32[0], m.u32[12], m.u32[14], m.u32[11]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[6], m.u32[4], m.u32[2], m.u32[0]);

buf2 = _mm_set_epi32(3964562569, 698298832, 57701188, 2242054355);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(137296536, 2752067618, 320440878, 608135816);
buf2 = _mm_set_epi32(m.u32[7], m.u32[5], m.u32[3], m.u32[1]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[14], m.u32[12], m.u32[10], m.u32[8]);

buf2 = _mm_set_epi32(3041331479, 3380367581, 887688300, 953160567);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(1065670069, 3232508343, 3193202383, 1160258022);
buf2 = _mm_set_epi32(m.u32[15], m.u32[13], m.u32[11], m.u32[9]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[13], m.u32[9], m.u32[4], m.u32[14]);

buf2 = _mm_set_epi32(137296536, 3041331479, 1160258022, 3193202383);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3380367581, 953160567, 2752067618, 1065670069);
buf2 = _mm_set_epi32(m.u32[6], m.u32[15], m.u32[8], m.u32[10]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[5], m.u32[11], m.u32[0], m.u32[1]);

buf2 = _mm_set_epi32(57701188, 3964562569, 320440878, 3232508343);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(698298832, 887688300, 608135816, 2242054355);
buf2 = _mm_set_epi32(m.u32[3], m.u32[7], m.u32[2], m.u32[12]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[15], m.u32[5], m.u32[12], m.u32[11]);

buf2 = _mm_set_epi32(3380367581, 320440878, 608135816, 1160258022);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3041331479, 698298832, 3232508343, 887688300);
buf2 = _mm_set_epi32(m.u32[13], m.u32[2], m.u32[0], m.u32[8]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[9], m.u32[7], m.u32[3], m.u32[10]);

buf2 = _mm_set_epi32(2752067618, 2242054355, 137296536, 1065670069);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(953160567, 3964562569, 57701188, 3193202383);
buf2 = _mm_set_epi32(m.u32[4], m.u32[1], m.u32[6], m.u32[14]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
buf1 = _mm_set_epi32(m.u32[11], m.u32[13], m.u32[3], m.u32[7]);

buf2 = _mm_set_epi32(1065670069, 3232508343, 2242054355, 953160567);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(887688300, 3380367581, 57701188, 3964562569);
buf2 = _mm_set_epi32(m.u32[14], m.u32[12], m.u32[1], m.u32[9]);

row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); 
buf1 = _mm_set_epi32(m.u32[15], m.u32[4], m.u32[5], m.u32[2]);

buf2 = _mm_set_epi32(1160258022, 608135816, 3193202383, 137296536);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3041331479, 2752067618, 698298832, 320440878);
buf2 = _mm_set_epi32(m.u32[8], m.u32[0], m.u32[10], m.u32[6]);

row4 = _mm_xor_si128( row4, row1 ); 
buf1 = _mm_xor_si128( buf1, buf2); 
row4 = _mm_shuffle_epi8(row4, r16);
row3 = _mm_add_epi32( row3, row4 );   
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); 
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); 
row4 = _mm_xor_si128( row4, row1 ); 
row4 = _mm_shuffle_epi8(row4, r8);
row3 = _mm_add_epi32( row3, row4 );   
row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); 
row2 = _mm_xor_si128( row2, row3 ); 
row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); 

row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); 
row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); 
