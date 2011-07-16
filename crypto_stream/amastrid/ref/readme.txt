
Information about the AMASTRID block ciphering method

This is the C++ implementation of a new block ciphering method called AMASTRID. Similar to Version 1.0.0, Version 1.1.0 works with keys of any practical size, but for increased efficiency it works with fixed block size.

COPYRIGHT PROTECTION: The AMASTRID block ciphering method is still under development and testing and for this reason the code is
freely distributed only for TESTING AND RESEARCH PURPOSES. The author is reserving for himself the rights to MODIFY AND MAINTAIN the
code, but any ideas about improving the code are welcomed and will be recognized if implemented.

If you are interested in testing the code, in research collaborations for possible security holes in the method, or in any
other information please contact the author at <george.anescu@sc-gen.com>.

Test Samples code for Version 1.1.0 (10 July 2011):

// Test Samples AMASTRID

#include <iostream>
#include <iomanip>
#include <string>
#include <sstream>
#include <ctime>

#include "Amastrid.h"
#include "Expansion.h"
#include "CounterMode.h"

using namespace std;

int main(int argc, char* argv[])
{
	UINT words[256];
	string ref;
	ostringstream oss;
	int i;
	{
		CounterMode prng((BYTE*)"XXXXXXX", 7, Amastrid::BlockSize32, 3);
		prng.GetWords(words, 32);
		//"7DB03792 AD423B17 1A3A1540 FF3C1B35 488E5A9D BB065227 FEAE9B95 9F88C930 7C07A4A6 3A317F55 7457388D 9F3213E8 DD6A64BE B0E585C2 96B6C34F 31B9A85A 064C2941 F9AC6C9A B4735061 E8752166 94EA76A6 2E493EF4 8A13D898 3E9FAC31 3096F7A1 61C5536F 8B5847D9 DEB91F21 10BB1100 AB014A8A A5338A57 300239B3 "
		for(i=0; i<32; i++)
		{
			if (i%8 == 0) cout << endl;
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
			oss << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		ref = oss.str();
		oss.str(""); // Empty the string
		cout << endl << endl;

		prng.GetWords(words, 32);
		//"0215E27B A007C188 A02E8A6F 2303F3EA 43D7BE0A 862EAC74 C736D389 B9594C27 ECF7A554 60E6EAFD 6EE5D87A A0A820E3 8F725469 EEDFE4C7 66D2AA90 B06C8C27 FEA3FB02 018B6E5E CC398D7B EE8372FD 3E351166 AC5C87C5 D0ED057D A80FB994 DD098271 7D31C80F C84EC5AA DA72273B D91CF542 5B64E023 3C9CA8C3 7ABE8825 "
		for(i=0; i<32; i++)
		{
			if (i%8 == 0) cout << endl;
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
			oss << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		ref = oss.str();
		oss.str(""); // Empty the string
		cout << endl << endl;

		prng.Reset();
		prng.GetWords(words, 32);
		//"7DB03792 AD423B17 1A3A1540 FF3C1B35 488E5A9D BB065227 FEAE9B95 9F88C930 7C07A4A6 3A317F55 7457388D 9F3213E8 DD6A64BE B0E585C2 96B6C34F 31B9A85A 064C2941 F9AC6C9A B4735061 E8752166 94EA76A6 2E493EF4 8A13D898 3E9FAC31 3096F7A1 61C5536F 8B5847D9 DEB91F21 10BB1100 AB014A8A A5338A57 300239B3 "
		for(i=0; i<32; i++)
		{
			if (i%8 == 0) cout << endl;
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
			oss << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}		
		ref = oss.str();
		oss.str(""); // Empty the string
		cout << endl << endl;
	}

	{
		CounterMode prng((BYTE*)"YXXXXXX", 7, Amastrid::BlockSize32, 3);
		prng.GetWords(words, 32);
		//"5600BDC7 4F6E92E0 098C9B87 AF17A21D 7BA8E21B F27A2AC6 52FC85B5 92D6C34C D7D0C2C9 CBFFF5E0 FBCC6A7C EAF40C96 27931610 5DEDECAB 6C434D35 C411998F 3693ECE8 B3AA7DA3 F4FC5478 A6719B79 E27E6D5F 499769DA FFB653D0 7E18F78E 4AC80BC6 7941DDC8 2D6155F3 DA2981F2 5212BB06 E685FB43 09137C68 1615A766 "
		for(i=0; i<32; i++)
		{
			if (i%8 == 0) cout << endl;
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
			oss << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		ref = oss.str();
		oss.str(""); // Empty the string
		cout << endl << endl;
	}

	{
		CounterMode prng((BYTE*)"\0\0\0\0", 4, Amastrid::BlockSize32, 3);
		prng.GetWords(words, 32);
		//"592D0D22 C02FE2D0 836CF58B C70D8100 3805E974 50FF7B41 8DC4DC83 9644FC5F BD5D171F C0633720 D438CDAB B55AE1BD BE279C5A CC74B585 32810DCC A5B265FE DB809BEA 671D77F1 ABDEAC4C 6A5AF5BF D0D125BB 0279F627 01ADF88D 18ED2E10 604628AD 3BA08042 BF103F3A 95A14BAB 441E83D6 F5FDD213 8A58751B 458D46E3 "
		for(i=0; i<32; i++)
		{
			if (i%8 == 0) cout << endl;
			cout << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
			oss << hex << setfill('0') << setw(8) << uppercase << (int)words[i] << " ";
		}
		ref = oss.str();
		oss.str(""); // Empty the string
		cout << endl << endl;
	}

	char ch = 0;
	cin >> ch;
	return 0;
}

