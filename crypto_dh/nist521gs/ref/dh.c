#include <stdio.h>
#include <string.h>
#include <inttypes.h>
#include "crypto_dh.h"

/* #define HAVE_MAIN */

#define CACHE_SAFE

#define WINDOW 5
#define PANES  105

typedef __int128 type128;
typedef int64_t type64;

static const type64 bot58bits = 0x3ffffffffffffff;
static const type64 bot52bits = 0xfffffffffffff;

/* Point Structure */

/* Point Structure */
typedef struct {
type64 x[9];
type64 y[9];
type64 z[9];
int inf;
} ECp;

#define M (1<<(WINDOW-1))
#define AFFINE_IT    /****** NEW *******/

/* w=1 */

void gone(type64 *w)
{
	w[0]=1;
	w[1]=0;
	w[2]=0;
	w[3]=0;
	w[4]=0;
	w[5]=0;
	w[6]=0;
	w[7]=0;
	w[8]=0;
}

/* w=x+y */
void gadd(type64 *x,type64 *y,type64 *w)
{
	w[0]=x[0]+y[0];
	w[1]=x[1]+y[1];
	w[2]=x[2]+y[2];
	w[3]=x[3]+y[3];
	w[4]=x[4]+y[4];
	w[5]=x[5]+y[5];
	w[6]=x[6]+y[6];
	w[7]=x[7]+y[7];
	w[8]=x[8]+y[8];
}

/* w=x-y */
void gsub(type64 *x,type64 *y,type64 *w)
{
	w[0]=x[0]-y[0];
	w[1]=x[1]-y[1];
	w[2]=x[2]-y[2];
	w[3]=x[3]-y[3];
	w[4]=x[4]-y[4];
	w[5]=x[5]-y[5];
	w[6]=x[6]-y[6];
	w[7]=x[7]-y[7];
	w[8]=x[8]-y[8];
}

/* fused operations */

/* w-=x  */
void gdec(type64 *x,type64 *w)
{
	w[0]-=x[0];
	w[1]-=x[1];
	w[2]-=x[2];
	w[3]-=x[3];
	w[4]-=x[4];
	w[5]-=x[5];
	w[6]-=x[6];
	w[7]-=x[7];
	w[8]-=x[8];
}

/* w=w-x-y */
void gtsb(type64 *x,type64 *y,type64 *w)
{
	w[0]-=x[0]+y[0];
	w[1]-=x[1]+y[1];
	w[2]-=x[2]+y[2];
	w[3]-=x[3]+y[3];
	w[4]-=x[4]+y[4];
	w[5]-=x[5]+y[5];
	w[6]-=x[6]+y[6];
	w[7]-=x[7]+y[7];
	w[8]-=x[8]+y[8];	
}

/* w=w-2x-y */
void gtsb2(type64 *x,type64 *y,type64 *w)
{
	w[0]-=2*x[0]+y[0];
	w[1]-=2*x[1]+y[1];
	w[2]-=2*x[2]+y[2];
	w[3]-=2*x[3]+y[3];
	w[4]-=2*x[4]+y[4];
	w[5]-=2*x[5]+y[5];
	w[6]-=2*x[6]+y[6];
	w[7]-=2*x[7]+y[7];
	w[8]-=2*x[8]+y[8];
}	

/* w=x */
void gcopy(type64 *x,type64 *w)
{
	w[0]=x[0];
	w[1]=x[1];
	w[2]=x[2];
	w[3]=x[3];
	w[4]=x[4];
	w[5]=x[5];
	w[6]=x[6];
	w[7]=x[7];
	w[8]=x[8];
}

/* w*=2 */
void gmul2(type64 *w)
{
	w[0]*=2;
	w[1]*=2;
	w[2]*=2;
	w[3]*=2;
	w[4]*=2;
	w[5]*=2;
	w[6]*=2;
	w[7]*=2;
	w[8]*=2;
}

/* w=2(x-y) */
void g2sb(type64 *x,type64 *y,type64 *w)
{
	w[0]=2*(x[0]-y[0]);
	w[1]=2*(x[1]-y[1]);
	w[2]=2*(x[2]-y[2]);
	w[3]=2*(x[3]-y[3]);
	w[4]=2*(x[4]-y[4]);
	w[5]=2*(x[5]-y[5]);
	w[6]=2*(x[6]-y[6]);
	w[7]=2*(x[7]-y[7]);
	w[8]=2*(x[8]-y[8]);
}

/* w=3(x+y) */
void g3ad(type64 *x,type64 *y,type64 *w)
{
	w[0]=3*(x[0]+y[0]);
	w[1]=3*(x[1]+y[1]);
	w[2]=3*(x[2]+y[2]);
	w[3]=3*(x[3]+y[3]);
	w[4]=3*(x[4]+y[4]);
	w[5]=3*(x[5]+y[5]);
	w[6]=3*(x[6]+y[6]);
	w[7]=3*(x[7]+y[7]);
	w[8]=3*(x[8]+y[8]);
}


/* w=4*w-x */
void g4sb(type64 *x,type64 *w)
{
	w[0]=4*w[0]-x[0];
	w[1]=4*w[1]-x[1];
	w[2]=4*w[2]-x[2];
	w[3]=4*w[3]-x[3];
	w[4]=4*w[4]-x[4];
	w[5]=4*w[5]-x[5];
	w[6]=4*w[6]-x[6];
	w[7]=4*w[7]-x[7];
	w[8]=4*w[8]-x[8];
}

/* w*=4 */
void gmul4(type64 *w)
{
	w[0]*=4;
	w[1]*=4;
	w[2]*=4;
	w[3]*=4;
	w[4]*=4;
	w[5]*=4;
	w[6]*=4;
	w[7]*=4;
	w[8]*=4;
}

/* w-=2*x */
void gsb2(type64 *x,type64 *w)
{
	w[0]-=2*x[0];
	w[1]-=2*x[1];
	w[2]-=2*x[2];
	w[3]-=2*x[3];
	w[4]-=2*x[4];
	w[5]-=2*x[5];
	w[6]-=2*x[6];
	w[7]-=2*x[7];
	w[8]-=2*x[8];
}

/* w-=8*x */
void gsb8(type64 *x,type64 *w)
{
	w[0]-=8*x[0];
	w[1]-=8*x[1];
	w[2]-=8*x[2];
	w[3]-=8*x[3];
	w[4]-=8*x[4];
	w[5]-=8*x[5];
	w[6]-=8*x[6];
	w[7]-=8*x[7];
	w[8]-=8*x[8];
}

/* reduce w - Short Coefficient Reduction */
void scr(type64 *w)
{
	type64 t0,t1,t2;
	t0=w[0]&bot58bits;

	t1=w[1]+(w[0]>>58);
	w[1]=t1&bot58bits;

	t2=w[2]+(t1>>58);
	w[2]=t2&bot58bits;

	t1=w[3]+(t2>>58);
	w[3]=t1&bot58bits;

	t2=w[4]+(t1>>58);
	w[4]=t2&bot58bits;

	t1=w[5]+(t2>>58);
	w[5]=t1&bot58bits;

	t2=w[6]+(t1>>58);
	w[6]=t2&bot58bits;

	t1=w[7]+(t2>>58);
	w[7]=t1&bot58bits;

	t2=w[8]+(t1>>58);
	w[8]=t2&bot58bits;

	w[0]=t0+2*(t2>>58);	
}

/* z=x^2
   Note t0=r8|r9, t1=r10|r11, t2=r12|r13, t3=r14|r15
*/

int sc=0;
int mc=0;

void gsqr(type64 *x,type64 *z)
{
	type128 t0,t1,t2;
sc++;
	t1=2*((type128)x[0]*x[8]+(type128)x[1]*x[7]+(type128)x[2]*x[6]+(type128)x[3]*x[5])+(type128)x[4]*x[4];
	t0=((type64) t1)&bot58bits;
	t2=4*((type128)x[1]*x[8]+(type128)x[2]*x[7]+(type128)x[3]*x[6]+(type128)x[4]*x[5])+(type128)x[0]*x[0]+2*(t1>>58);
	z[0]=((type64) t2)&bot58bits;
	t1=4*((type128)x[2]*x[8]+(type128)x[3]*x[7]+(type128)x[4]*x[6])+2*((type128)x[0]*x[1]+(type128)x[5]*x[5])+(t2>>58);
	z[1]=((type64) t1)&bot58bits;
	t2=4*((type128)x[3]*x[8]+(type128)x[4]*x[7]+(type128)x[5]*x[6])+2*(type128)x[0]*x[2]+(type128)x[1]*x[1]+(t1>>58);
	z[2]=((type64) t2)&bot58bits;
	t1=4*((type128)x[4]*x[8]+(type128)x[5]*x[7])+2*((type128)x[0]*x[3]+(type128)x[1]*x[2]+(type128)x[6]*x[6])+(t2>>58);
	z[3]=((type64) t1)&bot58bits;
	t2=4*((type128)x[5]*x[8]+(type128)x[6]*x[7])+2*((type128)x[0]*x[4]+(type128)x[1]*x[3])+(type128)x[2]*x[2]+(t1>>58);
	z[4]=((type64) t2)&bot58bits;
	t1=4*(type128)x[6]*x[8]+2*((type128)x[0]*x[5]+(type128)x[1]*x[4]+(type128)x[2]*x[3]+(type128)x[7]*x[7])+(t2>>58);
	z[5]=((type64) t1)&bot58bits;
	t2=4*(type128)x[7]*x[8]+2*((type128)x[0]*x[6]+(type128)x[1]*x[5]+(type128)x[2]*x[4])+(type128)x[3]*x[3]+(t1>>58);
	z[6]=((type64) t2)&bot58bits;
	t1=2*((type128)x[0]*x[7]+(type128)x[1]*x[6]+(type128)x[2]*x[5]+(type128)x[3]*x[4]+(type128)x[8]*x[8])+(t2>>58);
	z[7]=((type64) t1)&bot58bits;
	t0+=(t1>>58);
	z[8]=((type64)t0)&bot58bits;
	z[0]+=2*(type64)(t0>>58);
}

/* z=x*y
   Note t0=r8|r9, t1=r10|r11, t2=r12|r13, t3=r14|r15
*/

void gmul(type64 *x,type64 *y,type64 *z)
{
	type128 t0=(type128)x[0]*y[0] + 
		(type128)x[1]*y[1] + 
		(type128)x[2]*y[2] +
		(type128)x[3]*y[3] +
		(type128)x[4]*y[4];
	type128 t2,t3;
	type128 t5=(type128)x[5]*y[5];
	type128 t6=(type128)x[6]*y[6];
	type128 t7=(type128)x[7]*y[7];
	type128 t8=(type128)x[8]*y[8];
	type128 t1=t5+t6+t7+t8;
mc++;
	t2=t0+t1-(type128)(x[0]-x[8])*(y[0]-y[8])-(type128)(x[1]-x[7])*(y[1]-y[7])
		-(type128)(x[2]-x[6])*(y[2]-y[6])-(type128)(x[3]-x[5])*(y[3]-y[5]);
	t0+=4*t1;

	type64 st1=((type64) t2)&bot58bits;

	t3=t0-(type128)(x[4]-2*x[5])*(y[4]-2*y[5])-(type128)(x[3]-2*x[6])*(y[3]-2*y[6])
	-(type128)(x[2]-2*x[7])*(y[2]-2*y[7])-(type128)(x[1]-2*x[8])*(y[1]-2*y[8])+2*(t2>>58);
	z[0]=((type64) t3)&bot58bits;

	t0-=2*t5;
	t2=t0-(type128)(x[0]-x[1])*(y[0]-y[1])-(type128)(x[4]-2*x[6])*(y[4]-2*y[6])
		-(type128)(x[2]-2*x[8])*(y[2]-2*y[8])-(type128)(x[3]-2*x[7])*(y[3]-2*y[7])+(t3>>58);
	z[1]=((type64) t2)&bot58bits;

	t0-=t5;
	t3=t0-(type128)(x[0]-x[2])*(y[0]-y[2])-(type128)(x[5]-2*x[6])*(y[5]-2*y[6])
		-(type128)(x[3]-2*x[8])*(y[3]-2*y[8])-(type128)(x[4]-2*x[7])*(y[4]-2*y[7])+(t2>>58);
	z[2]=((type64) t3)&bot58bits;

	t0-=2*t6;
	t2=t0-(type128)(x[0]-x[3])*(y[0]-y[3])-(type128)(x[1]-x[2])*(y[1]-y[2])
		-(type128)(x[4]-2*x[8])*(y[4]-2*y[8])-(type128)(x[5]-2*x[7])*(y[5]-2*y[7])+(t3>>58);
	z[3]=((type64) t2)&bot58bits;

	t0-=t6;
	t3=t0-(type128)(x[0]-x[4])*(y[0]-y[4])-(type128)(x[1]-x[3])*(y[1]-y[3])
		-(type128)(x[5]-2*x[8])*(y[5]-2*y[8])-(type128)(x[6]-2*x[7])*(y[6]-2*y[7])+(t2>>58);
	z[4]=((type64) t3)&bot58bits;

	t0-=2*t7;
	t2=t0-(type128)(x[0]-x[5])*(y[0]-y[5])-(type128)(x[1]-x[4])*(y[1]-y[4])
		-(type128)(x[2]-x[3])*(y[2]-y[3])-(type128)(x[6]-2*x[8])*(y[6]-2*y[8])+(t3>>58);
	z[5]=((type64) t2)&bot58bits;

	t0-=t7;
	t3=t0-(type128)(x[0]-x[6])*(y[0]-y[6])-(type128)(x[1]-x[5])*(y[1]-y[5])
		-(type128)(x[2]-x[4])*(y[2]-y[4])-(type128)(x[7]-2*x[8])*(y[7]-2*y[8])+(t2>>58);
	z[6]=((type64) t3)&bot58bits;

	t0-=2*t8;
	t2=t0-(type128)(x[0]-x[7])*(y[0]-y[7])-(type128)(x[1]-x[6])*(y[1]-y[6])
		-(type128)(x[2]-x[5])*(y[2]-y[5])-(type128)(x[3]-x[4])*(y[3]-y[4])+(t3>>58);
	z[7]=((type64) t2)&bot58bits;

	st1+=((type64)(t2>>58));
	z[8]=st1&bot58bits;
	z[0]+=2*(st1>>58);
}

/*
   Inverse x = 1/x = x^(p-2) mod p
   13 muls, 520 sqrs
*/

void ginv(type64 *x)
{
	int i;
	type64 x127[9],w[9],t[9],z[9];
	gsqr(x,x127);       /* x127=x^2 */
	gmul(x127,x,t);     /* t=x^3 */
	gsqr(t,x127);       /* x127=x^6 */
	gmul(x127,x,w);     /* w=x^7 */
	gsqr(w,x127);       
	gsqr(x127,t);  
	gsqr(t,x127);       /* x127=x^56 */
	gcopy(x127,t);		/* t=x^56 */
	gmul(w,t,x127);     /* x127=x^63 */    
	gsqr(x127,t);
	gmul(t,x,x127);     /* x127=x^127 */

	gsqr(x127,t);
	gmul(t,x,z);        /* z=x^255 */

	gcopy(z,w);
	for (i=0;i<4;i++)
	{
		gsqr(z,t);
		gsqr(t,z);
	}         
	gmul(z,w,t);        /* z=z16 */  
  
	gcopy(t,w);
	for (i=0;i<8;i++)
	{
		gsqr(t,z);
		gsqr(z,t);
	}	    
	gmul(t,w,z);        /* z=z32 */   

	gcopy(z,w);
	for (i=0;i<16;i++)
	{
	gsqr(z,t);
	gsqr(t,z);
	}    
	gmul(z,w,t);        /* z=z64  */    

	gcopy(t,w);
	for (i=0;i<32;i++)
	{
		gsqr(t,z);
		gsqr(z,t);
	}    
	gmul(t,w,z);        /* z=z128  */  

	gcopy(z,w);
	for (i=0;i<64;i++)
	{
		gsqr(z,t);
		gsqr(t,z);
	}    
	gmul(z,w,t);		/* z=z256 */   

	gcopy(t,w);
	for (i=0;i<128;i++)
	{
		gsqr(t,z);
		gsqr(z,t);
	}    
	gmul(t,w,z);		/* z=z512 */     

	gsqr(z,t);
	gsqr(t,z);
	gsqr(z,t);
	gsqr(t,z);
	gsqr(z,t);
	gsqr(t,z);
	gsqr(z,t);
	gmul(t,x127,z);
	gsqr(z,t);
	gsqr(t,z);
	gmul(z,x,t);
	gcopy(t,x);
}

/* P=0 */
void inf(ECp *P)
{
	P->inf=1;
}

/* Initialise P */
void init(type64 *x,type64 *y,ECp *P)
{
	int i;
	for (i=0;i<=8;i++)
	{
		P->x[i]=x[i];
		P->y[i]=y[i];
		P->z[i]=0;
	}
	P->z[0]=1;
	P->inf=0;
}

/* P=Q */

void copy(ECp *Q,ECp *P)
{
	int i;
	for (i=0;i<=8;i++)
	{
		P->x[i]=Q->x[i];
		P->y[i]=Q->y[i];
		P->z[i]=Q->z[i];
	}
	P->inf=Q->inf;
}

/* P=-Q  */

void neg(ECp *Q,ECp *P)
{
	int i;
	for (i=0;i<=8;i++)
	{
		P->x[i]=Q->x[i]; 
		P->y[i]=-Q->y[i];
		P->z[i]=Q->z[i]; 
	}
	P->inf=Q->inf;
}

/* Make Affine */

void norm(ECp *P)
{
	type64 iz2[9],iz3[9],w[9],t[9];
	if (P->inf) return;
	gcopy(P->z,w);
	ginv(w);
	gsqr(w,iz2);
	gmul(iz2,w,iz3);
	gmul(P->x,iz2,t); scr(t); gcopy(t,P->x);
	gmul(P->y,iz3,t); scr(t); gcopy(t,P->y);
	gone(P->z);
/*	gmul(P->z,w,t); scr(t); gcopy(t,P->z); */
}

void doubl(ECp *P)
{
	type64 r0[9],r1[9],r2[9],r3[9];

	gsqr(P->z,r0);
	gsqr(P->y,r1);
	gmul(P->x,r1,r2);
	gadd(P->y,P->z,r3);
	g3ad(P->x,r0,P->y);
	gdec(r0,P->x);
	gmul(P->x,P->y,P->z);
	gsqr(P->z,P->x);
	gsb8(r2,P->x);
	scr(P->x);
	g4sb(P->x,r2);
	gmul(P->z,r2,P->y);
	gsqr(r1,r2);
	gsb8(r2,P->y);
	scr(P->y);
	gsqr(r3,P->z);
	gtsb(r0,r1,P->z);
	scr(P->z);
}

/* P+=Q, Q is affine */

void add_a(ECp *Q,ECp *P)
{
	type64 r0[9],r1[9],r2[9],r3[9],r4[9];
/*  if zs=1 then r4=xt, r1=yt */
	gsqr(P->z,r3); 
	gmul(Q->x,r3,r4); 
	gmul(Q->y,r3,r2); 
	gmul(r2,P->z,r1); 

	gdec(P->x,r4);  
	g2sb(r1,P->y,r2); 
	gsqr(r4,r0);

	gadd(P->z,r4,r1);
	gsqr(r1,P->z);
	gtsb(r3,r0,P->z);

	scr(P->z);

	gmul4(r0);
	gmul(r4,r0,r1);
	gmul(r1,P->y,r3);
 	gmul(r0,P->x,P->y);
	gsqr(r2,P->x);
	gtsb2(P->y,r1,P->x);
	scr(P->x);

	gsub(P->y,P->x,r0);
	gmul(r0,r2,P->y);
	gsb2(r3,P->y);
	scr(P->y);
}

/* P+=Q, Q is projective */

void add_p(ECp *Q,ECp *P)
{
	type64 z1z1[9],z2z2[9],u1[9],u2[9],s1[9],s2[9],h[9],i[9],j[9];
	gsqr(P->z,z1z1);

	gsqr(Q->z,z2z2);    /* Q->z=1, z2z2=1 */
	gmul(P->x,z2z2,u1);

	gmul(Q->x,z1z1,u2);

	gmul(P->y,Q->z,h);
	gmul(h,z2z2,s1);

	gmul(Q->y,P->z,h);
	gmul(h,z1z1,s2);
	gsub(u2,u1,h);
	gcopy(h,j); gmul2(j); gsqr(j,i);
	gmul(h,i,j);

	gmul(u1,i,u2);
	g2sb(s2,s1,u1);
	gsqr(u1,i);
	gsub(i,j,P->x);
	gsb2(u2,P->x);
	scr(P->x);

	gmul(s1,j,i);
	gsub(u2,P->x,j);
	gmul(j,u1,P->y);
	gsb2(i,P->y);
	scr(P->y);

	gadd(P->z,Q->z,i);
	gsqr(i,j);

	gtsb(z1z1,z2z2,j);
	gmul(h,j,P->z);
}

/* Normalise all of P[i] using one inversion - Montgomery's trick */
/* Assume P{0] is already Affine */

void multi_norm(ECp P[])
{
	int i;
	type64 t1[9],t2[9],t3[9],w[M][9];
	gone(w[1]);   
	gcopy(P[1].z,w[2]); 
	for (i=3;i<M;i++)   
		gmul(w[i-1],P[i-1].z,w[i]);

	gmul(w[M-1],P[M-1].z,t1);
	ginv(t1);

	gcopy(P[M-1].z,t2);
	gmul(w[M-1],t1,t3);
	gcopy(t3,w[M-1]);

	for (i=M-2;;i--)
	{
		if (i==1) 
		{
			gmul(t1,t2,w[1]); 
			break;
		}
		gmul(w[i],t2,t3);
		gmul(t3,t1,w[i]);
		gmul(t2,P[i].z,t3);
		gcopy(t3,t2);
	}

    for (i=1;i<M;i++) 
    {
		gone(P[i].z);
		gsqr(w[i],t1);
		gmul(P[i].x,t1,t2);
		gcopy(t2,P[i].x);
		gmul(t1,w[i],t2);
		gmul(P[i].y,t2,t1);
		gcopy(t1,P[i].y);
	}

}


/* Precomputation */

void precomp(ECp *P,ECp W[])
{
	int i;
	ECp Q;
	copy(P,&Q);
	doubl(&Q);
	copy(P,&W[0]); 
	
	for (i=1;i<M;i++)
	{
		copy(&W[i-1],&W[i]);
		add_p(&Q,&W[i]);
	}
}

/* Windows of width 4-6 */

void window(ECp *Q,ECp *P)
{
	doubl(P);
	doubl(P);
	doubl(P);
	doubl(P);
#if WINDOW>4
	doubl(P);
#if WINDOW>5
	doubl(P);
#endif
#endif

#ifdef AFFINE_IT
	add_a(Q,P);
#else
	add_p(Q,P);
#endif
}

/*
Constant time table look-up - borrowed from ed25519 
*/

void fe_cmov(type64 f[],type64 g[],int ib)
{
  type64 b=ib;
  b=-b;
  f[0]^=(f[0]^g[0])&b;
  f[1]^=(f[1]^g[1])&b;
  f[2]^=(f[2]^g[2])&b;
  f[3]^=(f[3]^g[3])&b;
  f[4]^=(f[4]^g[4])&b;
  f[5]^=(f[5]^g[5])&b;
  f[6]^=(f[6]^g[6])&b;
  f[7]^=(f[7]^g[7])&b;
  f[8]^=(f[8]^g[8])&b;
}

static void cmov(ECp *w,ECp *u,int b)
{
  fe_cmov(w->x,u->x,b);
  fe_cmov(w->y,u->y,b);
#ifndef AFFINE_IT
  fe_cmov(w->z,u->z,b);
#endif
}

/* return 1 if b==c, no branching */
static int equal(int b,int c)
{
	int x=b^c;
	x-=1;  /* if x=0, x now -1 */
	return ((x>>31)&1);
}

static void select(ECp *T,ECp W[],int b)
{
  ECp MT; 
  int m=b>>31;
  int babs=(b^m)-m;

  babs=(babs-1)/2;

  cmov(T,&W[0],equal(babs,0));  /* conditional move */
  cmov(T,&W[1],equal(babs,1));
  cmov(T,&W[2],equal(babs,2));
  cmov(T,&W[3],equal(babs,3));
  cmov(T,&W[4],equal(babs,4));
  cmov(T,&W[5],equal(babs,5));
  cmov(T,&W[6],equal(babs,6));
  cmov(T,&W[7],equal(babs,7));
#if WINDOW>4
  cmov(T,&W[8],equal(babs,8));
  cmov(T,&W[9],equal(babs,9));
  cmov(T,&W[10],equal(babs,10));
  cmov(T,&W[11],equal(babs,11));
  cmov(T,&W[12],equal(babs,12));
  cmov(T,&W[13],equal(babs,13));
  cmov(T,&W[14],equal(babs,14));
  cmov(T,&W[15],equal(babs,15));
#if WINDOW>5 
  cmov(T,&W[16],equal(babs,16)); 
  cmov(T,&W[17],equal(babs,17));
  cmov(T,&W[18],equal(babs,18));
  cmov(T,&W[19],equal(babs,19));
  cmov(T,&W[20],equal(babs,20));
  cmov(T,&W[21],equal(babs,21));
  cmov(T,&W[22],equal(babs,22));
  cmov(T,&W[23],equal(babs,23));
  cmov(T,&W[24],equal(babs,24));  
  cmov(T,&W[25],equal(babs,25));
  cmov(T,&W[26],equal(babs,26));
  cmov(T,&W[27],equal(babs,27));
  cmov(T,&W[28],equal(babs,28));
  cmov(T,&W[29],equal(babs,29));
  cmov(T,&W[30],equal(babs,30));
  cmov(T,&W[31],equal(babs,31));
#endif
#endif
  neg(T,&MT);  /* minus t */
  cmov(T,&MT,m&1);
}


/* Point Multiplication - exponent is 521 bits */

void mul(int *w,ECp *P)
{
	int i,k,j,m;
	int tsc,tmc;
	ECp W[(1<<(WINDOW-1))],S[2],Q;

	precomp(P,W);

#ifdef AFFINE_IT
	multi_norm(W);
#endif

	copy(&W[(w[PANES-1]-1)/2],P);  
	for (i=PANES-2;i>=0;i--)
	{
#ifdef CACHE_SAFE
		select(&Q,W,w[i]);
		window(&Q,P);
#else
		m=w[i]>>(8*sizeof(int)-1);
		j=(w[i]^m)-m;  
		k=(j-1)/2;
		copy(&W[k],&S[0]);
		neg(&W[k],&S[1]);
		window(&S[m&1],P);
#endif
	}

	norm(P); 
}

int crypto_dh_keypair(unsigned char *pk,unsigned char *sk)
{
	int i,x,w[PANES];
	signed char sh;
	type64 xs[9],ys[9];
	ECp P;

#ifdef HAVE_MAIN
	for (i=0;i<PANES-1;i++)
		sk[i]=rand();
#else
	randombytes(sk,PANES-1);
#endif

	for (i=0;i<PANES-1;i++)
	{
		sh=sk[i]; sh<<=4; sh>>=4; sk[i]=sh;
		w[i]=(int)sh;
	}
	w[PANES-1]=1;

/* Base point on Curve (from SafeCurves Website) */

/* Base point on NIST Curve */

	xs[0]=0x17E7E31C2E5BD66LL;
	xs[1]=0x22CF0615A90A6FELL;
	xs[2]=0x127A2FFA8DE334LL;
	xs[3]=0x1DFBF9D64A3F877LL;
	xs[4]=0x6B4D3DBAA14B5ELL;
	xs[5]=0x14FED487E0A2BD8LL;
	xs[6]=0x15B4429C6481390LL;
	xs[7]=0x3A73678FB2D988ELL;
	xs[8]=0xC6858E06B70404LL;

	ys[0]=0xBE94769FD16650LL;
	ys[1]=0x31C21A89CB09022LL;
	ys[2]=0x39013FAD0761353LL;
	ys[3]=0x2657BD099031542LL;
	ys[4]=0x3273E662C97EE72LL;
	ys[5]=0x1E6D11A05EBEF45LL;
	ys[6]=0x3D1BD998F544495LL;
	ys[7]=0x3001172297ED0B1LL;
	ys[8]=0x11839296A789A3BLL;

	init(xs,ys,&P);
	mul(w,&P);

	memcpy(pk,P.x,72);
	memcpy(&pk[72],P.y,72);
	return 0;
}

int crypto_dh(unsigned char *s,const unsigned char *pk,const unsigned char *sk)
{
	int i,x,w[PANES];
	signed char sh;
	type64 xs[9],ys[9];
	ECp P;

	for (i=0;i<PANES-1;i++)
		w[i]=(int)(signed char)sk[i];
	w[PANES-1]=1;

	memcpy(xs,pk,72);
	memcpy(ys,&pk[72],72);

	init(xs,ys,&P);
	mul(w,&P);

	memcpy(s,P.x,72);
	return 0;
}


#ifdef HAVE_MAIN

int main()
{
	int i,j;
	unsigned char ska[104],pka[144],ssa[72];
	unsigned char skb[104],pkb[144],ssb[72];
	unsigned long long skl,pkl;

	for (j=0;j<10;j++)
	{
		crypto_dh_nist521gs_ref_keypair(pka,ska);

		printf("Alice  private= ");
		for (i=0;i<104;i++) printf("%02x",ska[i]);
		printf("\n");
		printf("Alice's public= ");
		for (i=0;i<144;i++) printf("%02x",pka[i]);
		printf("\n");

		if (crypto_dh_nist521gs_ref_keypair(pkb,skb)<0)
		{
			printf("problem\n");
			break;
		}
		printf("Bob  private=   ");
		for (i=0;i<104;i++) printf("%02x",skb[i]);
		printf("\n");
		printf("Bob's public=   ");
		for (i=0;i<144;i++) printf("%02x",pkb[i]);
		printf("\n");

		if (crypto_dh_nist521gs_ref(ssa,pka,skb)<0)
		{
			printf("problem\n");
			break;
		}	

		printf("Alice's secret= ");
		for (i=0;i<72;i++) printf("%02x",ssa[i]);
		printf("\n");

		crypto_dh_nist521gs_ref(ssb,pkb,ska);

		printf("Bob's secret=   ");
		for (i=0;i<72;i++) printf("%02x",ssb[i]);
		printf("\n\n");

	}
	return 0;
}	

#endif
