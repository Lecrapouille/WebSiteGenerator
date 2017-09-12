# HTML website generator from m4 files

### Introduction

This is my basic m4 tools for generating my web page in html (but why not to adapt them for your web page). M4 is a macro processing tool: it substitutes piece of text by another. In my case it allows me to simply write articles for my web sites without html markups and the m4 job is to produce all these ugly html markups. The first main goal is to avoid managing html markups by hand, which is error prone, or using a commercial and complex web tool generator producing overkill html code. The second main goal is from the initial code, I can generate other code like LaTeX, while I did not made it. Therefore, initial code is almost pure human text, and final code is a complex code to maintain that we do not have to care of.

**Note:** this tool was created when markdown started to be popular. This tools is in the same way that Linux tools for generating documentation or man pages (while I have never generated my own documentation).

### Architecture

Files extension convention (this is not conventional but very useful):
* .m4x: is used for files containing macros definitions (x for executable).
* .m4: is used for input files to be macro-processed. So all my website articles.

Project directories:
* xxx-generator: contains all m4x files for producing the output files. Here xxx is html, feel free to add other language like latex ... It also contains an emacs .el file (I'm not the author) for traducing french accents to correct html markups.
* icons: plenty of icons for my personal uses (I think all are in public domain).
* layout-xx: why limiting ourself to a single html theme ? :) It contains css files and m4x file for constructing the skull of the html page (frames).
* src/xx: contains all my .m4 articles where xx is the desired language (fr, en, ...). You'll not need them for our web pages. They can serve you as example. You can delete all of them and place your own code. Do not forget to add the '-xx' in the filename (like foo-xx.m4) and do not delete Makefiles they are used for building the web site. Makefiles are different depending on the selected tongue (I did not make a global Makefile) for example, in french, it also call emacs script for converting accents.
* build: is the directory generated containing final html code. You can delete it.

### Steps for producing the webpage
    cd src/fr
    make
    cd ../../build
    firefox index-fr.html

### Basic test

As example, create a file in src/fr named foo-fr.m4 with the content:
```
LANG
DISP_UPDATE
```

Run the makefile, you'll see in the build directory a foo-fr.html file containing something equivalent to:
```
fr
Mise &agrave; jour le : Lun 11 sep 17 (12h09)
````

### Remarks

* Beware of extra new lines generated. M4 language is pain for that. That is why you'll not see extra lines in m4x and macros finishing with the dnl token.
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