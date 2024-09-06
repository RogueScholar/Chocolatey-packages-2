[![](https://img.shields.io/chocolatey/v/SDelete?color=green&label=SDelete)](https://chocolatey.org/packages/SDelete) [![](https://img.shields.io/chocolatey/dt/SDelete)](https://chocolatey.org/packages/SDelete)

## SDelete
Securely overwrite your sensitive files and cleanse your free space of previously deleted files using this DoD-compliant secure delete program.

One feature of Windows NT/2000's (Win2K) C2-compliance is that it implements object reuse protection. This means that 
when an application allocates file space or virtual memory it is unable to view data that was previously stored in the 
resources Windows NT/2K allocates for it. Windows NT zero-fills memory and zeroes the sectors on disk where a file is 
placed before it presents either type of resource to an application. However, object reuse does not dictate that the space 
that a file occupies before it is deleted be zeroed. This is because Windows NT/2K is designed with the assumption that 
the operating system controls access to system resources. However, when the operating system is not active it is possible to 
use raw disk editors and recovery tools to view and recover data that the operating system has deallocated. Even when you 
encrypt files with Win2K's Encrypting File System (EFS), a file's original unencrypted file data is left on the disk after a 
new encrypted version of the file is created.

#### Command line usage

_SDelete_ is a command line utility that takes a number of options. In any given use, it allows you to delete one or more 
files and/or directories, or to cleanse the free space on a logical disk. _SDelete_ accepts wild card characters as part of 
the directory or file specifier.

__sdelete__ [__-p__ passes] [__-s__] [__-q__] &lt;_file_ | _directory_&gt;

__sdelete__ [__-p__ passes] [__-z__|__-c__] [drive letter]

__-a__  Remove Read-Only attribute.

__-c__  Clean free space.

__-p passes__  Specifies number of overwrite passes (default is 1).

__-q__  Don't print errors (Quiet).

__-s__ or __-r__  Recurse subdirectories.

__-z__  Zero free space (good for virtual disk optimization).

### Package-specific issue
If this package isn't up-to-date for some days, [Create an issue](https://github.com/tunisiano187/Chocolatey-packages/issues/new/choose)

Support the package maintainer and [![Patreon](https://cdn.jsdelivr.net/gh/tunisiano187/Chocolatey-packages@d15c4e19c709e7148588d4523ffc6dd3cd3c7e5e/icons/patreon.png)](https://www.patreon.com/bePatron?u=39585820)
