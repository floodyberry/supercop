/*
    BLS short signature scheme - in BATS friendly form
*/

#include <iostream>
#include <fstream>
#include <string.h>
#include "sizes.h"
#include "ecn.h"
#include "ecn3.h"
#include "zzn6.h"
#include "randombytes.h"
//#include <ctime>

// cofactor - number of points on curve=CF.q

#define CF 2  

using namespace std;

// Fixed domain parameters

static char *ptext="7DDCA613A2E3DDB1749D0195BB9F14CF44626303"; // modulus
static char *Btext="21C3F3AC7864D1F1F99273D0F828D3657D8CFD4E"; // B as in y^2=x^3-3X+B
static char *qtext="3EEE5309D171EED8BA4E12DEF44414FD17D369B7"; // group order
static char *cftext="FBB94C2745C7BB62E93BBADB1D6BFF48B23BE531"; // co-factor
static char *srutext="72CDF30042AFCA0EB2C4BC1C378DA9B104273844"; // 6-th root of unity
static char *Px2text="11CE4686D2B3F3E1A2221D132438ECEAC78FAAA9"; // Fixed generator P[(0,x,0),(x,x,x)]
static char *Py1text="492CCD8B6F243CC2D897BC827E4C006DAA6D6726";
static char *Py2text="3A46A0A5A5E09874B0567C36863E18B226D4B612";
static char *Py3text="46480454EC71B7111D6650FE5C87D88C30B0DF20";

static int cnr=-2;

#define HASH_LEN 20

//
// Tate Pairing Code
//
// Extract ECn point in internal ZZn format
//

void extract(ECn& A,ZZn& x,ZZn& y,ZZn& z)
{ 
    big t;
    x=(A.get_point())->X;
    y=(A.get_point())->Y;
    t=(A.get_point())->Z;
    if (A.get_status()!=MR_EPOINT_GENERAL) z=1;
    else                                   z=t;
}

//
// Line from A to destination C. Let A=(x,y)
// Line Y-slope.X-c=0, through A, so intercept c=y-slope.x
// Line Y-slope.X-y+slope.x = (Y-y)-slope.(X-x) = 0
// Now evaluate at Q -> return (Qy-y)-slope.(Qx-x)
//

ZZn6 line(ECn& A,ECn& C,ZZn& slope,ZZn3& Qx,ZZn3& Qy)
{
     ZZn6 w;
     ZZn3 nn=Qx;
     ZZn x,y,z,t;

     extract(A,x,y,z);
     x*=z; t=z; z*=z; z*=t;
     x*=slope; t=slope*z;
     nn*=t; nn-=x; t=z;
     extract(C,x,x,z);
     nn+=(z*y); t*=z;
     w.set(nn,-Qy*t);

     return w;
}

//
// Add A=A+B  and C=C+D 
// and evaluate line functions
// could use Montgomery's trick, but probably not worth it
// I/M ratio is 48:1
//

ZZn6 g(ECn& A,ECn& B,ECn& C,ECn& D,ZZn3& Qx,ZZn3& Qy,ZZn3& Sx,ZZn3& Sy)
{
    ZZn6 u;

    ZZn lam;
    big ptr;
    ECn P;
 
    P=A;
    ptr=A.add(B);
    if (ptr==NULL)  return (ZZn6)1;
    lam=ptr; 
    u=line(P,A,lam,Qx,Qy);

    P=C;
    ptr=C.add(D);
    if (ptr==NULL)  return (ZZn6)1;
    lam=ptr;
    return u*line(P,C,lam,Sx,Sy);
}

//
// Fast double-Tate-Pairing, with shared Miller variable and one final exponentiation
//

BOOL fast_double_tate_pairing(ECn& P,ZZn3& Qx,ZZn3& Qy,ECn& R,ZZn3& Sx,ZZn3& Sy,Big& q,Big &cf)
{ 
    int i,j,n,nb,nbw,nzs;
    ECn A1,A2,P2,R2,t1[16],t2[16];
    ZZn6 w,hc,zn[16],res;
    Big m;

    res=zn[0]=1;  

    t1[0]=P2=A1=P;
    t2[0]=R2=A2=R;

    w=g(P2,P2,R2,R2,Qx,Qy,Sx,Sy);

//
// Build windowing table
//
    for (i=1;i<16;i++)
    {
        hc=g(A1,P2,A2,R2,Qx,Qy,Sx,Sy);
        t1[i]=A1;
        t2[i]=A2;
        zn[i]=w*zn[i-1]*hc;
    }

    A1=P;
    A2=R;

/* Left to right method  */
    m=q-1; // skip last iteration
    nb=bits(m);
    for (i=nb-2;i>=0;i-=(nbw+nzs))
    {
        n=window(m,i,&nbw,&nzs);  // standard MIRACL windowing

        for (j=0;j<nbw;j++)
        {
            res*=res;    
            res*=g(A1,A1,A2,A2,Qx,Qy,Sx,Sy);
        }
        if (n>0)
        {
            res*=zn[n/2];
            res*=g(A1,t1[n/2],A2,t2[n/2],Qx,Qy,Sx,Sy);
        }  
        for (j=0;j<nzs;j++) 
        {
            res*=res;    
            res*=g(A1,A1,A2,A2,Qx,Qy,Sx,Sy);
        }  
    }

    if (A1!=-P || A2!=-R || res.iszero()) return FALSE;
    w=res;                          
    w.powq();
    res*=w;                        // ^(p+1)

    w=res;
    w.powq(); w.powq(); w.powq();
    res=w/res;                     // ^(p^3-1)

    w=res.powq();
    res.powq(); res*=res; // res*=res;  // res=pow(res,CF);

    if (cf<0) res/=powu(w,-cf);
    else res*=powu(w,cf);
 
    if (res==(ZZn6)1) return TRUE;
    return FALSE;   
}

BOOL ecap2(ECn& P,ECn3 Q,ECn& R,ECn3 &S,Big& order,Big& cf)
{
    ECn PP=P;
    ECn RR=R;
    ZZn3 Qx,Qy,Sx,Sy;
    int qnr=-get_mip()->cnr;

    normalise(PP);
    Q.get(Qx,Qy);

// untwist    
    Qx=Qx/qnr;
    Qy=tx(Qy);
    Qy=Qy/(qnr*qnr);

    RR=R;

    normalise(RR);
    S.get(Sx,Sy);

// untwist    
    Sx=Sx/qnr;
    Sy=tx(Sy);
    Sy=Sy/(qnr*qnr);

    return fast_double_tate_pairing(PP,Qx,Qy,RR,Sx,Sy,order,cf);
}

//
// Hash functions
// 

Big H1(char *string,int len)
{ // Hash a zero-terminated string to a number < modulus
    Big h,p;
    char s[HASH_LEN];
    int i,j; 
    sha sh;

    shs_init(&sh);

    for (i=0;i<len;i++)
        shs_process(&sh,string[i]);
    
    shs_hash(&sh,s);
    p=get_modulus();
    h=1; j=0; i=1;
    forever
    {
        h*=256; 
        if (j==HASH_LEN)  {h+=i++; j=0;}
        else         h+=s[j++];
        if (h>=p) break;
    }
    h%=p;
    return h;
}

// Hash and map a Client Identity to a curve point E_(Fp) of order q

ECn hash_and_map(char *ID,int len)
{
    ECn Q;
    Big x0=H1(ID,len);
// jacobi tests
    while (!is_on_curve(x0)) x0+=1;
// one modular square root
    Q.set(x0);
    Q*=CF;
    return Q;
}

int crypto_sign_keypair(unsigned char *pk,unsigned char *sk)
{
    miracl* mip=mirsys(40,16);
    ECn3 P,R;
    ZZn3 x3,y3;
    ZZn a,b,c;
    Big s,p,q,B,px2,py1,py2,py3;
    char seed[20];
    int i;
//    time_t seed;
    mip->IOBASE=16;

    p=ptext;
    B=Btext;
    q=qtext;
    px2=Px2text;
    py1=Py1text;
    py2=Py2text;
    py3=Py3text;

//    time(&seed);
//    irand((long)seed);

    instr(mip->sru,srutext);
    mip->cnr=cnr;
//    init_zzn3(p);

    ecurve((Big)-3,B,p,MR_PROJECTIVE);
    mip->TWIST=TRUE;   // map to point on twisted curve E(Fp3)

    x3.set((ZZn)0,(ZZn)px2,(ZZn)0);
    y3.set((ZZn)py1,(ZZn)py2,(ZZn)py3);
    P.set(x3,y3);

// get random secret key

    for (i = 0;i < 20;++i) {
      unsigned char c;
      randombytes(&c,1);
      seed[i] = c;
    }

    s=from_binary(20,seed);
    s%=q;
//    s=rand(q);

    to_binary(s,20,(char *)sk,TRUE);

// generate public values.

    R=P; R*=s;

    R.get(x3,y3);

    x3.get(a,b,c);

    to_binary(a,20,(char *)&pk[120],TRUE);
    to_binary(b,20,(char *)&pk[140],TRUE);
    to_binary(c,20,(char *)&pk[160],TRUE);

    y3.get(a,b,c);

    to_binary(a,20,(char *)&pk[180],TRUE);
    to_binary(b,20,(char *)&pk[200],TRUE);
    to_binary(c,20,(char *)&pk[220],TRUE);

    return 0;
}

int signatureofshorthash(unsigned char *sm,mr_unsign64 *smlen,const unsigned char *m,mr_unsign64 mlen,const unsigned char *sk,mr_unsign64 sklen)
{
    miracl* mip=mirsys(40,16);
    ECn PM;
    Big x,y,s,p,B;
    int lsb,bits;
    mip->IOBASE=16;

    p=ptext;
    B=Btext;

    ecurve((Big)-3,B,p,MR_PROJECTIVE);

    s=from_binary((int)sklen,(char *)sk);
    PM=hash_and_map((char *)m,32);
    PM*=s;
    lsb=PM.get(x);

    to_binary(x,20,(char *)sm,TRUE);
    *smlen=20;

    if (lsb) sm[0]|=0x80;

    return 0;
}

int verification(const unsigned char *m,mr_unsign64 mlen,const unsigned char *sm,mr_unsign64 smlen,const unsigned char *pk,mr_unsign64 pklen)
{
    miracl* mip=mirsys(40,16);
    ECn S,HM;
    ECn3 P,R;
    ZZn3 u,v,x3,y3;
    Big a,b,c;
    Big p,q,x,B,cf,cfp,px2,py1,py2,py3;
    int lsb;
    unsigned char sm2[SHORTHASH_BYTES];
    mip->IOBASE=16;
    
    p=ptext;
    B=Btext;
    q=qtext;
    cf=cftext;
    px2=Px2text;
    py1=Py1text;
    py2=Py2text;
    py3=Py3text;

    memcpy(sm2,sm,SHORTHASH_BYTES);

    instr(mip->sru,srutext);
    mip->cnr=cnr;
//    init_zzn6(p);

    ecurve((Big)-3,B,p,MR_PROJECTIVE);
    cfp=cf-CF*p;  // ~ (t-1)
    mip->TWIST=TRUE;   // map to point on twisted curve E(Fp3)

    x3.set((ZZn)0,(ZZn)px2,(ZZn)0);
    y3.set((ZZn)py1,(ZZn)py2,(ZZn)py3);

    P.set(x3,y3);

    a=from_binary(20,(char *)&pk[120]);
    b=from_binary(20,(char *)&pk[140]);
    c=from_binary(20,(char *)&pk[160]);

    x3.set(a,b,c);

    a=from_binary(20,(char *)&pk[180]);
    b=from_binary(20,(char *)&pk[200]);
    c=from_binary(20,(char *)&pk[220]);

    y3.set(a,b,c);

    R.set(x3,y3);

    lsb=0;
    if (sm2[0]&0x80) {lsb=1; sm2[0]&=0x7F;}
    
    x=from_binary(20,(char *)sm2);
    if (!S.set(x,1-lsb)) return -100;
    HM=hash_and_map((char *)m,32);

    if (ecap2(S,P,HM,R,q,cfp)) return 0;
    else                       return -100;
}

int copyrightclaims()
{
    return 30;
}

int patentclaims()
{
    return 20;
}
/*
int main()
{
    unsigned char sk[SECRETKEY_BYTES]; mr_unsign64 sklen;
    unsigned char pk[PUBLICKEY_BYTES]; mr_unsign64 pklen;
    unsigned char m[SHORTHASH_BYTES]; mr_unsign64 mlen;
    unsigned char sm[SIGNATURE_BYTES]; mr_unsign64 smlen;

    int i;
//    forever {
    cout << "Create key pair" << endl;
    keypair(sk,&sklen,pk,&pklen);
//    for (i=0;i<sklen;i++) printf("%02x",sk[i]);
//    printf("\n");
//    for (i=0;i<pklen;i++) printf("%02x",pk[i]);
//    printf("\n");

    strcpy((char *)m,"This a quick test of the method"); mlen=32;
    cout << "Apply signature" << endl;
    signatureofshorthash(sm,&smlen,m,mlen,sk,sklen);

//    for (i=0;i<smlen;i++) printf("%02x",sm[i]);
//    printf("\n");
    cout << "Verify signature" << endl;
    if (verification(m,mlen,sm,smlen,pk,pklen)==0) cout << "signature is good" << endl;
    else                                           {cout << "signature is bad" << endl; exit(0);}
//    }
    return 0;
}
*/

