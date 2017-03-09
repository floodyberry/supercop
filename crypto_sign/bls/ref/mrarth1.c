/*
 *   MIRACL arithmetic routines 1 - multiplying and dividing BIG NUMBERS by  
 *   integer numbers.
 *   mrarth1.c
 *
 *   Copyright (c) 1988-1997 Shamus Software Ltd.
 */

extern "C" {

#include "miracl.h"

#ifdef MR_FP_ROUNDING
#ifdef __GNUC__
#include <ieeefp.h>
#endif

/* Invert n and set FP rounding. 
 * Set to round up
 * Calculate 1/n
 * set to round down (towards zero)
 * If rounding cannot be controlled, this function returns 0.0 */

mr_large mr_invert(mr_small n)
{
    mr_large inn;
    int up=  0x1BFF; 

#ifdef _MSC_VER
  #ifdef MR_NOASM
#define NO_EXTENDED
  #endif 
#endif

#ifdef NO_EXTENDED
    int down=0x1EFF;
#else
    int down=0x1FFF;
#endif

#ifdef __TURBOC__
    asm
    {
        fldcw WORD PTR up
        fld1
        fld QWORD PTR n;
        fdiv
        fstp TBYTE PTR inn;
        fldcw WORD PTR down;
    }
    return inn;   
#endif
#ifdef _MSC_VER
    _asm
    {
        fldcw WORD PTR up
        fld1
        fld QWORD PTR n;
        fdiv
        fstp QWORD  PTR inn;
        fldcw WORD PTR down;
    }
    return inn;   
#endif
#ifdef __GNUC__
#ifdef i386
    __asm__ __volatile__ (
    "fldcw %2\n"
    "fld1\n"
    "fldl %1\n"
    "fdivrp\n"
    "fstpt %0\n"
    "fldcw %3\n"
    : "=m"(inn)
    : "m"(n),"m"(up),"m"(down)
    : "memory"
    );
    return inn;   
#else
    fpsetround(FP_RP);
    inn=(mr_large)1.0/n;
    fpsetround(FP_RZ);
    return inn;
#endif
#endif
    return 0.0L;   
}

#endif

void mr_pmul(_MIPD_ big x,mr_small sn,big z)
{ 
    int m,xl;
    mr_unsign32 sx;
    mr_small carry,*xg,*zg;

#ifdef MR_ITANIUM
    mr_small tm;
#endif
#ifdef MR_NOASM
    union doubleword dble;
    mr_large dbled;
    mr_large ldres;
#endif
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    if (x!=z)
    {
        zero(z);
        if (sn==0) return;
    }
    else if (sn==0)
    {
        zero(z);
        return;
    }
    m=0;
    carry=0;
    sx=x->len&MR_MSBIT;
    xl=(int)(x->len&MR_OBITS);

    if (mr_mip->base==0) 
    {
#ifndef MR_NOFULLWIDTH
        xg=x->w; zg=z->w;
/* inline 8086 assembly - substitutes for loop below */
#if INLINE_ASM == 1
        ASM cld
        ASM mov cx,xl
        ASM or cx,cx
        ASM je out1
#ifdef MR_LMM
        ASM push ds
        ASM push es
        ASM les di,DWORD PTR zg
        ASM lds si,DWORD PTR xg
#else
        ASM mov ax,ds
        ASM mov es,ax
        ASM mov di,zg
        ASM mov si,xg
#endif
        ASM mov bx,sn
        ASM push bp
        ASM xor bp,bp
    tcl1:
        ASM lodsw
        ASM mul bx
        ASM add ax,bp
        ASM adc dx,0
        ASM stosw
        ASM mov bp,dx
        ASM loop tcl1

        ASM mov ax,bp
        ASM pop bp
#ifdef MR_LMM
        ASM pop es
        ASM pop ds
#endif
        ASM mov carry,ax
     out1: 
#endif
#if INLINE_ASM == 2
        ASM cld
        ASM mov cx,xl
        ASM or cx,cx
        ASM je out1
#ifdef MR_LMM
        ASM push ds
        ASM push es
        ASM les di,DWORD PTR zg
        ASM lds si,DWORD PTR xg
#else
        ASM mov ax,ds
        ASM mov es,ax
        ASM mov di,zg
        ASM mov si,xg
#endif
        ASM mov ebx,sn
        ASM push ebp
        ASM xor ebp,ebp
    tcl1:
        ASM lodsd
        ASM mul ebx
        ASM add eax,ebp
        ASM adc edx,0
        ASM stosd
        ASM mov ebp,edx
        ASM loop tcl1

        ASM mov eax,ebp
        ASM pop ebp
#ifdef MR_LMM
        ASM pop es
        ASM pop ds
#endif
        ASM mov carry,eax
     out1: 
#endif
#if INLINE_ASM == 3
        ASM mov ecx,xl
        ASM or ecx,ecx
        ASM je out1
        ASM mov ebx,sn
        ASM mov edi,zg
        ASM mov esi,xg
        ASM push ebp
        ASM xor ebp,ebp
    tcl1:
        ASM mov eax,[esi]
        ASM add esi,4
        ASM mul ebx
        ASM add eax,ebp
        ASM adc edx,0
        ASM mov [edi],eax
        ASM add edi,4
        ASM mov ebp,edx
        ASM dec ecx
        ASM jnz tcl1

        ASM mov eax,ebp
        ASM pop ebp
        ASM mov carry,eax
     out1: 
#endif
#if INLINE_ASM == 4

        ASM (
           "movl %4,%%ecx\n"
           "orl  %%ecx,%%ecx\n"
           "je 1f\n"
           "movl %3,%%ebx\n"
           "movl %1,%%edi\n"
           "movl %2,%%esi\n"
           "pushl %%ebp\n"
           "xorl %%ebp,%%ebp\n"  
        "0:\n"  
           "movl (%%esi),%%eax\n"
           "addl $4,%%esi\n"
           "mull %%ebx\n"
           "addl %%ebp,%%eax\n"
           "adcl $0,%%edx\n"
           "movl %%eax,(%%edi)\n"
           "addl $4,%%edi\n"
           "movl %%edx,%%ebp\n"
           "decl %%ecx\n"
           "jnz 0b\n"
 
           "movl %%ebp,%%eax\n"
           "popl %%ebp\n"
           "movl %%eax,%0\n"
        "1:"  
        :"=m"(carry)
        :"m"(zg),"m"(xg),"m"(sn),"m"(xl)
        :"eax","edi","esi","ebx","ecx","edx","memory"
        );

#endif
#ifndef INLINE_ASM
        for (m=0;m<xl;m++)
#ifdef MR_NOASM
        {
            dble.d=(mr_large)x->w[m]*sn+carry;
            carry=dble.h[MR_TOP];
            z->w[m]=dble.h[MR_BOT];
        }
#else
            carry=muldvd(x->w[m],sn,carry,&z->w[m]);
#endif
#endif
        if (carry>0)
        {
            m=xl;
            if (m>=mr_mip->nib && mr_mip->check)
            {
                mr_berror(_MIPP_ MR_ERR_OVERFLOW);
                return;
            }
            z->w[m]=carry;
            z->len=m+1;
        }
        else z->len=xl;
#endif
    }
    else while (m<xl || carry>0)
    { /* multiply each digit of x by n */ 
    
        if (m>mr_mip->nib && mr_mip->check)
        {
            mr_berror(_MIPP_ MR_ERR_OVERFLOW);
            return;
        }
#ifdef MR_NOASM
        dbled=(mr_large)x->w[m]*sn+carry;
 #ifdef MR_FP_ROUNDING
        carry=(mr_small)MR_LROUND(dbled*mr_mip->inverse_base);
 #else
  #ifndef MR_FP
        if (mr_mip->base==mr_mip->base2)
          carry=(mr_small)(dbled>>mr_mip->lg2b);
        else 
  #endif  
          carry=(mr_small)MR_LROUND(dbled/mr_mip->base);
 #endif
        z->w[m]=(mr_small)(dbled-(mr_large)carry*mr_mip->base);
#else
 #ifdef MR_FP_ROUNDING
        carry=imuldiv(x->w[m],sn,carry,mr_mip->base,mr_mip->inverse_base,&z->w[m]);
 #else
        carry=muldiv(x->w[m],sn,carry,mr_mip->base,&z->w[m]);
 #endif
#endif

        m++;
        z->len=m;
    }
    if (z->len!=0) z->len|=sx;
}

void premult(_MIPD_ big x,int n,big z)
{ /* premultiply a big number by an int z=x.n */
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;

    MR_IN(9)


#ifdef MR_FLASH
    if (mr_notint(x))
    {
        mr_berror(_MIPP_ MR_ERR_INT_OP);
        MR_OUT
        return;
    }
#endif
    if (n==0)  /* test for some special cases  */
    {
        zero(z);
        MR_OUT
        return;
    }
    if (n==1)
    {
        copy(x,z);
        MR_OUT
        return;
    }
    if (n<0)
    {
        n=(-n);
        mr_pmul(_MIPP_ x,(mr_small)n,z);
        if (z->len!=0) z->len^=MR_MSBIT;
    }
    else mr_pmul(_MIPP_ x,(mr_small)n,z);
    MR_OUT
}

#ifdef MR_FP_ROUNDING
mr_small mr_sdiv(_MIPD_ big x,mr_small sn,mr_large isn,big z)
#else
mr_small mr_sdiv(_MIPD_ big x,mr_small sn,big z)
#endif
{
    int i,xl;
    mr_small sr,*xg,*zg;
#ifdef MR_NOASM
    union doubleword dble;
    mr_large dbled;
    mr_large ldres;
#endif
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    sr=0;
    xl=(int)(x->len&MR_OBITS);
    if (x!=z) zero(z);
    if (mr_mip->base==0) 
    {
#ifndef MR_NOFULLWIDTH
        xg=x->w; zg=z->w;
/* inline - substitutes for loop below */
#if INLINE_ASM == 1
        ASM std
        ASM mov cx,xl
        ASM or cx,cx
        ASM je out2
        ASM mov bx,cx
        ASM shl bx,1
        ASM sub bx,2
#ifdef MR_LMM
        ASM push ds
        ASM push es
        ASM les di,DWORD PTR zg
        ASM lds si,DWORD PTR xg
#else
        ASM mov ax,ds
        ASM mov es,ax
        ASM mov di,zg
        ASM mov si,xg
#endif
        ASM add si,bx
        ASM add di,bx
        ASM mov bx,sn
        ASM push bp
        ASM xor bp,bp
    tcl2:
        ASM mov dx,bp
        ASM lodsw
        ASM div bx
        ASM mov bp,dx
        ASM stosw
        ASM loop tcl2

        ASM mov ax,bp
        ASM pop bp
#ifdef MR_LMM
        ASM pop es
        ASM pop ds
#endif
        ASM mov sr,ax
     out2:
        ASM cld
#endif
#if INLINE_ASM == 2
        ASM std
        ASM mov cx,xl
        ASM or cx,cx
        ASM je out2
        ASM mov bx,cx
        ASM shl bx,2
        ASM sub bx,4
#ifdef MR_LMM
        ASM push ds
        ASM push es
        ASM les di,DWORD PTR zg
        ASM lds si,DWORD PTR xg
#else
        ASM mov ax,ds
        ASM mov es,ax
        ASM mov di, zg
        ASM mov si, xg
#endif
        ASM add si,bx
        ASM add di,bx
        ASM mov ebx,sn
        ASM push ebp
        ASM xor ebp,ebp
    tcl2:
        ASM mov edx,ebp
        ASM lodsd
        ASM div ebx
        ASM mov ebp,edx
        ASM stosd
        ASM loop tcl2

        ASM mov eax,ebp
        ASM pop ebp
#ifdef MR_LMM
        ASM pop es
        ASM pop ds
#endif
        ASM mov sr,eax
     out2: 
        ASM cld
#endif
#if INLINE_ASM == 3
        ASM mov ecx,xl
        ASM or ecx,ecx
        ASM je out2
        ASM mov ebx,ecx
        ASM shl ebx,2
        ASM mov esi, xg
        ASM add esi,ebx
        ASM mov edi, zg
        ASM add edi,ebx
        ASM mov ebx,sn
        ASM push ebp
        ASM xor ebp,ebp
    tcl2:
        ASM sub esi,4
        ASM mov edx,ebp
        ASM mov eax,[esi]
        ASM div ebx
        ASM sub edi,4
        ASM mov ebp,edx
        ASM mov [edi],eax
        ASM dec ecx
        ASM jnz tcl2

        ASM mov eax,ebp
        ASM pop ebp
        ASM mov sr,eax
     out2:
        ASM nop
#endif
#if INLINE_ASM == 4

        ASM (
           "movl %4,%%ecx\n"
           "orl  %%ecx,%%ecx\n"
           "je 3f\n"
           "movl %%ecx,%%ebx\n"
           "shll $2,%%ebx\n"
           "movl %2,%%esi\n"
           "addl %%ebx,%%esi\n"
           "movl %1,%%edi\n"
           "addl %%ebx,%%edi\n"
           "movl %3,%%ebx\n"
           "pushl %%ebp\n"
           "xorl %%ebp,%%ebp\n"  
         "2:\n"  
           "subl $4,%%esi\n"
           "movl %%ebp,%%edx\n"
           "movl (%%esi),%%eax\n"
           "divl %%ebx\n"
           "subl $4,%%edi\n"
           "movl %%edx,%%ebp\n"
           "movl %%eax,(%%edi)\n"
           "decl %%ecx\n"
           "jnz 2b\n"
 
           "movl %%ebp,%%eax\n"
           "popl %%ebp\n"
           "movl %%eax,%0\n"
        "3:"
           "nop"  
        :"=m"(sr)
        :"m"(zg),"m"(xg),"m"(sn),"m"(xl)
        :"eax","edi","esi","ebx","ecx","edx","memory"
        );
#endif
#ifndef INLINE_ASM
        for (i=xl-1;i>=0;i--)
        {
#ifdef MR_NOASM
            dble.h[MR_BOT]=x->w[i];
            dble.h[MR_TOP]=sr;
            z->w[i]=(mr_small)(dble.d/sn);
            sr=(mr_small)(dble.d-(mr_large)z->w[i]*sn);
#else
            z->w[i]=muldvm(sr,x->w[i],sn,&sr);
#endif
        }
#endif
#endif
    }
    else for (i=xl-1;i>=0;i--)
    { /* divide each digit of x by n */
#ifdef MR_NOASM
        dbled=(mr_large)sr*mr_mip->base+x->w[i];
#ifdef MR_FP_ROUNDING
        z->w[i]=(mr_small)MR_LROUND(dbled*isn);
#else
        z->w[i]=(mr_small)MR_LROUND(dbled/sn);
#endif
        sr=(mr_small)(dbled-(mr_large)z->w[i]*sn);
#else
#ifdef MR_FP_ROUNDING
        z->w[i]=imuldiv(sr,mr_mip->base,x->w[i],sn,isn,&sr);
#else
        z->w[i]=muldiv(sr,mr_mip->base,x->w[i],sn,&sr);
#endif
#endif
    }
    z->len=x->len;
    mr_lzero(z);
    return sr;
}
         
int subdiv(_MIPD_ big x,int n,big z)
{  /*  subdivide a big number by an int   z=x/n  *
    *  returns int remainder                     */ 
    mr_unsign32 sx;
#ifdef MR_FP_ROUNDING
    mr_large in;
#endif
    int r,i,msb;
    mr_small lsb;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return 0;

    MR_IN(10)
#ifdef MR_FLASH
    if (mr_notint(x)) mr_berror(_MIPP_ MR_ERR_INT_OP);
#endif
    if (n==0) mr_berror(_MIPP_ MR_ERR_DIV_BY_ZERO);
    if (mr_mip->ERNUM) 
    {
        MR_OUT
        return 0;
    }

    if (x->len==0)
    {
        zero(z);
        MR_OUT
        return 0;
    }
    if (n==1) /* special case */
    {
        copy(x,z);
        MR_OUT
        return 0;
    }
    sx=(x->len&MR_MSBIT);
    if (n==2 && mr_mip->base==0)
    { /* fast division by 2 using shifting */
#ifndef MR_NOFULLWIDTH

/* I don't want this code upsetting the compiler ... */
/* mr_mip->base==0 can't happen with MR_NOFULLWIDTH  */

        copy(x,z);
        msb=(int)(z->len&MR_OBITS)-1;
        r=z->w[0]&1;
        for (i=0;;i++)
        {
            z->w[i]>>=1;
            if (i==msb) 
            {
                if (z->w[i]==0) mr_lzero(z);
                break;
            }
            lsb=z->w[i+1]&1;
            z->w[i]|=(lsb<<(MIRACL-1));
        }

        MR_OUT
        if (sx==0) return r;
        else       return (-r);
#endif
    }

#ifdef MR_FP_ROUNDING
    in=mr_invert(n);
#endif
    if (n<0)
    {
        n=(-n);
#ifdef MR_FP_ROUNDING
        r=(int)mr_sdiv(_MIPP_ x,(mr_small)n,in,z);
#else
        r=(int)mr_sdiv(_MIPP_ x,(mr_small)n,z);
#endif
        if (z->len!=0) z->len^=MR_MSBIT;
    }
#ifdef MR_FP_ROUNDING
    else r=(int)mr_sdiv(_MIPP_ x,(mr_small)n,in,z);
#else
    else r=(int)mr_sdiv(_MIPP_ x,(mr_small)n,z);
#endif
    MR_OUT
    if (sx==0) return r;
    else       return (-r);
}

int remain(_MIPD_ big x,int n)
{ /* return integer remainder when x divided by n */
    int r;
    mr_unsign32 sx;
#ifdef MR_FP
    mr_small dres;
#endif
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return FALSE;

    MR_IN(88);

    sx=(x->len&MR_MSBIT);
    if (n==2 && MR_REMAIN(mr_mip->base,2)==0)
    { /* fast odd/even check if base is even */
        MR_OUT
        if (MR_REMAIN(x->w[0],2)==0) return 0;
        else
        {
            if (sx==0) return 1;
            else       return (-1);
        } 
    }
    copy(x,mr_mip->w0);
    r=subdiv(_MIPP_ mr_mip->w0,n,mr_mip->w0);
    MR_OUT
    return r;
}

BOOL subdivisible(_MIPD_ big x,int n)
{
    if (remain(_MIPP_ x,n)==0) return TRUE;
    else                return FALSE;
}

int hamming(_MIPD_ big x)
{
    int h;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return 0;
    MR_IN(148);
    h=0;
    copy(x,mr_mip->w1);
    absol(mr_mip->w1,mr_mip->w1);
    while (size(mr_mip->w1)!=0)
        h+=subdiv(_MIPP_ mr_mip->w1,2,mr_mip->w1);
    
    MR_OUT
    return h;
}

void bytes_to_big(_MIPD_ int len,char *ptr,big x)
{ /* convert len bytes into a big           *
   * The first byte is the Most significant */
    int i,j,m,n,r;
    unsigned int dig;
    unsigned char ch;
    mr_small wrd;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(140);

    zero(x);

    if (len<=0)
    {
        MR_OUT
        return;
    }
/* remove leading zeros.. */
    while (*ptr==0) 
    {
        ptr++; len--;
        if (len==0) 
        {
            MR_OUT
            return;
        } 
    }

    if (mr_mip->base==0)
    { /* pack bytes directly into big */
#ifndef MR_NOFULLWIDTH
        m=MIRACL/8;  
        n=len/m;
        r=len%m;
		wrd=(mr_small)0;  
        if (r!=0)
        {
            n++; 
            for (j=0;j<r;j++) {wrd<<=8; wrd|=MR_TOBYTE(*ptr++); }
        }
        x->len=n;
        if (n>mr_mip->nib && mr_mip->check)
        {
            mr_berror(_MIPP_ MR_ERR_OVERFLOW);
            MR_OUT
            return;
        }
        if (r!=0) 
        {
            n--;
            x->w[n]=wrd;
        }
        for (i=n-1;i>=0;i--)
        {
            for (j=0;j<m;j++) { wrd<<=8; wrd|=MR_TOBYTE(*ptr++); }
            x->w[i]=wrd;
        }
        mr_lzero(x);     /* needed */
#endif
    }
    else
    {
        for (i=0;i<len;i++)
        {
            if (mr_mip->ERNUM) break;
            premult(_MIPP_ x,256,x);
            ch=MR_TOBYTE(ptr[i]);
            dig=ch;  
            incr(_MIPP_ x,(int)dig,x);
        }
    }

    MR_OUT
} 

int big_to_bytes(_MIPD_ int max,big x,char *ptr,BOOL justify)
{ /* convert big into octet string */
    int i,j,r,m,n,len,start;
    unsigned int dig;
    unsigned char ch;
    mr_small wrd;

#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return 0;

    if (size(x)==0 || (max<=0 && justify)) return 0; 
    MR_IN(141);

    mr_lzero(x);        /* should not be needed.... */
    if (mr_mip->base==0)
    {
#ifndef MR_NOFULLWIDTH
        m=MIRACL/8;
        n=(int)(x->len&MR_OBITS);
        n--;
        len=n*m;
        wrd=x->w[n]; /* most significant */
        r=0;
        while (wrd!=(mr_small)0) { r++; wrd>>=8; len++;}
        r%=m;

        if (max>0 && len>max)
        {
            mr_berror(_MIPP_ MR_ERR_TOO_BIG);
            MR_OUT
            return 0; 
        }

        if (justify)
        {
            start=max-len;
            for (i=0;i<start;i++) ptr[i]=0; 
        }
        else start=0;
        
        if (r!=0)
        {
            wrd=x->w[n--];
            for (i=r-1;i>=0;i--)
            {
                ptr[start+i]=(char)(wrd&0xFF);
                wrd>>=8;
            }  
        }

        for (i=r;i<len;i+=m)
        {
            wrd=x->w[n--];
            for (j=m-1;j>=0;j--)
            {
                ptr[start+i+j]=(char)(wrd&0xFF);
                wrd>>=8;
            }
        }
#endif
    }
    else
    {
        copy(x,mr_mip->w1);
        for (len=0;;len++)
        {
            if (mr_mip->ERNUM) break;

            if (size(mr_mip->w1)==0)
            {
                if (justify)
                {
                   if (len==max) break;
                }
                else break;
            }

            if (max>0 && len>=max)
            {
                mr_berror(_MIPP_ MR_ERR_TOO_BIG);
                MR_OUT
                return 0; 
            }
            dig=(unsigned int)subdiv(_MIPP_ mr_mip->w1,256,mr_mip->w1);
            ch=MR_TOBYTE(dig);
            for (i=len;i>0;i--) ptr[i]=ptr[i-1];
            ptr[0]=MR_TOBYTE(ch);
        }
    }
    MR_OUT
    if (justify) return max;
    else         return len;
}
}

