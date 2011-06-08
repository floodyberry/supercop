/*
 * $Id: PFLASH.h 999 2008-05-06 06:46:08Z daven $
 */
#ifndef _PFLASH_H
#define _PFLASH_H

/**
 * \brief		Perform central map of PFLASH. B = A^256^11 * A
 *
 * \param outB	Output. outB = A^256^11 * A
 * \param A		Input. L_SIGN bytes.
 *
 * \return 		Always return 0.
 */
int PFLASH_QMap( byte * outB , byte * A );

/**
 * \brief		Perform Inverse central map of PFLASH.
 *
 * \param outA	Output. B = outA^256^11 * outA
 * \param B		Input. L_SIGN bytes.
 *
 * \return		Always return 0.
 */
int PFLASH_ivsQMap( byte * outA , byte * B );

#endif   /* _PFLASH_H */
