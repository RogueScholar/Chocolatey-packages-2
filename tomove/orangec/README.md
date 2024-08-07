[![](https://img.shields.io/chocolatey/v/orangec?color=green&label=orangec)](https://chocolatey.org/packages/orangec) [![](https://img.shields.io/chocolatey/dt/orangec)](https://chocolatey.org/packages/orangec)

## Orange C/C++ Compiler (Install)

---

The Orange C/C++ Compiler is new work which includes an optimizing compiler, a tool chain, and an IDE.  The compiler itself uses various standard techniques, as well as some interesting techniques mentioned in literature.

This compiler has support for the various C standards through C11, and full support for C++ 14.  The IDE for the compiler is a full featured C/C++ language IDE including a colorizing editor with code completion, integrated make facility, debugger, and a WIN32 resource editor.  

The tool chain is highly generic and the possibility exists to customize it for embedded platforms (or for that matter for example for other operating systems) using various linker customization files along with backend code generation programs.  The existing backend code generation programs support WIN32 and MSDOS executable formats, along with a backend generator that will output Intel and Motorola hex files.  The assembler uses a simple architecture description language to customize the code generation.  The C Run time library this compiler uses is an enhancement of the RTL used by CC386.  The Run time library in this package has WIN32 headers and an import library, many windows programs will compile with it although there are a few incompatibilities.  

Documentation for this compiler and toolchain may be found at http://orangec.readthedocs.io/en/latest/Tools/. 
Continuous integration for the project is being done at https://ci.appveyor.com/project/LADSoft/orangec and you may be able to find a working beta of the next version of the compiler there. 
An interesting variation on this compiler is the MSIL version which can generate either DLL or EXE files for .net. 

This compiler will run on WIN32 and also on DOS, and generate 32-bit programs for both.   However, unlike in CC386, the DOS version is the same build as the WIN32 version, and relies on Japheth's HXDOS extender to operate in DOS.  But it will still build traditional DPMI targets e.g. for DOS32A and other extenders; the only feature missing that the DOS version of CC386 had is support for far pointers.

---

#### [choco://orangec](choco://orangec)
To use choco:// protocol URLs, install [(unofficial) choco:// Protocol support ](https://chocolatey.org/packages/choco-protocol-support)

### Package-specific issue
If this package isn't up-to-date for some days, [Create an issue](https://github.com/tunisiano187/Chocolatey-packages/issues/new/choose)

Support the package maintainer and [![Patreon](https://cdn.jsdelivr.net/gh/tunisiano187/Chocolatey-packages@d15c4e19c709e7148588d4523ffc6dd3cd3c7e5e/icons/patreon.png)](https://www.patreon.com/tunisiano)

---
