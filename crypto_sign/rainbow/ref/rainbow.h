using namespace std ;
#include <cstdio>
#include <iostream>
#include <cstring>
#include <fstream>
#include <cstdlib>
#include <iomanip>
#include <ctime>

#include "GFpow.h"




// output file for Gauss can remove definition
//#define OUTFILE  "temp.txt" 
//#define DEBUG

#ifdef OUTFILE
void display(GFpow * ap, int const n, int const m, char * ch =" ") ;
#endif

const int ovn = 43 ;  // oil + vinegar variables
const int v1 = 11 ;   // first set of vinegar variables: o < v1 < v2 <...< ovn=n
const int un = 5 ;  // number of entries into Slist, first entry always v1, last always ovn
const int Slist[un] ={v1,22,27,32,ovn} ;


const int nv1 = ovn - v1 ;
const int ovn1 = ovn+1 ;
const int nv2 = 2 * nv1 ;
const int ovn2 = 2 * ovn ;

int gauss( GFpow ab[], int const , int const  ) ;   //Definition in Gauss.cpp
