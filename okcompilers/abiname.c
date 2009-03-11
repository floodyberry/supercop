#include <stdio.h>

int main(int argc,char **argv)
{
#if defined(__amd64__) || defined(__x86_64__) || defined(__AMD64__) || defined(_M_X64) || defined(__amd64)
  printf("%s amd64\n",argv[1]); return 0;
#elif defined(__i386__) || defined(__x86__) || defined(__X86__) || defined(_M_IX86) || defined(__i386)
  printf("%s x86\n",argv[1]); return 0;
#elif defined(__ia64__) || defined(__IA64__) || defined(__M_IA64)
  printf("%s ia64\n",argv[1]); return 0;
#elif defined(__SPU__)
  printf("%s cellspu\n",argv[1]); return 0;
#elif defined(__powerpc64__) || defined(__ppc64__) || defined(__PPC64__) || defined(_ARCH_PPC64)
  printf("%s ppc64\n",argv[1]); return 0;
#elif defined(__powerpc__) || defined(__ppc__) || defined(__PPC__) || defined(_ARCH_PPC)
  printf("%s ppc32\n",argv[1]); return 0;
#elif defined(__sparcv9__) || defined(__sparcv9)
  printf("%s sparcv9\n",argv[1]); return 0;
#elif defined(__sparc__) || defined(__sparc)
  printf("%s sparcv8\n",argv[1]); return 0;
#elif defined(__ARM_EABI__)
  printf("%s armeabi\n",argv[1]); return 0;
#elif defined(__arm__)
  printf("%s arm\n",argv[1]); return 0;
#else
  printf("%s default\n",argv[1]); return 0;
#endif
}
