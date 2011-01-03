
Information about the ATELOPUS hashing method

This is the C++ implementation of a new cryptographic hashing method called ATELOPUS, which can be considered an universal
hashing method. It can work with dynamic sizes of the input data blocks (at word granularity) and is capable to generate
hash outputs covering a practical domain of sizes (at word granularity).

COPYRIGHT PROTECTION: The ATELOPUS hashing method is still under development and testing and for this reason the code is freely
distributed only for TESTING AND RESEARCH PURPOSES. The author is reserving for himself the rights to MODIFY AND MAINTAIN the
code, but any ideas about improving the code are welcomed and will be recognized if implemented.

If you are interested in testing the code, in research collaborations for possible security holes in the method, or in any
other information please contact the author at <george.anescu@sc-gen.com>.

Test Samples code for Version 2.1.0 (09 December 2010):

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
        Atelopus at(2, Atelopus::DigestSize64, Atelopus::BlockSize256);
        string str = "";
        //"2A88E18E908DB0901D3704875D55F9C9FD2EA64871453A55F4FD68B9EC272A04BA87D1E594610C0FD9875593A322BF773EEBEBAA94581BDD6E886A773F134CEF"
        at.Hash((unsigned char const*)str.c_str(), res, 0);
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(2, Atelopus::DigestSize64, Atelopus::BlockSize256);
        string str = "AABB";
        //"C52898B8455E479D1C3EC25577C70A5C320E03C91C795D170AF23C2E093E9B75FC328745C6AE5F09E2C8AA2B9FDCA28C15F90840C0F676A393B5067F1B11784A"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(2, Atelopus::DigestSize64, Atelopus::BlockSize256);
        string str = "AAAABBBBAAAABBBB";
        //"4E1BE6709B15387CEC69436BA6001CD725D5621BB1B51D8E35AC9EFE7EE9D4D908D58DCCA2AEF750FB278A2D92BA24D77ED5FC9CEDD6E036D769F45BB47B1268"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(2, Atelopus::DigestSize64, Atelopus::BlockSize256);
        string str = "AAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBB";
        //"E16547026C567EEC8B0FBCECD9FE7DAEFF6232154EFDE1D6D378744F3338D6FB081462A700EC17DC0D16DC35FC5464EFC9FB72A9188B6D1D723C3CD31BEB7756"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(2, Atelopus::DigestSize64, Atelopus::BlockSize256);
        string str = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
        //"97261287740E02918982BFDEFAF6C7EC3513C25D5620543934A4F1789DCD9C6BE433642D97E40A7E098D5EB0E3F5FE25C5583AD13895EE27F05EB1BDD84DC513"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(2, Atelopus::DigestSize64, Atelopus::BlockSize256);
        string str = "XYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
        //"6C2D56F01A62537B84F1C860F7EAE5681E43C0E46889C64DA677CF7E1213D7F4BE03AE87D4AA4B167259E05715B398C7255EC5831E162CE1835BF1076E4C25BF"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(2, Atelopus::DigestSize64, Atelopus::BlockSize256);
        string str = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
        //"426E86EEC5D6D896EAA64774EA6C7FCBD90204A59A5B69430F39771AF8FC75F5DFB807F8BD57AC8B519587A54E394DD703B24B9179BF35E928F47CEC74F9405C"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    char ch = 0;
    cin >> ch;
    return 0;
}

