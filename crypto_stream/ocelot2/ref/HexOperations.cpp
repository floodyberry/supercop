
// HexOperations.cpp

#include "HexOperations.h"

bool HexOperations::IsHex(string const& hex)
{
	if(0 == hex.length())
		return false;
	if(hex.length() %2 != 0)
		return false;
	for(unsigned int i=0; i<hex.length(); i++)
	{
		if (hex[i] >= '0' && hex[i] <= '9')
			continue;
		else if (hex[i] >= 'A' && hex[i] <= 'F')
			continue;
		else
			return false;
	}
	return true;
}

string HexOperations::ToUpper(string const& str)
{
	string res;
	for(unsigned int i=0; i<str.size(); i++)
	{
		res.append(1, toupper(str[i]));
	}
	return res;
}

//Function to convert a Hex string of length 2 to a BYTE
bool HexOperations::Hex2Char(string const& hex, BYTE& uch)
{
	string str1 = ToUpper(hex);
	if(!IsHex(str1))
		return false;
	char ch;
	ch = str1[0];
	if(ch >= '0' && ch <= '9')
		uch = ch - '0';
	else if(ch >= 'A' && ch <= 'F')
		uch = ch - 55; //-'A' + 10
	else
		//Is not really a Hex string
		return false;
	ch = str1[1];
	if(ch >= '0' && ch <= '9')
		(uch <<= 4) += ch - '0';
	else if(ch >= 'A' && ch <= 'F')
		(uch <<= 4) += ch - 55; //-'A' + 10;
	else
		//Is not really a Hex string
		return false;
	return true;
}

//Optimized Function to convert a BYTE to a Hex string of length 2
void HexOperations::Char2Hex(BYTE uch, string& hex)
{
	static char ar[] = "0123456789ABCDEF";
	hex.erase();
	hex.append(1, (char)ar[uch>>4]);
	hex.append(1, (char)ar[uch&0xF]);
}

string HexOperations::Hex2Str(string const& hex)
{
	string str1 = ToUpper(hex);
	string str;
	if(!IsHex(str1))
		return str;
	BYTE uch;
	for(unsigned int i=0; i<str1.length(); i+=2)
	{
		if(false == Hex2Char(str1.substr(i,2), uch))
		{
			str.erase();
			return str; //empty string
		}
		str.append(1, (char)uch);
	}
	return str;
}

void HexOperations::Hex2Bytes(string const& hex, BYTE* bytes)
{
	memcpy(bytes, Hex2Str(hex).c_str(), hex.length() >> 1);
}

string HexOperations::Str2Hex(string const& str)
{
	return Bytes2Hex((BYTE const*)str.c_str(), str.length());
}

string HexOperations::Bytes2Hex(BYTE const* data, int size)
{
	string hex;
	string str1;
	for(int i=0; i<size; i++)
	{
		Char2Hex(data[i], str1);
		hex.append(str1);
	}
	return hex;
}
