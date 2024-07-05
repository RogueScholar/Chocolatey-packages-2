[![](https://img.shields.io/chocolatey/v/keepass-plugin-kpfloatingpanel?color=green&label=keepass-plugin-kpfloatingpanel)](https://chocolatey.org/packages/keepass-plugin-kpfloatingpanel) [![](https://img.shields.io/chocolatey/dt/keepass-plugin-kpfloatingpanel)](https://chocolatey.org/packages/keepass-plugin-kpfloatingpanel)

## KeePass KPScript
KPScript allows automating database operations in KeePass. There are two ways to automate KeePass: single command operations and KPScript files:

* [Command Operations](http://keepass.info/help/v2_dev/scr_index.html): KPScript can be invoked using
single commands. By passing the database location, its key, a command and eventually some parameters,
simple operations like adding an entry can be performed. The syntax is very simple, no scripting
knowledge is required. This method is ideal when you quickly want to do some small changes to the
database. It is not recommended when you need to perform many operations, because for each command the
database needs to be loaded from file, decrypted, modified, encrypted and written back to file.
* [C# Script Files](http://keepass.info/help/v2_dev/scr_kps_index.html): These files are a lot more
powerful than single command operations, but are also more complicated. You need to have heavy
experience in C# programming and the KeePass 2.x internals. Within KPS files you can do everything that
KeePass does.

### Package-specific issue
If this package isn't up-to-date for some days, [Create an issue](https://github.com/tunisiano187/Chocolatey-packages/issues/new/choose)

Support the package maintainer and [![Patreon](https://cdn.jsdelivr.net/gh/tunisiano187/Chocolatey-packages@d15c4e19c709e7148588d4523ffc6dd3cd3c7e5e/icons/patreon.png)](https://www.patreon.com/tunisiano)