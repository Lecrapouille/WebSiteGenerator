# HTML website generator from m4 files

### Introduction

If you are bored to load heavy website pages (with ~~load of~~ lot of
adds), you may be interested by this basic
[M4](https://www.gnu.org/software/m4/m4.html) tool for generating
light and static web pages. I'm using it for my [personal
website](http://q.quadrat.free.fr/index-fr.html).  So why not update
this tool for generating your web pages ?

M4 is a complete macro processing tool: it substitutes piece of text
by another piece of text. M4 manages loops, recursion, postponing
substitutions ... and therefore substitute simple m4 code into
complex-to-maintain code in targeted language. In our case, M4 allows
me to easily write text of my articles without HTML markups; its job
consists to add all these ugly HTML and CSS markups around my text for
creating with the same consistency all pages of website.  I'm no
longer get lost with diving on unbalanced HTML markups (because they
are not yet created when writing my articles) or using a commercial
and complex web tool generator producing overkill HTML code, or
forgetting to change HTML code in one page. All is generated
automatically (even accent conversions). In a second hand, from the
same articles and adapting the M4 macros, you could generate other
documents in another language like LaTeX.

You'll probably make the link with some existing Linux tools for
generating man pages (which I have never made personally) or markdown
language. I wrote this tool when markdown was not yet as popular as
nowadays and yes markdown is more friendly than my script but my
script can evolve and can be customized. Therefore, thanks to M4, you
write in almost pure human text, and you obtain at final an ugly HTML
code too complex to be maintained or easily understandable (and we,
after all who really care about beauty of generated code).

Beware M4 is both a powerful tool but also a very very difficult tool
to use and in addition, everybody seems disliking this tool: there is
no wrappers or high level routines existing other projects, I
personally got lot of headaches debugging some of my macros !

### Architecture

Files extension convention (this is not conventional but very useful):
* .m4x: is used for files containing macros definitions (x for executable).
* .m4: is used for input files to be macro-processed. So all my website
articles to be parsed into html code.

Project directories overview:
* WebSiteGenerator/
* Makefile: entry point calling html-generator/Makefile.generic for generating websites.
* html-generator/ m4x for creating html code.
* html-generator/Makefile.generic generic makefile for compiling a webpage.
* html-generator/theme contain a generic website layout will be used if you have not created your personal one.
* html-generator/emacs for converting accents to html code.

Add your websites next to WebSiteGenerator modify the file
websites.list. A real example is given
[here](https://github.com/Lecrapouille/MyWebSiteSrc).

```
MyWebSites/
├── Makefile                    Entry point (nothing to change)
├── WebSiteGenerator/           M4x code and makefiles (nothing to change)
│   └── html-generator
├── WebSiteNumber1/             Your first webpage
│   ├── en/                     Your first tongue
│   │   └── article1-en.m4
│   ├── fr/                     Your second tongue
│   │   └── article1-fr.m4
│   ├── icons/
│   └── layout/                 Will replace WebSiteGenerator/html-generator/theme
│       ├── css/
│       └── layout.m4x
├── WebsiteNumber2/             Your second webpage
│   └── en/
│       └── index-en.m4
└── websites.list               Adapt it for referencing websites to generate
```

### Steps for producing the website
```sh
make
```

The index-fr.html page has been opened. If this is not the case do:
```sh
cd build/YourWebSite/
firefox index-fr.html
```

### Prerequisite

Install the following *nix tools:
* gnu M4
* makefile
* emacs

### Basic test

As example of the power of M4, lets create a file in YourWebSite/fr named foo-fr.m4 with the content:
```
LANG
TRANS_UPDATED
```

Update websites.list and run the Makefile and you'll see in the build/YourWebSite/ directory a
file named foo-fr.html containing something equivalent to:
```
fr
Mise &agrave; jour le : Lun 11 sep 17 (12h09)
````

### My list of useful macros

Quick overview of what can be generated:
* section, subsection with anchors and links.
* table of contents from sections
* table, list
* colorful code source (C, Forth)

#### Meta

```
TITLE(My Project)
AUTHOR(John Doe,my copy-left)
KEYWORDS(word1,word2,...)
DESCRIPTION(bla bla)
```

#### Links

* External link `EXTLINK(https://github.com,link here)`.
* Internal link `ILINK(anchor_name,link here)`.
* Basic link `LINK(https://github.com,link here)`.
* Website link `MYLINK(my_page,link here)`.

#### Translation

```
define([TRANS_SENTENCE],[TRANSLATE([Table des matières],[Table of contents])])
TRANS_SENTENCE
```

#### SECTION

```
SECTION(my_icon,title,anchor,link)
SUBSECTION(my_icon,title,anchor,link)
SUBSUBSECTION(my_icon,title,anchor,link)
```

link is optional, it is used for index.html page. anchor is used for
the table of contents which is automatically created: TABLE_OF_CONTENTS

#### Picture

```
PICTURE(foo.jpg)
CAPTION_PICTURE(foo.jpg,caption)
```

#### A HTML table

The first parameter is the number of columns.
```
TABLE(2,  A,B,  C,D,  E,F)
TABLE(3,PICTURE(foo.jpg),PICTURE(bar.gif),PICTURE(foobar.png))
```

#### A HTML lists

```
LIST(a,b,LIST(b1,b2),c)
```

Beware when mixing LIST together. Compare the two codes:
```
ENUM(a,b[]LIST(1,2,3),c,d)
```
With:
```
ENUM(a,b,LIST(1,2,3),c,d)
```

#### HTML paragraph

Ok this is not done and you will have to call `<p>` and `</p>`.

### Remarks

* Beware of extra new lines generated. M4 language is pain for
  that. That is why you'll not see extra lines in m4x and macros
  finishing with the `dnl` token. I add some shell commands in the
  Makefile to kill them.

* Be sure m4x files are coded in iso-latin-1 but not UTF-8, Emacs
  script will not correctly convert accents.

* Beware of the punctuation mark ',' which can conflicting with m4
  parameter separator. You have to replace your comma by `[,]` or add
  brackets surrounding the critical sentence. Test this code:

```
LIST(1,2,3)
LIST([1,2,3])
```

### Copying/License

* The emacs/html-accent.el file does not belong to me, see its licence inside the file.
* .m4x files (I'm the author) are in public domain use and adapt them in the way you want.
