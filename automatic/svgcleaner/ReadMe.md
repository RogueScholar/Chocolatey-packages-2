[![](https://img.shields.io/chocolatey/v/svgcleaner?color=green&label=svgcleaner)](https://chocolatey.org/packages/svgcleaner) [![](https://img.shields.io/chocolatey/dt/svgcleaner)](https://chocolatey.org/packages/svgcleaner)

## svgcleanerC
Generally, SVG files produced by vector editors contain a lot of unused elements and attributes that just blow up their size without providing better visible quality.

SVG Cleaner could help you to clean up your SVG files from unnecessary data. It has a lot of options for cleanup and optimization, works in batch mode, provides threaded
processing on the multicore processors and basically does two things:

* removing elements and attributes that don't contribute to the final rendering;
* making those elements and attributes in use more compact.

Images cleaned by SVG Cleaner are typically 40-60 percent smaller than the originals.

Important! The internal image viewer in SVG Cleaner uses the QtSvg module for rendering SVG images. Qt supports only the static features of SVG 1.2 Tiny, and that imposes a 
number of restrictions on rendering of advanced features. For instance, elements such as clipPath, mask, filters etc. will not be rendered at all.

### Package-specific issue
If this package isn't up-to-date for some days, [Create an issue](https://github.com/tunisiano187/Chocolatey-packages/issues/new/choose)

Support the package maintainer and [![Patreon](https://cdn.jsdelivr.net/gh/tunisiano187/Chocolatey-packages@d15c4e19c709e7148588d4523ffc6dd3cd3c7e5e/icons/patreon.png)](https://www.patreon.com/bePatron?u=39585820)
