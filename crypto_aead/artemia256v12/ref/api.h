/*
 * api.h
 *
 * Header file for Artemia-256
 */


#ifndef API_H
#define API_H

#define CRYPTO_KEYBYTES     32  /* length of key in byte */
#define CRYPTO_NSECBYTES    0   /* length of secret message number in byte */
// In Artemia, public message is nonce
#define CRYPTO_NPUBBYTES    32   /* length of public message number in byte */
/*
 * برای مثال فرض کنیم متن ساده ۲۰ بایتی باشد. یعنی ۱۲ بایت کمتر از یک بلاک کامل
 * در آرتمیای ۲۵۶ بیتی ۹۸ بیت به متن ساده اضافه می شود که این باعث می شود ۱۳ بایت
 * به متن ساده اضافه شود. با احتساب این ۱۳ بایت متن ساده به ۳۳ بایت می رسد که
 * مضربی از یک بلاک کامل (مضربی از ۳۲ بایت نیست) و برای اینکه مضربی از ۳۲ شود باید
 * طول آن را به ۶۴ بایت رساند. بنابراین طول متن ساده بعد از پدینگ به ۶۴ بایت میرسد
 * و این یعنی طول متن رمز نیز ۶۴ بایت خواهد بود و این هم یعنی اختلاف طول بین متن ساده اولیه
 * و متن رمز می تواند تا ۴۴ بایت باشد. علاوه بر این بایت‌های مربوط به تگ نیز به انتهای متن رمز
 * اضافه می‌شود. تگ به اندازه یک بلاک کامل (۳۲ بایت) است. بنابراین در کل اختلاف طول بین
 * متن ساده اولیه و متن رمز نهایی (به همراه تگ) می‌تواند تا ۷۶ بایت باشد.
 */
#define CRYPTO_ABYTES       76  /* Maximum difference between ciphertext length and plaintext lenght */
#define CRYPTO_NOOVERLAP    1   /* Implementation can not handle outputs that overlap inputs */

#endif // API_H
