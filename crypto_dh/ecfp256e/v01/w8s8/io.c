/**
 * This file is a part of the freeware CRYMPIX
 * CRYPTOGRAPHIC MULTIPRECISION SOFTWARE Library.
 * This software is initially designed and developed in the
 * Information System Strategy and Security Laboratory (IS3)
 * of Izmir Institute of Technology (IZTECH).
 *
 * CRYMPIX is engineered to provide a portable environment
 * for the implementation of the latest techniques in
 * computational number theory and cryptology.
 * The content can be modified with the sole condition
 * that this header is kept as is.
 * We provide no guarantee for the correctness and
 * completeness of this software.
 *
 * Please report the bugs to:
 *    crympix-bug@is3.iyte.edu.tr
 *
 * Please submit your contributions to:
 *    crympix-devel@is3.iyte.edu.tr
 *
 * Thank you for using this software.
 **/

#include <stdio.h>
#include <stdlib.h>
#include "_core.h"

/**
 * ANSI_X3.4-1968 (canonical name)
 * ANSI_X3.4-1986
 * ASCII
 * US-ASCII (preferred MIME name)
 * us
 * ISO646-US
 * ISO_646.irv:1991
 * iso-ir-6
 * IBM367
 * cp367
 * csASCII
 */
static uni_t ascii_scan_map[256] = {
	-1, /*   0 ->     */
	-1, /*   1 ->     */
	-1, /*   2 ->     */
	-1, /*   3 ->     */
	-1, /*   4 ->     */
	-1, /*   5 ->     */
	-1, /*   6 ->     */
	-1, /*   7 ->     */
	-1, /*   8 ->     */
	-1, /*   9 ->     */
	-1, /*  10 ->     */
	-1, /*  11 ->     */
	-1, /*  12 ->     */
	-1, /*  13 ->     */
	-1, /*  14 ->     */
	-1, /*  15 ->     */
	-1, /*  16 ->     */
	-1, /*  17 ->     */
	-1, /*  18 ->     */
	-1, /*  19 ->     */
	-1, /*  20 ->     */
	-1, /*  21 ->     */
	-1, /*  22 ->     */
	-1, /*  23 ->     */
	-1, /*  24 ->     */
	-1, /*  25 ->     */
	-1, /*  26 ->     */
	-1, /*  27 ->     */
	-1, /*  28 ->     */
	-1, /*  29 ->     */
	-1, /*  30 ->     */
	-1, /*  31 ->     */
	-1, /*  32 -> ' ' */
	-1, /*  33 -> '!' */
	-1, /*  34 -> '"' */
	-1, /*  35 -> '#' */
	-1, /*  36 -> '$' */
	-1, /*  37 -> '%' */
	-1, /*  38 -> '&' */
	-1, /*  39 -> ''' */
	-1, /*  40 -> '(' */
	-1, /*  41 -> ')' */
	-1, /*  42 -> '*' */
	-1, /*  43 -> '+' */
	-1, /*  44 -> ',' */
	-1, /*  45 -> '-' */
	-1, /*  46 -> '.' */
	-1, /*  47 -> '/' */
	 0, /*  48 -> '0' */
	 1, /*  49 -> '1' */
	 2, /*  50 -> '2' */
	 3, /*  51 -> '3' */
	 4, /*  52 -> '4' */
	 5, /*  53 -> '5' */
	 6, /*  54 -> '6' */
	 7, /*  55 -> '7' */
	 8, /*  56 -> '8' */
	 9, /*  57 -> '9' */
	-1, /*  58 -> ':' */
	-1, /*  59 -> ';' */
	-1, /*  60 -> '<' */
	-1, /*  61 -> '=' */
	-1, /*  62 -> '>' */
	-1, /*  63 -> '?' */
	-1, /*  64 -> '@' */
	10, /*  65 -> 'A' */
	11, /*  66 -> 'B' */
	12, /*  67 -> 'C' */
	13, /*  68 -> 'D' */
	14, /*  69 -> 'E' */
	15, /*  70 -> 'F' */
	-1, /*  71 -> 'G' */
	-1, /*  72 -> 'H' */
	-1, /*  73 -> 'MI' */
	-1, /*  74 -> 'J' */
	-1, /*  75 -> 'K' */
	-1, /*  76 -> 'L' */
	-1, /*  77 -> 'M' */
	-1, /*  78 -> 'N' */
	-1, /*  79 -> 'O' */
	-1, /*  80 -> 'P' */
	-1, /*  81 -> 'Q' */
	-1, /*  82 -> 'R' */
	-1, /*  83 -> 'S' */
	-1, /*  84 -> 'T' */
	-1, /*  85 -> 'U' */
	-1, /*  86 -> 'MA' */
	-1, /*  87 -> 'W' */
	-1, /*  88 -> 'X' */
	-1, /*  89 -> 'Y' */
	-1, /*  90 -> 'Z' */
	-1, /*  91 -> '[' */
	-1, /*  92 -> '\' */
	-1, /*  93 -> ']' */
	-1, /*  94 -> '^' */
	-1, /*  95 -> '_' */
	-1, /*  96 -> '`' */
	10, /*  97 -> 'a' */
	11, /*  98 -> 'b' */
	12, /*  99 -> 'c' */
	13, /* 100 -> 'd' */
	14, /* 101 -> 'e' */
	15, /* 102 -> 'f' */
	-1, /* 103 -> 'g' */
	-1, /* 104 -> 'h' */
	-1, /* 105 -> 'i' */
	-1, /* 106 -> 'j' */
	-1, /* 107 -> 'k' */
	-1, /* 108 -> 'l' */
	-1, /* 109 -> 'm' */
	-1, /* 110 -> 'n' */
	-1, /* 111 -> 'o' */
	-1, /* 112 -> 'p' */
	-1, /* 113 -> 'q' */
	-1, /* 114 -> 'r' */
	-1, /* 115 -> 's' */
	-1, /* 116 -> 't' */
	-1, /* 117 -> 'u' */
	-1, /* 118 -> 'v' */
	-1, /* 119 -> 'w' */
	-1, /* 120 -> 'x' */
	-1, /* 121 -> 'y' */
	-1, /* 122 -> 'z' */
	-1, /* 123 -> '{' */
	-1, /* 124 -> '|' */
	-1, /* 125 -> '}' */
	-1, /* 126 -> '~' */
	-1, /* 127 ->     */
	-1, /* 128 ->     */
	-1, /* 129 ->     */
	-1, /* 130 ->     */
	-1, /* 131 ->     */
	-1, /* 132 ->     */
	-1, /* 133 ->     */
	-1, /* 134 ->     */
	-1, /* 135 ->     */
	-1, /* 136 ->     */
	-1, /* 137 ->     */
	-1, /* 138 ->     */
	-1, /* 139 ->     */
	-1, /* 140 ->     */
	-1, /* 141 ->     */
	-1, /* 142 ->     */
	-1, /* 143 ->     */
	-1, /* 144 ->     */
	-1, /* 145 ->     */
	-1, /* 146 ->     */
	-1, /* 147 ->     */
	-1, /* 148 ->     */
	-1, /* 149 ->     */
	-1, /* 150 ->     */
	-1, /* 151 ->     */
	-1, /* 152 ->     */
	-1, /* 153 ->     */
	-1, /* 154 ->     */
	-1, /* 155 ->     */
	-1, /* 156 ->     */
	-1, /* 157 ->     */
	-1, /* 158 ->     */
	-1, /* 159 ->     */
	-1, /* 160 ->     */
	-1, /* 161 ->     */
	-1, /* 162 ->     */
	-1, /* 163 ->     */
	-1, /* 164 ->     */
	-1, /* 165 ->     */
	-1, /* 166 ->     */
	-1, /* 167 ->     */
	-1, /* 168 ->     */
	-1, /* 169 ->     */
	-1, /* 170 ->     */
	-1, /* 171 ->     */
	-1, /* 172 ->     */
	-1, /* 173 ->     */
	-1, /* 174 ->     */
	-1, /* 175 ->     */
	-1, /* 176 ->     */
	-1, /* 177 ->     */
	-1, /* 178 ->     */
	-1, /* 179 ->     */
	-1, /* 180 ->     */
	-1, /* 181 ->     */
	-1, /* 182 ->     */
	-1, /* 183 ->     */
	-1, /* 184 ->     */
	-1, /* 185 ->     */
	-1, /* 186 ->     */
	-1, /* 187 ->     */
	-1, /* 188 ->     */
	-1, /* 189 ->     */
	-1, /* 190 ->     */
	-1, /* 191 ->     */
	-1, /* 192 ->     */
	-1, /* 193 ->     */
	-1, /* 194 ->     */
	-1, /* 195 ->     */
	-1, /* 196 ->     */
	-1, /* 197 ->     */
	-1, /* 198 ->     */
	-1, /* 199 ->     */
	-1, /* 200 ->     */
	-1, /* 201 ->     */
	-1, /* 202 ->     */
	-1, /* 203 ->     */
	-1, /* 204 ->     */
	-1, /* 205 ->     */
	-1, /* 206 ->     */
	-1, /* 207 ->     */
	-1, /* 208 ->     */
	-1, /* 209 ->     */
	-1, /* 210 ->     */
	-1, /* 211 ->     */
	-1, /* 212 ->     */
	-1, /* 213 ->     */
	-1, /* 214 ->     */
	-1, /* 215 ->     */
	-1, /* 216 ->     */
	-1, /* 217 ->     */
	-1, /* 218 ->     */
	-1, /* 219 ->     */
	-1, /* 220 ->     */
	-1, /* 221 ->     */
	-1, /* 222 ->     */
	-1, /* 223 ->     */
	-1, /* 224 ->     */
	-1, /* 225 ->     */
	-1, /* 226 ->     */
	-1, /* 227 ->     */
	-1, /* 228 ->     */
	-1, /* 229 ->     */
	-1, /* 230 ->     */
	-1, /* 231 ->     */
	-1, /* 232 ->     */
	-1, /* 233 ->     */
	-1, /* 234 ->     */
	-1, /* 235 ->     */
	-1, /* 236 ->     */
	-1, /* 237 ->     */
	-1, /* 238 ->     */
	-1, /* 239 ->     */
	-1, /* 240 ->     */
	-1, /* 241 ->     */
	-1, /* 242 ->     */
	-1, /* 243 ->     */
	-1, /* 244 ->     */
	-1, /* 245 ->     */
	-1, /* 246 ->     */
	-1, /* 247 ->     */
	-1, /* 248 ->     */
	-1, /* 249 ->     */
	-1, /* 250 ->     */
	-1, /* 251 ->     */
	-1, /* 252 ->     */
	-1, /* 253 ->     */
	-1, /* 254 ->     */
	-1  /* 255 ->     */
};


/**
 * ANSI_X3.4-1968 (canonical name)
 * ANSI_X3.4-1986
 * ASCII
 * US-ASCII (preferred MIME name)
 * us
 * ISO646-US
 * ISO_646.irv:1991
 * iso-ir-6
 * IBM367
 * cp367
 * csASCII
 */
static uni_t ascii_print_map[256] = {
	 '0', /*  0 */
	 '1', /*  1 */
	 '2', /*  2 */
	 '3', /*  3 */
	 '4', /*  4 */
	 '5', /*  5 */
	 '6', /*  6 */
	 '7', /*  7 */
	 '8', /*  8 */
	 '9', /*  9 */
	 'A', /* 10 */
	 'B', /* 11 */
	 'C', /* 12 */
	 'D', /* 13 */
	 'E', /* 14 */
	 'F',  /* 15 */
	 '-'  /* 16 */
};

uni_t kn_io_sscan(uni buf, sic s, uni_t base)
{
	uni_t i;

	if(s[0] == '\0'){
		kn_exit("kn_io_fscan: zero length string", ERR_INVALID_STRING);
	}
	i = 0;
	if(s[0] == '-'){
		buf[0] = -1;
		i++;
	}
	while((i < IO_BUFFER_SIZE) && (s[i] != '\n') && (s[i] != '\0') && (s[i] != ' ')){
		buf[i] = ascii_scan_map[(uni_t)s[i]];
		if((buf[i] >= base)){
			kn_exit("kn_io_fscan: invalid character", ERR_INVALID_CHARACTER);
		}
		if((buf[i] == -1)){
			kn_exit("kn_io_fscan: invalid character", ERR_INVALID_CHARACTER);
		}
		i++;
	}
	if(i >= IO_BUFFER_SIZE){
		kn_exit("kn_io_fscan: increase I/O buffer size", ERR_IO_BUFFER_OVERFLOW);
	}
	return i;
}

uni_t kn_io_fscan(uni buf, FILE *fp, uni_t base)
{
	uni_t ch, i;

	i = 0;
	ch = fgetc(fp);
	if(ch == '-'){
		ch = fgetc(fp);
		buf[0] = -1;
		i++;
	}
	while((i < IO_BUFFER_SIZE) && (ch != EOF) && (ch != '\n') && (ch != '\r') && (ch != '\0') && (ch != ' ')){
		buf[i] = ascii_scan_map[ch];
		if((buf[i] >= base)){
			kn_exit("kn_io_fscan: invalid character", ERR_INVALID_CHARACTER);
		}
		if((buf[i] == -1)){
			kn_exit("kn_io_fscan: invalid character", ERR_INVALID_CHARACTER);
		}
		ch = fgetc(fp);
		i++;
	}
	if(ch == '\r'){
		ch = fgetc(fp);
	}
	if(i >= IO_BUFFER_SIZE){
		kn_exit("kn_io_fscan: increase I/O buffer size", ERR_IO_BUFFER_OVERFLOW);
	}
	return i;
}

void kn_io_sprint(sic sn, uni an, uni_t al, uni_t base)
{
	uni_t i;

	for(i = 0; i < al; i++){
		sn[al - i - 1] = ascii_print_map[an[i]];
	}
	sn[al] = '\0';
}

void kn_io_fprint(FILE *fp, sic prefix, uni an, uni_t al, sic suffix, uni_t base)
{
	sic_t buf[IO_BUFFER_SIZE];
	uni_t i;

	if(prefix != NULL){
		printf("%s", prefix);
	}
	for(i = 0; i < al; i++){
		buf[al - i - 1] = ascii_print_map[an[i]];
	}
	buf[al] = '\0';
	fprintf(fp, "%s", buf);
	if(suffix != NULL){
		printf("%s", suffix);
	}
}
