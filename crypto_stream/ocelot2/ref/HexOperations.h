
// HexOperations.h

#ifndef __HEXOPERATIONS_H__
#define __HEXOPERATIONS_H__

#define BYTE unsigned char

#include <string>

using namespace std;

class HexOperations
{
public:
	static bool IsHex(string const& hex);
	static string Hex2Str(string const& hex);
	static void Hex2Bytes(string const& hex, BYTE* bytes);
	static string Str2Hex(string const& str);
	static string Bytes2Hex(BYTE const* data, int size);

private:
	static string ToUpper(string const& str);
	static bool Hex2Char(string const& strHex, BYTE& uch);
	static void Char2Hex(BYTE uch, string& strHex);
};

#endif // __HEXOPERATIONS_H__

