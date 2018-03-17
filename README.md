# HTML website generator from m4 files

### Introduction

If you are bored like me of heavy-to-load websites written in HTML 5
with ~~load of~~ lot of adds, you can be interested by my basic
[M4](https://www.gnu.org/software/m4/m4.html) tool for generating
light and static web pages in pure XHTML-1.0 code (no PHP while it's
possible to add it). I'm using this tool for my [personal website](http://q.quadrat.free.fr/index-fr.html).
So, why not to adapt this tool for generating your web pages (light
websites means less electricity and therefore you save forests :) ?

M4 is a macro processing tool: it substitutes piece of text by another
piece of text. M4 manages loops, recursion, postponing substitutions.
Beware M4 is both a powerful tool but also a very very difficult tool
to use and in addition, nobody seems to like this tool and no wrappers
or high level routines exist for helping the developer, I personally
got lot of headaches debuging my macros !

M4, for this tool, allows me to easily write text of my articles
without HTML markups; its job consists to add all these ugly HTML and
CSS markups around my text for creating the website.  I'm no longer
get lost with diving on unbalanced HTML markups (because they are not
yet created) or using a commercial and complex web tool generator
producing overkill HTML code.  In a second hand, from the same
articles and adapting the M4 macros, you could generate other
documents in another language like LaTeX.

You'll probably make the link with Linux tools for generating man
pages (which I have never made personally) and I wrote this tool when
markdown was not yet as popular as nowadays.  Therefore, thanks to M4,
you write an almost pure human text, and you obtain at final an ugly
HTML code too complex to be maintained or understandable (and we,
after all, do not care of).

### Architecture

Files extension convention (this is not conventional but very useful):
* .m4x: is used for files containing macros definitions (x for executable).
* .m4: is used for input files to be macro-processed. So all my website articles to be parsed.

Project directories overview:
* **LANGUAGE**-generator/*.m4x
* layout-**NUMBER**
* src/**TONGUE**/*.m4
* src/**TONGUE**/Makefile

Where:
* **LANGUAGE**: html, latex ...
* **NUMBER**: 01, 02 ...
* **TONGUE**: fr, en, de, pe

Project directories details:
* xxx-generator: contains all m4x files for producing the output files. Here xxx is html, but feel free to add other language like LaTeX ... It also contains an Emacs .el file (I'm not the author) for traducing french accents to correct HTML codes.
* icons: plenty of icons for my personal uses (I think all are in public domain).
* layout-xx: why limiting yourself to a single HTML theme ? :) It contains css files and m4x file for constructing the skull of the HTML page (frames).
* src/xx: contains all my .m4 articles where xx is the desired language (fr, en, ...). You'll not need them for our web pages but they can serve you as example (note: they are currently stored on the git branch [old](https://github.com/Lecrapouille/PageOueb/tree/old) because not yet updated to my revised syntax).
You can delete all of m4 files and add your own files. Do not forget to add the '-xx' in the filename (like foo-xx.m4) and do not delete Makefile because
they are used for building the web site.
* src/xx/Makefile: I did not had yet time make a global Makefile. Therefore, the content of Makefile depends on the selected tongue. For example, in french,
it calls an Emacs script for converting french accents into HTML.
* build: is the created directory containing final the website with all HTML file. You can delete it and regenerate it.

### Steps for producing the website
```sh
cd src/fr
make
```

The index-fr.html page has been opened. If this is not the case, do:
```sh
cd ../../build
firefox index-fr.html
```

### Basic test

As example of the power of M4, lets create a file in src/fr named foo-fr.m4 with the content:
```
LANG
DISP_UPDATE
```

Run the Makefile and you'll see in the build/ directory a foo-fr.html file containing something equivalent to:
```
fr
Mise &agrave; jour le : Lun 11 sep 17 (12h09)
````

### My list of useful macros

TODO for details

Quick overview of what can be generated:
* section, subsection with anchros and links.
* table of contents from sections
* table, list
* colorful code source (C, Forth)

### Remarks

* Beware of extra new lines generated. M4 language is pain for that. That is why you'll not see extra lines in m4x and macros finishing with the `dnl` token. I add some shell commands in the Makefile to kill them.
* Be sure m4x files are coded in iso-latin-1 but not UTF-8, Emacs script will not correctly convert accents.
* Beware of the punctuation mark ',' which can conflicting with m4 parameter separator. You have to replace your comma by `[,]` or add brackets surrounding the critical sentence. Test this code:
```
TRANSLATE([aaa, bbb],[ccc])
```
* Beware when mixing LIST together. Compare the two codes:
```
ENUM(a,b[]LIST(1,2,3),c,d)
```
With:
```
ENUM(a,b,LIST(1,2,3),c,d)
```

### Copying

* .m4x files are public domain (I'm the author).
* The .el file is not mine, see its licence.
* The generated html pages are under the Creative Commons licence, as well as there sources (.m4 files in src/ directory).
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/fr/"><img alt="Licence Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/3.0/fr/88x31.png" /></a><br />Ce(tte) œuvre est mise à disposition selon les termes de la <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/fr/">Licence Creative Commons Attribution - Pas d’Utilisation Commerciale - Partage dans les Mêmes Conditions 3.0 France</a>.
