/**
 * The CAESAR file proposed for the competition
 * that indicates all the lengths values for the
 * key, the secret message, the public message and
 * the ciphertext
 * 
 * @file api.h
 * @author Simon Cogliani <simon.cogliani@gmail.com>
 * @author Damian Vizar <damian.vizar@epfl.ch>
 */
#ifndef __OMD_API_H__
#define __OMD_API_H__

#define CRYPTO_KEYBYTES 16  /**< Key size in bytes                               */
#define CRYPTO_NSECBYTES 0  /**< Secret message number size in bytes             */
#define CRYPTO_NPUBBYTES 16 /**< Public message number size in bytes             */
#define CRYPTO_ABYTES 16    /**< Ciphertext bytes size longer than the plaintext */

#endif /* __OMD_API_H__  */
