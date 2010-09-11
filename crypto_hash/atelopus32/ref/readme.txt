
Information about the ATELOPUS hashing method

This is the C++ implementation of a new cryptographic hashing method called ATELOPUS, which can be considered an universal
hashing method. It can work with dynamic sizes of the input data blocks (at word granularity) and is capable to generate
hash outputs covering a practical domain of sizes (at word granularity).

COPYRIGHT PROTECTION: The ATELOPUS hashing method is still under development and testing and for this reason the code is freely
distributed only for TESTING AND RESEARCH PURPOSES. The author is reserving for himself the rights to MODIFY AND MAINTAIN the
code, but any ideas about improving the code are welcomed and will be recognized if implemented.

If you are interested in testing the code, in research collaborations for possible security holes in the method, or in any
other information please contact the author at <george.anescu@sc-gen.com>.

Test Samples code for Version 2.0.0 (28 August 2010):

// Test Samples ATELOPUS

#include <iostream>
#include <iomanip>
#include <string>

#include "Atelopus.h"

using namespace std;

int main(int argc, char* argv[])
{
   BYTE res[256];
   int i;
	
   //Test Samples:
   {
      //Empty string
      Atelopus at(32, 3, Atelopus::BlockSize128);
      string str = "";
      //"51CA7440E9F7E6A1E77B32CD653C1131571D690D939ADF3185D1977DC91369B2"
      at.Hash((unsigned char const*)str.c_str(), res, 0);
      for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
      cout << endl << endl;
   }

   {
      Atelopus at(32, 3, Atelopus::BlockSize128);
      string str = "AABB";
      //"09A007AB91986399D047E55399D76C542A700712D3947FA2A21ED0CE8B28BE3E"
      at.Hash((unsigned char const*)str.c_str(), res, str.length());
      for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
      cout << endl << endl;
   }

   {
      Atelopus at(32, 3, Atelopus::BlockSize128);
      string str = "AAAABBBBAAAABBBB";
      //"E940F40E8502154A20047DB7F924B6FE87ACC46ABDC65673C38C8B99AD4062A5"
      at.Hash((unsigned char const*)str.c_str(), res, str.length());
      for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
      cout << endl << endl;
   }

   {
      Atelopus at(32, 3, Atelopus::BlockSize128);
      string str = "AAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBB";
      //"B60F0B3F3CD0033B07A1FEF9D22269CC6C277928A03B17C6C130055BE941C4BA"
      at.Hash((unsigned char const*)str.c_str(), res, str.length());
      for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
      cout << endl << endl;
   }

   {
      Atelopus at(32, 3, Atelopus::BlockSize128);
      string str = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
      //"80ED1BE8212BE95921A32A659DB990E12C5FE593546038A9EDCA5D526806172D"
      at.Hash((unsigned char const*)str.c_str(), res, str.length());
      for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
      cout << endl << endl;
	}

   {
      Atelopus at(32, 3, Atelopus::BlockSize128);
      string str = "XYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
      //"C4C05D1900083254358672292175E7945174E5100F29811E71706BC514068588"
      at.Hash((unsigned char const*)str.c_str(), res, str.length());
      for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
      cout << endl << endl;
   }

   {
      Atelopus at(32, 3, Atelopus::BlockSize128);
      string str = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
      //"517F51D71165CEEF657DC90408F595F58C030AC9071EFE5A372FE18E1BD2982E"
      at.Hash((unsigned char const*)str.c_str(), res, str.length());
      for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
      cout << endl << endl;
	}
	char ch = 0;
	cin >> ch;
	return 0;
}


