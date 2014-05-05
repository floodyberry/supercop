/*
   NORX reference source code package - reference C implementations

   Written in 2014 by Samuel Neves <sneves@dei.uc.pt> and Philipp Jovanovic
   <jovanovic@fim.uni-passau.de>

   To the extent possible under law, the author(s) have dedicated all copyright
   and related and neighboring rights to this software to the public domain
   worldwide. This software is distributed without any warranty.

   You should have received a copy of the CC0 Public Domain Dedication along with
   this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
*/
#define NORX_W         32  /* Word size */
#define NORX_R          6  /* Round number */
#define NORX_D          1  /* Parallelism degree */
#define NORX_A (4*NORX_W)  /* Tag size */

