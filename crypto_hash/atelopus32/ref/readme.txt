
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
        Atelopus at(2, Atelopus::DigestSize32, Atelopus::BlockSize128);
        string str = "";
        //"2E4776EE7B35B93732D0864E759B3DD5B65ED8801335100218CED7F6B77F751B"
        at.Hash((unsigned char const*)str.c_str(), res, 0);
        for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(2, Atelopus::DigestSize32, Atelopus::BlockSize128);
        string str = "AABB";
        //"4E73D73D330BA15B3E1A074C4CB4ED1E7D10EB7AA88B6BF731C23501E8322462"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(2, Atelopus::DigestSize32, Atelopus::BlockSize128);
        string str = "AAAABBBBAAAABBBB";
        //"0A3AAA673CEF797B682A406D9803BD28B062A49173BC7691EFB8CD51E1DCDE88"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(2, Atelopus::DigestSize32, Atelopus::BlockSize128);
        string str = "AAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBB";
        //"F908A2A52F10F7A505181C9E372B25908274BCED1A96841351C0A3C71A959DBA"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(2, Atelopus::DigestSize32, Atelopus::BlockSize128);
        string str = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
        //"9A474D9C7C1C88A50E8E5E95B3AE9A6854D3F593F25C87877FDBF7A08DEEEC5B"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
	 }

    {
        Atelopus at(2, Atelopus::DigestSize32, Atelopus::BlockSize128);
        string str = "XYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
        //"D70A5568606EA12A683CAD64C28576FBAFA78B8E265B5EB8F63F19F1E6FBBB8B"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(2, Atelopus::DigestSize32, Atelopus::BlockSize128);
        string str = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
        //"C03B2392B00D6A46FF5955FF272E2C4A012A793EFDE54C53118C047933E0AD49"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<32; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }
    char ch = 0;
    cin >> ch;
    return 0;
}

