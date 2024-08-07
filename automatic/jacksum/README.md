[![](https://img.shields.io/chocolatey/v/jacksum?color=green&label=jacksum)](https://chocolatey.org/packages/jacksum) [![](https://img.shields.io/chocolatey/dt/jacksum)](https://chocolatey.org/packages/jacksum)

## Jacksum

### Cross Platform
Jacksum works on Microsoft Windows, macOS, and GNU/Linux. It even works on Android. Since Jacksum is written in Java 
you don't need to recompile it. It works out of the box the platform independent way.


### Use Cases
Jacksum covers many types of use cases in which hash values make sense:

Calculating of hash values/fingerprints of almost any input
(command line args, console, standard input, plain or encoded strings, files, partitions, disks, NTFS ADS, pipes, 
sockets, doors, ...)
Finding OK/failed/missing/new files (verify file/data integrity)
Finding files by their fingerprints for positive matching
Finding files that do not match certain fingerprints for negative matching
Finding all duplicates of a file by its hash value
Finding the algorithm(s) that generated a certain hash value
Investigate polynomials of CRCs
Investigate parameters of HMACs


### Algorithm Support
Jacksum supports 489 hash functions, both cryptographic and non-cryptographic hash function sets, including CRCs and classic checksums:

Adler-32, ascon-hash, ascon-hasha, ascon-xof, ascon-xofa, AST strsum PRNG hash, BLAKE-[224,256,348,512], BLAKE2b-[8..512], 

BLAKE2s-[8..256], BLAKE2bp, BLAKE2sp, BLAKE3, cksum (Minix), cksum (Unix), CRC-8 (FLAC), CRC-16 (LHA/ARC), CRC-16 (Minix), 
FCS-16, CRC-24 (OpenPGP), CRC-32 (FCS-32), CRC-32 (MPEG-2), CRC-32 (bzip2), CRC-32 (FDDI), CRC-32 (UBICRC32), CRC-32 (PHP's 
crc32), CRC-64 (ISO 3309), CRC-64 (ECMA-182), CRC-64 (prog lang GO, const ISO), CRC-64 (.xz and prog lang GO, const ECMA), 
CRC-82/DARC, DHA-256, ECHO-[224,256,348,512], ed2k, ELF (Unix), esch256, esch384, Fletcher's Checksum, FNV-0_[32,64,128,256,512,1024], 
FNV-1_[32,64,128,256,512,1024], FNV-1a_[32,64,128,256,512,1024], FORK-256, Fugue-[224,256,348,512], GOST Crypto-Pro (GOST R 34.11-94), 
GOST R 34.11-94, Groestl-[224,256,384,512], HAS-160 (KISA), HAVAL-128-[3,4,5], HAVAL-[160,192,224,256]-[3,4,5], 
JH[224,256,284,512], joaat, KangarooTwelve, Keccak[224,256,384,512], Kupyna[256,384,512] (DSTU 7564:2014), 
LSH-256-[224,256], LSH-512-[224,256,384,512] (KS X 3262), Luffa-[224,256,348,512], MD2, MD4, MD5, MDC2, MarsupilamiFourteen, 
PANAMA, PRNG hash, RIPEMD-128, RIPEMD[160,256,320], RadioGatun[32,64], SHA-0, SHA-1, SHA-[224,256,384,512], 
SHA-512/[224,256] (NIST FIPS 180-4), SHA3-[224,256,384,512], SHAKE[128,256] (NIST FIPS 202), SM3, Skein-1024-[8..1024], 
Skein-256-[8..256], Skein-512-[8..512], Streebog-[256,512] (GOST R 34.11-2012), sum (BSD Unix), sum (Minix), 
sum (System V Unix), sum [8,16,24,32,40,48,56,64], Tiger, Tiger/128, Tiger/160, Tiger2, photon-beetle, PHP Tiger 
variants (tiger192,4, tiger160,4, and tiger128,4), VSH-1024, Whirpool-0, Whirlpool-T, Whirlpool, Xoodyak, xor8, and XXH32.

Jacksum supports HMAC, a mechanism for message authentication using any iterated cryptographic hash function in 
combination with a secret shared key.

Jacksum supports the "Rocksoft (tm) Model CRC Algorithm" to describe CRCs, so additional 1.0399*10^267 customized 
CRCs can be used.


### Package-specific issue
If this package isn't up-to-date for some days, [Create an issue](https://github.com/tunisiano187/Chocolatey-packages/issues/new/choose)

Support the package maintainer and [![Patreon](https://cdn.jsdelivr.net/gh/tunisiano187/Chocolatey-packages@d15c4e19c709e7148588d4523ffc6dd3cd3c7e5e/icons/patreon.png)](https://www.patreon.com/tunisiano)
