
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
        Atelopus at(64, 3, Atelopus::BlockSize256);
        string str = "";
        //"AC157DEAB310A3A6DF0D523877C4600FFF0F007E51EC30897E3AA9858F291569F3A67CAFCD9C563D1C1374C045867E0064AF01EDAA72314001F1E1865208BA8B"
        at.Hash((unsigned char const*)str.c_str(), res, 0);
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(64, 3, Atelopus::BlockSize256);
        string str = "AABB";
        //"70329BCD6498ECB1EA1FC67DA0858E57330CF693E93AD1C6B94F026D9457C9965C9D2E9EE6E138D35993CEABA4345EAA33338D0D37AEFC89DD948C38FA597B05"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(64, 3, Atelopus::BlockSize256);
        string str = "AAAABBBBAAAABBBB";
        //"42BD9F90B17405CD764993EED3AF2C1BFDECFD5DAAC64A85A2CC65D71B5A075E6BCF0151CEA2193CCFBD81FF0BDF8E7F8976A1D47E15E9D0A15732F4EDAECFB6"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(64, 3, Atelopus::BlockSize256);
        string str = "AAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBBAAAABBBB";
        //"36A8997FFC2AACBA9CAE792B0D4A480B4E9AC0F1DBA568EF433C95697D04A6B0A6CC475F566E30EA6D7541CEF1FF1C5880AD84AFF8EB851A685AB73D6442767D"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(64, 3, Atelopus::BlockSize256);
        string str = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
        //"835BF9E8F46EDC871B4B549F76091E2D6420545D34089807F28A7EE717E90E5DA0A44FB8168EF2A53B77B47969798DFC6C3290619F883AA58056D46DBCFD83D2"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(64, 3, Atelopus::BlockSize256);
        string str = "XYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
        //"F24E79788C3FFE72159F60E969BC81DE08A33BFFF2EE21807A76AAED44434DE1CFDE7FCE2C4BDF87BC9FC18F4D8C04773054039B8C52D259578330AAD2B03206"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    {
        Atelopus at(64, 3, Atelopus::BlockSize256);
        string str = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
        //"3A206A178B8E206BDF927B335D2BDF54A5E5845276AA13C46A67FAF9A5F8AD5E79DAD7F2CC27A464CDC072410D4D717EBB25428718B1528EE7A890461C91E4ED"
        at.Hash((unsigned char const*)str.c_str(), res, str.length());
        for(i=0; i<64; i++) cout << hex << setfill('0') << setw(2) << uppercase << (int)res[i] << " ";
        cout << endl << endl;
    }

    char ch = 0;
    cin >> ch;
    return 0;
}


