#include <stdio.h>
#include "portable.h"
#include "AES-round.h"

#define swap_end(s,temp) {\
   temp = s&0xff;\
   temp = temp<<8;\
   temp ^= (s>>8)&0xff;\
   temp = temp<<8;\
   temp ^= (s>>16)&0xff;\
   temp = temp<<8;\
   temp ^= (s>>24);\
   s = temp;\
}

int main() {

   u32 temp;
   int i;

   printf("static const u32 Table0[256] = {\n");
   for (i=0;i<256;i++) {
      swap_end(Table0[i],temp);
      printf("0x%08xU, ",Table0[i]);
      if ((i%6)==5) printf("\n");
   }
   printf("\n}\n\n");
   printf("static const u32 Table1[256] = {\n");
   for (i=0;i<256;i++) {
      swap_end(Table1[i],temp);
      printf("0x%08xU, ",Table1[i]);
      if ((i%6)==5) printf("\n");
   }
   printf("\n}\n\n");
   printf("static const u32 Table2[256] = {\n");
   for (i=0;i<256;i++) {
      swap_end(Table2[i],temp);
      printf("0x%08xU, ",Table2[i]);
      if ((i%6)==5) printf("\n");
   }
   printf("\n}\n\n");
   printf("static const u32 Table3[256] = {\n");
   for (i=0;i<256;i++) {
      swap_end(Table3[i],temp);
      printf("0x%08xU, ",Table3[i]);
      if ((i%6)==5) printf("\n");
   }
   printf("\n}\n\n");



return 0;
}

