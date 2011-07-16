
Information about the OCELOT1 stream ciphering method

This is the C++ implementation of a new stream ciphering method called OCELOT1. It is accepting any practical key size and can
be set to any practical state size.

COPYRIGHT PROTECTION: The OCELOT1 stream ciphering method is still under development and testing and for this reason the code is
freely distributed only for TESTING AND RESEARCH PURPOSES. The author is reserving for himself the rights to MODIFY AND MAINTAIN the
code, but any ideas about improving the code are welcomed and will be recognized if implemented.

If you are interested in testing the code, in research collaborations for possible security holes in the method, or in any
other information please contact the author at <george.anescu@sc-gen.com>.

Test Samples code for Version 2.1.0 (09 December 2010):

// Test Samples OCELOT1

#include <iostream>
#include <iomanip>
#include <string>

#include "Ocelot1.h"

using namespace std;

int main(int argc, char* argv[])
{
	UINT words[256];
	int i;
	{
		Ocelot1 prng((BYTE*)"XXXXXXX", 7);
		prng.GetWords(words, 23);
		//"85815117 AC8FDE76 B322240B 5FD687F5 9CE2702B ED5D1777 3257698A 832B4BE7 A0811520 2E0D7F29 A675853B 563655E6 5063716D 05FBA749 3A37BD59 CB6C3415 754C64FE 5C77352F B3DC188B B4172E84 46709D74 671A8C0A A4DDB042 "
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}		
		cout << endl << endl;

		prng.GetWords(words, 23);
		//"FE797E42 095BCE1A 28616AFE 8AF1AAFF 904C0AEB CC2CA0B9 6604DC8E 1696CFB2 4A0D84AC E3344F80 B6EACB1B 5821BDA0 73BF9945 6F2D8C12 73A5A787 AD205816 D0B7B83C 82D3684B 53973504 BD2469AF 6B7B53F3 4B5A8CAF 56AFB44A "
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		cout << endl << endl;

		prng.Reset();
		prng.GetWords(words, 23);
		//"85815117 AC8FDE76 B322240B 5FD687F5 9CE2702B ED5D1777 3257698A 832B4BE7 A0811520 2E0D7F29 A675853B 563655E6 5063716D 05FBA749 3A37BD59 CB6C3415 754C64FE 5C77352F B3DC188B B4172E84 46709D74 671A8C0A A4DDB042 "
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}		
		cout << endl << endl;

		prng.Initialize(Ocelot1::OCELOTSize16, (BYTE*)"YXXXXXX", 7);
		prng.GetWords(words, 25);
		//"BB53781D 00E53372 C30DA673 13033AB2 0234D468 9A010A9B B1C0A0BE 0B40BF0C BF6584CA 2F26079E 5EA11379 2B259F47 56AEFD90 B7243AEF FBFC242A A3187B68 957062A2 0EFF2AC9 E23C2988 F95A7D9D 6E50DDBE B3F5E4BD B5767CE3 C8467B96 A4891FCA "
		for(i=0; i<25; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		cout << endl << endl;
	}

	{
		Ocelot1 prng((BYTE*)"\0\0\0\0", 4);
		prng.GetWords(words, 23);
		//"93912BB7 3814C2D9 6B8D4CC4 CE160707 286C80FE AEA22044 021261BD 37A7310E 99CDD9E5 4780651C 5441AA6D DCCB8235 8B9B1184 7F489A0C 03AC5612 92849891 195078AE F0DBC3BD EE50179D 1804EC33 9D210FE0 17A81801 A0C8C1E7 "
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		cout << endl << endl;
	}

	char ch = 0;
	cin >> ch;
	return 0;
}


