
Information about the OCELOT2 stream ciphering method

This is the C++ implementation of a new stream ciphering method called OCELOT2. It is accepting any practical key size and can
be set to any practical state size.

COPYRIGHT PROTECTION: The OCELOT2 stream ciphering method is still under development and testing and for this reason the code is
freely distributed only for TESTING AND RESEARCH PURPOSES. The author is reserving for himself the rights to MODIFY AND MAINTAIN the
code, but any ideas about improving the code are welcomed and will be recognized if implemented.

If you are interested in testing the code, in research collaborations for possible security holes in the method, or in any
other information please contact the author at <george.anescu@scgen.com>.

Test Samples code for Version 2.0.0 (30 September 2010):

// Test Samples OCELOT2

#include <iostream>
#include <iomanip>
#include <string>

#include "Ocelot2.h"

using namespace std;

int main(int argc, char* argv[])
{

	UINT words[256];
	int i;
	{
		Ocelot2 prng((BYTE*)"XXXXXXX", 7);
		prng.GetWords(words, 23);
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		//"CE3378AA 48D770E5 6DA1BB12 BA9F3736 B2B8FE27 A46FB15A F51E0277 8BEE79B6 C287C32A 63DAC263 A532C0D5 0A1D8CE6 1A49BDC5 4B7EDD0D 13473499 5658B299 A6312610 0AC959C8 8D1E87EF 547A5669 CB215B63 7F7C03BF B072F7B9 "
		cout << endl << endl;

		prng.GetWords(words, 23);
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		//"2BCF0C49 460FE213 42AC47F3 2D32278C ECFB6312 58D397BA BD49FAF0 513DD14F 2353DC89 BB27BAC0 4E775E66 06180667 E34FBCCF 9C8B29B9 9476DE17 AE08D5A6 7B5F189B 1EFF1CDB DE1313E2 CDFEC7E1 24FBA7C8 102BD293 FBC69792 "
		cout << endl << endl;

		prng.Reset();
		prng.GetWords(words, 23);
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		//"CE3378AA 48D770E5 6DA1BB12 BA9F3736 B2B8FE27 A46FB15A F51E0277 8BEE79B6 C287C32A 63DAC263 A532C0D5 0A1D8CE6 1A49BDC5 4B7EDD0D 13473499 5658B299 A6312610 0AC959C8 8D1E87EF 547A5669 CB215B63 7F7C03BF B072F7B9 "
		cout << endl << endl;

		prng.Initialize(Ocelot2::OCELOTSize16, (BYTE*)"YXXXXXX", 7);
		prng.GetWords(words, 25);
		for(i=0; i<25; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		//"0AD072BD 2E78D792 F1D792AF 0562D51F ABDE2E16 97FDBE7D 07782041 DF397F1F DE918672 F0B7D58F 9E366284 C2D616E9 6CA04587 19FE8009 2D6B011A A72A4B6F D11E3211 5571DE7C 2A4FBA9E A60B7FFA 6595644A 8D45C422 38EAE54A 583E8778 425D66B4 "
		cout << endl << endl;
	}

	{
		Ocelot2 prng((BYTE*)"\0\0\0\0", 4);
		prng.GetWords(words, 23);
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		//"1309961D 00C1023A 0689822E 89C3AF1B F1FE3048 9BD381FE 56EA59B2 22E13A58 72C073F8 A53015EB 072009C5 8D7F74FF B0F1D38B E37B213F CB5BDFF7 F2B2D2E5 6989B70A B87868D8 2F3E3B24 C27F4A8E DA67AB8C B1B70A2E 645FCF37 "
		cout << endl << endl;
	}

	char ch = 0;
	cin >> ch;
	return 0;
}

