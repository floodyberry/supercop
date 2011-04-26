
/*
 *
 * m0 = (m3,   m2,  m1,  m0)
 * m1 = (m7,   m6,  m5,  m4)
 * m2 = (m11, m10,  m9,  m8)
 * m3 = (m15, m14, m13, m12)
 *
 */

tmp0 = _mm_unpacklo_epi32(m0, m1);
tmp1 = _mm_unpackhi_epi32(m0, m1);
buf1 = _mm_unpacklo_epi32(tmp0, tmp1);


//buf1 = _mm_set_epi32(m[6], m[4], m[2], m[0]);
buf2 = _mm_set_epi32(3964562569, 698298832, 57701188, 2242054355);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(137296536, 2752067618, 320440878, 608135816);
buf2 = _mm_unpackhi_epi32(tmp0, tmp1);

//buf2 = _mm_set_epi32(m[7], m[5], m[3], m[1]);
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

tmp0 = _mm_unpacklo_epi32(m2, m3);
tmp1 = _mm_unpackhi_epi32(m2, m3);
buf1 = _mm_unpacklo_epi32(tmp0, tmp1);


//buf1 = _mm_set_epi32(m[14], m[12], m[10], m[8]);
buf2 = _mm_set_epi32(3041331479, 3380367581, 887688300, 953160567);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(1065670069, 3232508343, 3193202383, 1160258022);
buf2 = _mm_unpackhi_epi32(tmp0, tmp1);

//buf2 = _mm_set_epi32(m[15], m[13], m[11], m[9]);
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

tmp0 = _mm_blend_epi16(m1, m2, 0x0C);
tmp1 = _mm_slli_si128(m3, 4);
tmp2 = _mm_blend_epi16(tmp0, tmp1, 0xF0);
buf1 = _mm_shuffle_epi32(tmp2, _MM_SHUFFLE(2,1,0,3));
tmp3 = _mm_shuffle_epi32(m2,_MM_SHUFFLE(0,0,2,0));
tmp4 = _mm_blend_epi16(m1,m3,0xC0);
tmp5 = _mm_blend_epi16(tmp3, tmp4, 0xF0);


//buf1 = _mm_set_epi32(m[13], m[9], m[4], m[14]);
buf2 = _mm_set_epi32(137296536, 3041331479, 1160258022, 3193202383);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3380367581, 953160567, 2752067618, 1065670069);
buf2 = _mm_shuffle_epi32(tmp5, _MM_SHUFFLE(2,3,0,1));

//buf2 = _mm_set_epi32(m[6], m[15], m[8], m[10]);
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

tmp0 = _mm_slli_si128(m1, 4);
tmp1 = _mm_blend_epi16(m2, tmp0, 0x30);
tmp2 = _mm_blend_epi16(m0, tmp1, 0xF0);
buf1 = _mm_shuffle_epi32(tmp2, _MM_SHUFFLE(2,3,0,1));
tmp4 = _mm_unpackhi_epi32(m0,m1);
tmp5 = _mm_slli_si128(m3, 4);
tmp6 = _mm_blend_epi16(tmp4, tmp5, 0x0C);

//buf1 = _mm_set_epi32(m[5], m[11], m[0], m[1]);
buf2 = _mm_set_epi32(57701188, 3964562569, 320440878, 3232508343);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(698298832, 887688300, 608135816, 2242054355);

buf2 = _mm_shuffle_epi32(tmp6, _MM_SHUFFLE(2,3,0,1));

//buf2 = _mm_set_epi32(m[3], m[7], m[2], m[12]);
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

tmp0 = _mm_unpackhi_epi32(m2,m3);
tmp1 = _mm_blend_epi16(m3,m1,0x0C);
tmp2 = _mm_blend_epi16(tmp0, tmp1, 0x0F);
buf1 = _mm_shuffle_epi32(tmp2, _MM_SHUFFLE(3,1,0,2));
tmp4 = _mm_unpacklo_epi32(m2,m0); // m0 m8
tmp5 = _mm_blend_epi16(tmp4, m0, 0xF0); // m2 m0 m8
tmp6 = _mm_slli_si128(m3, 8); // m13

//buf1 = _mm_set_epi32(m[15], m[5], m[12], m[11]);
buf2 = _mm_set_epi32(3380367581, 320440878, 608135816, 1160258022);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3041331479, 698298832, 3232508343, 887688300);
buf2 = _mm_blend_epi16(tmp5, tmp6, 0xC0);

//buf2 = _mm_set_epi32(m[13], m[2], m[0], m[8]);
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

tmp0 = _mm_blend_epi16(m0, m2, 0x3C); // m3 m10 m9 m0
tmp1 = _mm_srli_si128(m1, 12); // 0 0 0 m7
tmp2 = _mm_blend_epi16(tmp0,tmp1,0x03); // m3 m10 m9 m7
buf1 = _mm_shuffle_epi32(tmp2, _MM_SHUFFLE(1,0,3,2));
tmp4 = _mm_slli_si128(m3, 4);
tmp5 = _mm_blend_epi16(m0, m1, 0x33);
tmp6 = _mm_blend_epi16(tmp5, tmp4, 0xc0);

//buf1 = _mm_set_epi32(m[9], m[7], m[3], m[10]);
buf2 = _mm_set_epi32(2752067618, 2242054355, 137296536, 1065670069);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(953160567, 3964562569, 57701188, 3193202383);
buf2 = _mm_shuffle_epi32(tmp6, _MM_SHUFFLE(0,1,2,3));

//buf2 = _mm_set_epi32(m[4], m[1], m[6], m[14]);
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

tmp0 = _mm_unpackhi_epi32(m0,m1);
tmp1 = _mm_unpackhi_epi32(tmp0, m2); // m11 m7 m10 m3 
tmp2 = _mm_blend_epi16(tmp1, m3, 0x0C); // m11 m7 m13 m3
buf1 = _mm_shuffle_epi32(tmp2, _MM_SHUFFLE(3,1,0,2));
tmp4 = _mm_slli_si128(m2, 8);
tmp5 = _mm_blend_epi16(m3,m0,0x0C);
tmp6 = _mm_blend_epi16(tmp5, tmp4, 0xC0);

//buf1 = _mm_set_epi32(m[11], m[13], m[3], m[7]);
buf2 = _mm_set_epi32(1065670069, 3232508343, 2242054355, 953160567);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(887688300, 3380367581, 57701188, 3964562569);
buf2 = _mm_shuffle_epi32(tmp6, _MM_SHUFFLE(2,0,1,3));

//buf2 = _mm_set_epi32(m[14], m[12], m[1], m[9]);
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

tmp0 = _mm_blend_epi16(m0,m1,0x0F);
tmp1 = _mm_blend_epi16(tmp0, m3, 0xC0);
buf1 = _mm_shuffle_epi32(tmp1, _MM_SHUFFLE(3,0,1,2));
tmp4 = _mm_unpacklo_epi32(m0,m2); // m8  m0
tmp5 = _mm_unpackhi_epi32(m1,m2); // m10 m6

//buf1 = _mm_set_epi32(m[15], m[4], m[5], m[2]);
buf2 = _mm_set_epi32(1160258022, 608135816, 3193202383, 137296536);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3041331479, 2752067618, 698298832, 320440878);

buf2 = _mm_unpacklo_epi64(tmp5,tmp4);

//buf2 = _mm_set_epi32(m[8], m[0], m[10], m[6]);
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

tmp0 = _mm_unpacklo_epi64(m1,m2); // m9 m8 m5 m4
tmp1 = _mm_unpackhi_epi64(m0,m2); // m11 m10 m3 m2
tmp2 = _mm_blend_epi16(tmp0,tmp1,0x33); // m9 m10 m5 m2
buf1 = _mm_shuffle_epi32(tmp2, _MM_SHUFFLE(2,0,1,3));
tmp4 = _mm_unpackhi_epi64(m1,m3); // m15 m14 m7 m6
tmp5 = _mm_unpacklo_epi64(m0,m1); //  m5  m4 m1 m0 

//buf1 = _mm_set_epi32(m[10], m[2], m[5], m[9]);
buf2 = _mm_set_epi32(3041331479, 2752067618, 3964562569, 608135816);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3193202383, 320440878, 698298832, 953160567);
buf2 = _mm_blend_epi16(tmp4,tmp5,0x33);

//buf2 = _mm_set_epi32(m[15], m[4], m[7], m[0]);
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

tmp0 = _mm_unpackhi_epi64(m3,m1); //  m7  m6 m15 m14
tmp1 = _mm_unpackhi_epi64(m2,m0); //  m3  m2 m11 m10
buf1 = _mm_blend_epi16(tmp1,tmp0,0x33);
tmp4 = _mm_blend_epi16(m0,m2,0x03);
tmp5 = _mm_slli_si128(tmp4, 8);
tmp6 = _mm_blend_epi16(tmp5,m3,0x0F);

//buf1 = _mm_set_epi32(m[3], m[6], m[11], m[14]);
buf2 = _mm_set_epi32(3380367581, 1160258022, 3232508343, 2242054355);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(57701188, 137296536, 887688300, 1065670069);
buf2 = _mm_shuffle_epi32(tmp6, _MM_SHUFFLE(1,2,0,3));

//buf2 = _mm_set_epi32(m[13], m[8], m[12], m[1]);
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

tmp0 = _mm_unpackhi_epi32(m0,m1);
tmp1 = _mm_unpacklo_epi32(m0,m2);
buf1 = _mm_unpacklo_epi64(tmp0,tmp1);
tmp4 = _mm_srli_si128(m2, 4);
tmp5 = _mm_blend_epi16(m0,m3,0x03);

//buf1 = _mm_set_epi32(m[8], m[0], m[6], m[2]);
buf2 = _mm_set_epi32(57701188, 887688300, 3193202383, 3232508343);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(1160258022, 608135816, 137296536, 320440878);
buf2 = _mm_blend_epi16(tmp5,tmp4,0x3c);

//buf2 = _mm_set_epi32(m[3], m[11], m[10], m[12]);
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

tmp0 = _mm_blend_epi16(m1,m0,0x0C);
tmp1 = _mm_srli_si128(m3, 4);
tmp2 = _mm_blend_epi16(tmp0,tmp1,0x30);
buf1 = _mm_shuffle_epi32(tmp2, _MM_SHUFFLE(1,2,3,0));
tmp4 = _mm_unpacklo_epi64(m1,m2);
tmp5 = _mm_shuffle_epi32(m3, _MM_SHUFFLE(0,2,0,1));

//buf1 = _mm_set_epi32(m[1], m[15], m[7], m[4]);
buf2 = _mm_set_epi32(953160567, 1065670069, 698298832, 3380367581);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(2242054355, 3041331479, 3964562569, 2752067618);
buf2 = _mm_blend_epi16(tmp4,tmp5,0x33);

//buf2 = _mm_set_epi32(m[9], m[14], m[5], m[13]);
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

tmp0 = _mm_slli_si128(m1, 12);
tmp1 = _mm_blend_epi16(m0,m3,0x33);
buf1 = _mm_blend_epi16(tmp1,tmp0,0xC0);
tmp4 = _mm_blend_epi16(m3,m2,0x30);
tmp5 = _mm_srli_si128(m1, 4);
tmp6 = _mm_blend_epi16(tmp4,tmp5,0x03);

//buf1 = _mm_set_epi32(m[4], m[14], m[1], m[12]);
buf2 = _mm_set_epi32(3193202383, 3380367581, 3041331479, 698298832);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(2752067618, 1065670069, 2242054355, 3232508343);
buf2 = _mm_shuffle_epi32(tmp6, _MM_SHUFFLE(2,1,3,0));

//buf2 = _mm_set_epi32(m[10], m[13], m[15], m[5]);
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

tmp0 = _mm_unpacklo_epi64(m0,m2);
tmp1 = _mm_srli_si128(m1, 4);
buf1 = _mm_shuffle_epi32(_mm_blend_epi16(tmp0,tmp1,0x0C), _MM_SHUFFLE(2,3,1,0));
tmp4 = _mm_unpackhi_epi32(m1,m2);
tmp5 = _mm_unpackhi_epi64(m0,tmp4);

//buf1 = _mm_set_epi32(m[8], m[9], m[6], m[0]);
buf2 = _mm_set_epi32(887688300, 320440878, 57701188, 3964562569);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(1160258022, 953160567, 137296536, 608135816);

buf2 = _mm_shuffle_epi32(tmp5, _MM_SHUFFLE(3,0,1,2));

//buf2 = _mm_set_epi32(m[11], m[2], m[3], m[7]);
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

tmp0 = _mm_unpackhi_epi32(m0,m1);
tmp1 = _mm_blend_epi16(tmp0,m3,0x0F);
buf1 = _mm_shuffle_epi32(tmp1,_MM_SHUFFLE(2,0,3,1));
tmp4 = _mm_blend_epi16(m2,m3,0x30);
tmp5 = _mm_srli_si128(m0,4);
tmp6 = _mm_blend_epi16(tmp4,tmp5,0x03); // 11 14 9 1

//buf1 = _mm_set_epi32(m[3], m[12], m[7], m[13]);
buf2 = _mm_set_epi32(953160567, 2242054355, 1065670069, 887688300);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(57701188, 3232508343, 3964562569, 3380367581);
buf2 = _mm_shuffle_epi32(tmp6, _MM_SHUFFLE(1,0,2,3));

//buf2 = _mm_set_epi32(m[9], m[1], m[14], m[11]);
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

tmp0 = _mm_unpackhi_epi64(m0,m3);
tmp1 = _mm_unpacklo_epi64(m1,m2);
tmp2 = _mm_blend_epi16(tmp0,tmp1,0x3C);
buf1 = _mm_shuffle_epi32(tmp2,_MM_SHUFFLE(0,2,3,1));
tmp4 = _mm_unpacklo_epi32(m0,m1);
tmp5 = _mm_unpackhi_epi32(m1,m2);

//buf1 = _mm_set_epi32(m[2], m[8], m[15], m[5]);
buf2 = _mm_set_epi32(3193202383, 137296536, 2752067618, 608135816);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(320440878, 1160258022, 3041331479, 698298832);
buf2 = _mm_unpacklo_epi64(tmp4,tmp5);

//buf2 = _mm_set_epi32(m[10], m[6], m[4], m[0]);
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

tmp0 = _mm_unpackhi_epi32(m1,m3); // X X m14 m6
tmp1 = _mm_unpacklo_epi64(tmp0,m0); // m1 m0 m14 m6
tmp2 = _mm_blend_epi16(tmp1,m2,0xC0); // m11 m0 m14 m6
buf1 = _mm_shufflehi_epi16(tmp2,_MM_SHUFFLE(1,0,3,2));
tmp4 = _mm_unpackhi_epi32(m0,m3);
tmp5 = _mm_blend_epi16(m2,tmp4,0xF0);

//buf1 = _mm_set_epi32(m[0], m[11], m[14], m[6]);
buf2 = _mm_set_epi32(1160258022, 57701188, 953160567, 3041331479);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(608135816, 887688300, 1065670069, 137296536);
buf2 = _mm_shuffle_epi32(tmp5,_MM_SHUFFLE(0,2,1,3));

//buf2 = _mm_set_epi32(m[8], m[3], m[9], m[15]);
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

tmp0 = _mm_blend_epi16(m2,m0,0x0C);
tmp1 = _mm_slli_si128(tmp0,4);
buf1 = _mm_blend_epi16(tmp1,m3,0x0F);
tmp4 = _mm_blend_epi16(m1,m0,0x30);

//buf1 = _mm_set_epi32(m[10], m[1], m[13], m[12]);
buf2 = _mm_set_epi32(698298832, 2752067618, 3964562569, 320440878);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3193202383, 2242054355, 3380367581, 3232508343);
buf2 = _mm_shuffle_epi32(tmp4,_MM_SHUFFLE(1,0,3,2));

//buf2 = _mm_set_epi32(m[5], m[4], m[7], m[2]);
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

tmp0 = _mm_blend_epi16(m0,m2,0x03); // 1 8
tmp1 = _mm_blend_epi16(m1,m2,0x30); // 7 10
tmp2 = _mm_blend_epi16(tmp1,tmp0,0x0F); // 7 10 1 8
buf1 = _mm_shuffle_epi32(tmp2,_MM_SHUFFLE(1,3,0,2));
tmp4 = _mm_slli_si128(m0,4);
tmp5 = _mm_blend_epi16(m1,tmp4,0xC0);

//buf1 = _mm_set_epi32(m[1], m[7], m[8], m[10]);
buf2 = _mm_set_epi32(698298832, 137296536, 2752067618, 320440878);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(2242054355, 3964562569, 1160258022, 3193202383);
buf2 = _mm_shuffle_epi32(tmp5,_MM_SHUFFLE(1,2,0,3));

//buf2 = _mm_set_epi32(m[5], m[6], m[4], m[2]);
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

tmp0 = _mm_unpackhi_epi32(m0,m3); // 15 3
tmp1 = _mm_unpacklo_epi32(m2,m3); // 13 9
tmp2 = _mm_unpackhi_epi64(tmp0,tmp1); // 13 9 15 3
buf1 = _mm_shuffle_epi32(tmp2,_MM_SHUFFLE(3,0,2,1));
tmp4 = _mm_blend_epi16(m3,m2,0xC0);
tmp5 = _mm_unpacklo_epi32(m0,m3);
tmp6 = _mm_blend_epi16(tmp4,tmp5,0x0F); // 11 14 12 0

//buf1 = _mm_set_epi32(m[13], m[3], m[9], m[15]);
buf2 = _mm_set_epi32(608135816, 3232508343, 1065670069, 887688300);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3380367581, 57701188, 953160567, 3041331479);
buf2 = _mm_shuffle_epi32(tmp6,_MM_SHUFFLE(0,1,2,3));

//buf2 = _mm_set_epi32(m[0], m[12], m[14], m[11]);
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

tmp0 = _mm_unpacklo_epi32(m0, m1);
tmp1 = _mm_unpackhi_epi32(m0, m1);
buf1 = _mm_unpacklo_epi32(tmp0, tmp1);

//buf1 = _mm_set_epi32(m[6], m[4], m[2], m[0]);
buf2 = _mm_set_epi32(3964562569, 698298832, 57701188, 2242054355);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(137296536, 2752067618, 320440878, 608135816);
buf2 = _mm_unpackhi_epi32(tmp0, tmp1);

//buf2 = _mm_set_epi32(m[7], m[5], m[3], m[1]);
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

tmp0 = _mm_unpacklo_epi32(m2, m3);
tmp1 = _mm_unpackhi_epi32(m2, m3);
buf1 = _mm_unpacklo_epi32(tmp0, tmp1);

//buf1 = _mm_set_epi32(m[14], m[12], m[10], m[8]);
buf2 = _mm_set_epi32(3041331479, 3380367581, 887688300, 953160567);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(1065670069, 3232508343, 3193202383, 1160258022);
buf2 = _mm_unpackhi_epi32(tmp0, tmp1);

//buf2 = _mm_set_epi32(m[15], m[13], m[11], m[9]);
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

tmp0 = _mm_blend_epi16(m1, m2, 0x0C);
tmp1 = _mm_slli_si128(m3, 4);
tmp2 = _mm_blend_epi16(tmp0, tmp1, 0xF0);
buf1 = _mm_shuffle_epi32(tmp2, _MM_SHUFFLE(2,1,0,3));
tmp3 = _mm_shuffle_epi32(m2,_MM_SHUFFLE(0,0,2,0));
tmp4 = _mm_blend_epi16(m1,m3,0xC0);
tmp5 = _mm_blend_epi16(tmp3, tmp4, 0xF0);

//buf1 = _mm_set_epi32(m[13], m[9], m[4], m[14]);
buf2 = _mm_set_epi32(137296536, 3041331479, 1160258022, 3193202383);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3380367581, 953160567, 2752067618, 1065670069);
buf2 = _mm_shuffle_epi32(tmp5, _MM_SHUFFLE(2,3,0,1));

//buf2 = _mm_set_epi32(m[6], m[15], m[8], m[10]);
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

tmp0 = _mm_slli_si128(m1, 4);
tmp1 = _mm_blend_epi16(m2, tmp0, 0x30);
tmp2 = _mm_blend_epi16(m0, tmp1, 0xF0);
buf1 = _mm_shuffle_epi32(tmp2, _MM_SHUFFLE(2,3,0,1));
tmp4 = _mm_unpackhi_epi32(m0,m1);
tmp5 = _mm_slli_si128(m3, 4);
tmp6 = _mm_blend_epi16(tmp4, tmp5, 0x0C);

//buf1 = _mm_set_epi32(m[5], m[11], m[0], m[1]);
buf2 = _mm_set_epi32(57701188, 3964562569, 320440878, 3232508343);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(698298832, 887688300, 608135816, 2242054355);

buf2 = _mm_shuffle_epi32(tmp6, _MM_SHUFFLE(2,3,0,1));

//buf2 = _mm_set_epi32(m[3], m[7], m[2], m[12]);
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

tmp0 = _mm_unpackhi_epi32(m2,m3);
tmp1 = _mm_blend_epi16(m3,m1,0x0C);
tmp2 = _mm_blend_epi16(tmp0, tmp1, 0x0F);
buf1 = _mm_shuffle_epi32(tmp2, _MM_SHUFFLE(3,1,0,2));
tmp4 = _mm_unpacklo_epi32(m2,m0); // m0 m8
tmp5 = _mm_blend_epi16(tmp4, m0, 0xF0); // m2 m0 m8
tmp6 = _mm_slli_si128(m3, 8); // m13


//buf1 = _mm_set_epi32(m[15], m[5], m[12], m[11]);
buf2 = _mm_set_epi32(3380367581, 320440878, 608135816, 1160258022);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3041331479, 698298832, 3232508343, 887688300);
buf2 = _mm_blend_epi16(tmp5, tmp6, 0xC0);

//buf2 = _mm_set_epi32(m[13], m[2], m[0], m[8]);
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

tmp0 = _mm_blend_epi16(m0, m2, 0x3C); // m3 m10 m9 m0
tmp1 = _mm_srli_si128(m1, 12); // 0 0 0 m7
tmp2 = _mm_blend_epi16(tmp0,tmp1,0x03); // m3 m10 m9 m7
buf1 = _mm_shuffle_epi32(tmp2, _MM_SHUFFLE(1,0,3,2));
tmp4 = _mm_slli_si128(m3, 4);
tmp5 = _mm_blend_epi16(m0, m1, 0x33);
tmp6 = _mm_blend_epi16(tmp5, tmp4, 0xc0);

 
//buf1 = _mm_set_epi32(m[9], m[7], m[3], m[10]);
buf2 = _mm_set_epi32(2752067618, 2242054355, 137296536, 1065670069);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(953160567, 3964562569, 57701188, 3193202383);
buf2 = _mm_shuffle_epi32(tmp6, _MM_SHUFFLE(0,1,2,3));

//buf2 = _mm_set_epi32(m[4], m[1], m[6], m[14]);
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

tmp0 = _mm_unpackhi_epi32(m0,m1);
tmp1 = _mm_unpackhi_epi32(tmp0, m2); // m11 m7 m10 m3
tmp2 = _mm_blend_epi16(tmp1, m3, 0x0C); // m11 m7 m13 m3
buf1 = _mm_shuffle_epi32(tmp2, _MM_SHUFFLE(3,1,0,2));
tmp4 = _mm_slli_si128(m2, 8);
tmp5 = _mm_blend_epi16(m3,m0,0x0C);
tmp6 = _mm_blend_epi16(tmp5, tmp4, 0xC0);

 
//buf1 = _mm_set_epi32(m[11], m[13], m[3], m[7]);
buf2 = _mm_set_epi32(1065670069, 3232508343, 2242054355, 953160567);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(887688300, 3380367581, 57701188, 3964562569);
buf2 = _mm_shuffle_epi32(tmp6, _MM_SHUFFLE(2,0,1,3));

//buf2 = _mm_set_epi32(m[14], m[12], m[1], m[9]);
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

tmp0 = _mm_blend_epi16(m0,m1,0x0F);
tmp1 = _mm_blend_epi16(tmp0, m3, 0xC0);
buf1 = _mm_shuffle_epi32(tmp1, _MM_SHUFFLE(3,0,1,2));
tmp4 = _mm_unpacklo_epi32(m0,m2); // m8  m0
tmp5 = _mm_unpackhi_epi32(m1,m2); // m10 m6


//buf1 = _mm_set_epi32(m[15], m[4], m[5], m[2]);
buf2 = _mm_set_epi32(1160258022, 608135816, 3193202383, 137296536);
buf1 = _mm_xor_si128( buf1, buf2);
row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 );
buf1 = _mm_set_epi32(3041331479, 2752067618, 698298832, 320440878);
buf2 = _mm_unpacklo_epi64(tmp5,tmp4);

//buf2 = _mm_set_epi32(m[8], m[0], m[10], m[6]);
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
