
Information about the OCELOT1 stream ciphering method

This is the C++ implementation of a new stream ciphering method called OCELOT1. It is accepting any practical key size and can
be set to any practical state size.

COPYRIGHT PROTECTION: The OCELOT1 stream ciphering method is still under development and testing and for this reason the code is
freely distributed only for TESTING AND RESEARCH PURPOSES. The author is reserving for himself the rights to MODIFY AND MAINTAIN the
code, but any ideas about improving the code are welcomed and will be recognized if implemented.

If you are interested in testing the code, in research collaborations for possible security holes in the method, or in any
other information please contact the author at <george.anescu@scgen.com>.

Test Samples code for Version 2.0.0 (30 September 2010):

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
		//"F1018898 3A9FD7BA 0C462708 43474612 45474EBC 08BE4FCB 908DB206 FC55FFFE 09670415 C64E1947 70E3CE8C A56A9FBB E9C371E6 386883EA 6545A712 75283568 8DCA805A B56B0311 C37C287D DFF62B09 6DD2A4D0 953B857A DFA68A26 "
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}		
		cout << endl << endl;

		prng.GetWords(words, 23);
		//"ADA6AC7D CC43121D 7869F8F1 64749F2F 436866F3 DBBA98C0 064E2F3B 1BB2DBFF E17281A3 6E1843AA F67E74CD F38E6AA5 18858985 D2F3BD2D 030601DD 650E159E 84D00DFF 351CBE28 14D2086A F8CA1D98 C8E709AA 3006CBBB A50C7A5F "
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		cout << endl << endl;

		prng.Reset();
		prng.GetWords(words, 23);
		//"F1018898 3A9FD7BA 0C462708 43474612 45474EBC 08BE4FCB 908DB206 FC55FFFE 09670415 C64E1947 70E3CE8C A56A9FBB E9C371E6 386883EA 6545A712 75283568 8DCA805A B56B0311 C37C287D DFF62B09 6DD2A4D0 953B857A DFA68A26 "
		for(i=0; i<23; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}		
		cout << endl << endl;

		prng.Initialize(Ocelot1::OCELOTSize16, (BYTE*)"YXXXXXX", 7);
		prng.GetWords(words, 25);
		//"D824AE10 B563163F 397241B5 797A5BBC F6BF88B8 C50F03EC 5B13A52C E047DE28 22476357 D75FDC15 335CE1D6 59335D2E 56927318 99DBF457 14F3D97E 53BC436D 62E720CE B6FA197D 81A54614 6B33D5C7 4F7C0F43 A757411B 256C4942 768B887E 98CAB9F9 "
		for(i=0; i<25; i++)
		{
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		cout << endl << endl;
	}

	{
		Ocelot1 prng((BYTE*)"\0\0\0\0", 4);
		prng.GetWords(words, 23);
		//"FF30B446 4D95ED43 ADEE177C 1E29995A 439B68D4 86F02BB0 9896731C CE647511 F68E8EC5 B343251C B5DC8A32 4540E9BE 1EE3A382 CBECFFFB A7B6966D C89AC83C E153A3FF CC511D59 889BCA2F DE62FE7B CE9DEE1F B67C2C77 89278E62 "
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


