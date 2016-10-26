dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(The SimTaDyn Project: STRONG(Simu)lation STRONG(Dyn)amical Spreadsheet)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_3D)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Présentation,#intro,Aperçus de SimTaDyn,#view,Telechargement,#download,Au coeur de SimTaDyn,#heart,Liens,#links),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(The SimTaDyn project)
SUBSECTION(ICON_READ[]Purpose,intro)

<p>SimTaDyn, acronym for STRONG(Sim)ulation STRONG(Dyn)amical
   Spreadsheet (STRONG(Ta)bleur in french) as a french joke for urban
   dweller (citadin), is a prototype of spreadsheet specialized in the
   management of dynamic systems (here geographic cards). The aim is
   to sketch a geographic card then to manipulate it as a spreadsheet
   by doing (on it) complex computations thanks a interpreted
   language. A classic example is the resolution of systems by the
   finite elements method.</p>

<p>SimTaDyn is a free projet and has been made for an annual EPITA
   school project (2003-2004). Only very basic parts have been done
   and the full functionality of SimTaDyn is obviously not completed
   (this project could potentialy be very huge). Sources are open. It
   has been made in C langage, GTK, Opengl and MySQL. It works on Mac
   Os X 10.3 with the X11 server, but also on a Linux distribution
   (Mandrake 9.1 for example). Not working on Windows ! SimTaDyn was
   our first software written in C.</p>

<p>Authors are:</p>
LISTE(Minh-Long NGUYEN,Benoit MARCOT,Quentin QUADRAT)

<p>STRONG(Joke:) It makes me be very *happy* to know that since 2003
   until now than my two teamworkers have strictly understood nutts
   about the aim of this project. But they did their work
   perfectly at this epoch.</p>

SUBSECTION(ICON_EYES[]Overview of SimTaDyn,view)

TABLEAU(3,CAPTION(simtadyn/window.jpg),
CAPTION(simtadyn/utilisation.jpg),
CAPTION(simtadyn/squelette.jpg))
CENTER(Click on pictures to see them in larger size.)


SUBSECTION(ICON_GEAR[]On the inner side of SimTaDyn,heart)

<p>A spreadsheet is a calculus sheet editor, i.e. array of cells
   making a rectangular paving. Each cell is ebale to store different
   types of data and even functions ebale to do computation on its
   contents and with the content of other cells.</p>

<p>A geographic information system (GIS) is an other type of editor
   manipulating tables of fields with geographical
   interpretations. They are represented by cards that allow to access
   easily to fields that have not geographical interpretations. In
   addition, GIS do not contain dynamic functions eable to modify the
   table and so on the card. The access to non-geographic fields is
   obtained by pointing on a particular object. Only fields of the
   selected objects are showed contrary to spreadsheets who try to
   show the whole set of data. On other hand, cards edition tools are
   very powerful.</p>

<p>By consecency, functionalities of spreadsheets and GIS have always
   be dissociated. SimTaDyn is a prototype of fusion of this two types
   of functionalities. It handles dynamic tables, i.e. tables eable to
   data but also functions modifying this table itself. It shows
   geographic data by visualizing matching objects in the same
   map.</p>

<p>SimTaDyn, unlike to classic spreadsheets, does not have a paving of
   rectangular cells but a paving of polygonals of . In addition,
   borders of cell (which are polylines so a union of seglents) are
   also considered as cells. Borders of segements are vertexes and are
   also considered as cells. So, SimTaDyn manipulates three types of
   cells : vertex, segments, polygons. Cells contains several fields
   where some of them are methamatical functions.</p>

SUBSECTION(ICON_DOWNLOAD[]Download,download)


TABLEAU(2,LINK(simtadyn/simtadyn_soutenance4.pdf,The rapport),
LINK(simtadyn/simtadyn_sources.tar.gz,SimTaDyn sources),
ICON_PDF,ICON_TGZ,
400 Ko --- format PDF,
500 Ko --- format TAR.GZ )

<p>SimTaDyn works on Mac Os X 10.3 with the X11 server, but also on a
   Linux distribution (Mandrake 9.1 for example). Not working on
   Windows !<p>

<p>STRONG(Prerequisites.) To install SimTaDyn, you have to install the
   following tools:</p>

LISTE(Un compilateur C,MySQL EXTLINK(http://www.mysql.org).,
      GTK+2.0 EXTLINK(http://www.gtk.org).,
      GtkGLExt EXTLINK(http://www.gtkglext).,
      OpenGL EXTLINK(http://www.opengl.org).)

divert(DIVERT_FOOTER_CODE)

END_BODY(ecstasy,Le projet Ecstasy,myforth,Forth Interpretor)
