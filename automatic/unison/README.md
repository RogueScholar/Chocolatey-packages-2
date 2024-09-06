[![](https://img.shields.io/chocolatey/v/unison?color=green&label=unison)](https://chocolatey.org/packages/unison) [![](https://img.shields.io/chocolatey/dt/unison)](https://chocolatey.org/packages/unison)

## Unison
Unison is a file-synchronization tool for OSX, Unix, and Windows. It allows two replicas of a collection
of files and directories to be stored on different hosts (or different disks on the same host), modified
separately, and then brought up to date by propagating the changes in each replica to the other.

Unison shares a number of features with tools such as configuration management packages (CVS, PRCS,
Subversion, BitKeeper, etc.), distributed filesystems (Coda, etc.), uni-directional mirroring utilities
(rsync, etc.), and other synchronizers (Intellisync, Reconcile, etc). However, there are several points
where it differs:

* Unison runs on both Windows and many flavors of Unix (Solaris, Linux, OS X, etc.) systems. Moreover,
  Unison works across platforms, allowing you to synchronize a Windows laptop with a Unix server, for example.
* Unlike simple mirroring or backup utilities, Unison can deal with updates to both replicas of a
  distributed directory structure. Updates that do not conflict are propagated automatically. Conflicting updates are detected and displayed.
* Unlike a distributed filesystem, Unison is a user-level program: there is no need to modify the kernel
  or to have superuser privileges on either host.
* Unison works between any pair of machines connected to the internet, communicating over either a
  direct socket link or tunneling over an encrypted ssh connection. It is careful with network
  bandwidth, and runs well over slow links such as PPP connections. Transfers of small updates to large
  files are optimized using a compression protocol similar to rsync.
* Unison is resilient to failure. It is careful to leave the replicas and its own private structures in
  a sensible state at all times, even in case of abnormal termination or communication failures.
* Unison has a clear and precise specification.
* Unison is free; full source code is available under the GNU Public License.

[FAQ](https://alliance.seas.upenn.edu/~bcpierce/wiki/index.php)

### Package-specific issue
If this package isn't up-to-date for some days, [Create an issue](https://github.com/tunisiano187/Chocolatey-packages/issues/new/choose)

Support the package maintainer and [![Patreon](https://cdn.jsdelivr.net/gh/tunisiano187/Chocolatey-packages@d15c4e19c709e7148588d4523ffc6dd3cd3c7e5e/icons/patreon.png)](https://www.patreon.com/bePatron?u=39585820)
