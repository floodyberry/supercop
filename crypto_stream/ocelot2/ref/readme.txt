
Information about the OCELOT2 stream ciphering method

This is the C++ implementation of a new stream ciphering method called OCELOT2. It is accepting any practical key size and can
be set to any practical state size.

COPYRIGHT PROTECTION: The OCELOT2 stream ciphering method is still under development and testing and for this reason the code is
freely distributed only for TESTING AND RESEARCH PURPOSES. The author is reserving for himself the rights to MODIFY AND MAINTAIN the
code, but any ideas about improving the code are welcomed and will be recognized if implemented.

If you are interested in testing the code, in research collaborations for possible security holes in the method, or in any
other information please contact the author at <george.anescu@sc-gen.com>.

Test Samples code for Version 2.1.0 (09 December 2010):

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
		//"0B75CA30 81F74147 D0A063FD C267AC5E 5F55E524 B1776B36 1B4A95FC AD5BBD67 3D311A37 F52B4FFA 0DF369EE 606BF010 02CD6F5E EC2EAEF3 C1755375 CD6ABE42 F5E479E5 9A0DC29D F4157CB0 2BFC2B05 45722A93 588D2967 3C2F49C5 "
		cout << endl << endl;

		prng.GetWords(words, 23);
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		//"CF060F7B DA6EAA68 64318269 2DE23173 7A6EFFF9 E30D8C0E F9318214 63D2AF90 3646C1CA AF1B793D 50BA7B45 3BB0E500 62AB5AC2 D9BC91B7 69B11BF6 F8E9C0AC CC5BCCC7 EB4F7C4E 0429EC98 F53DD3EB 981745B2 F324B17F 13C36ADC "
		cout << endl << endl;

		prng.Reset();
		prng.GetWords(words, 23);
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		//"0B75CA30 81F74147 D0A063FD C267AC5E 5F55E524 B1776B36 1B4A95FC AD5BBD67 3D311A37 F52B4FFA 0DF369EE 606BF010 02CD6F5E EC2EAEF3 C1755375 CD6ABE42 F5E479E5 9A0DC29D F4157CB0 2BFC2B05 45722A93 588D2967 3C2F49C5 "
		cout << endl << endl;

		prng.Initialize(Ocelot2::OCELOTSize16, (BYTE*)"YXXXXXX", 7);
		prng.GetWords(words, 25);
		for(i=0; i<25; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		//"CCF0DCEC 508D2868 124AC94E 7980FB6F 04693241 82F690DF 8592046D 1DFCF3FC 6028E415 2E130B06 9B22DA6D 6D002D96 441739D8 E8F7970E 111D3D83 AB306AF8 893CACBE 7C54D9E0 4CBDBC80 2B0B2B4D F1FC1C81 295ACFF6 8677A96E 860A0C90 AFA6627C "
		cout << endl << endl;
	}

	{
		Ocelot2 prng((BYTE*)"\0\0\0\0", 4);
		prng.GetWords(words, 23);
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		//"65E58C8D 4C08FADB A5E313B1 183A2393 BB192EAF DDE83455 0964B3F1 EBE6DFA9 5C5EBF7F B35732F5 8005FB10 4A11FEB2 4530AFB5 A77BF14E 9B8E3767 8F2FC326 3DFC0D0B C2A37726 55ACE2D9 24686C66 9C650713 E94E1D68 E41102AD "
		cout << endl << endl;
	}

	char ch = 0;
	cin >> ch;
	return 0;
}

