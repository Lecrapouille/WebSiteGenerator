dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Projet SimTaDyn : Simulation Tableur Dynamique)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_3D)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Présentation,#intro,Aperçus de SimTaDyn,#view,Telechargement,#download,Au coeur de SimTaDyn,#heart,Liens,#links),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Le projet SimTaDyn)
SUBSECTION(ICON_READ[]Présentation,intro)

<p>SimTaDyn (acronyme pour Simulation Tableur Dynamique) est un
   prototype de tableur spécialisé dans la gestion dynamique de cartes
   géographiques. Le but est de dessiner une carte géographique puis
   de la manipuler comme une feuille de tableur en faisant dessus des
   calculs complexes grâce à un langage interprété. Un exemple typique
   est la résolution de système par la méthode des éléments finis.</p>

<p>SimTaDyn est un projet info spé EPITA (2003-2004) libre et gratuit,
   même les sources. Il a été fait en C, GTK, Opengl et MySQL.  Il
   fonctionne sur Mac Os X 10.3 avec X11 et sur une distribution Linux
   (Mandrake 9.1 par exemple) ou Unix. Il n'a pas été testé sur
   Windows !!!</p>

<p>Les auteurs sont :</p>
LISTE(Minh-Long NGUYEN,Benoit MARCOT,Quentin QUADRAT)

<p>STRONG(NOTE :) Cela fait exactement SIMTADYN_ANNIVERSARY ans que
  mes deux comparses, qui m'ont servis d'esclaves-développeurs, n'ont
  strictement rien compris au but de ce logiciel !? Ca fait plaisir
  ;0) !!</p>

SUBSECTION(ICON_EYES[]Aperçus de SimTaDyn,view)

TABLEAU(3,CAPTION(simtadyn/window.jpg),
CAPTION(simtadyn/utilisation.jpg),
CAPTION(simtadyn/squelette.jpg))
CENTER(Cliquer sur les images pour les agrandir.)


SUBSECTION(ICON_GEAR[]Au coeur de SimTaDyn,heart)


<p>Un tableur est un éditeur de feuilles de calcul, à savoir des
   tables de cellules formant un pavage rectangulaire. Chaque cellule
   contient des données de type divers y compris des fonctions
   susceptibles de faire du calcul sur son contenu et celui des autres
   cellules.</p>

<p>Un Système d'Information Géographiques (SIG) est un autre type
   d'éditeur manipulant des tables contenant des champs ayant des
   interprétations géographiques. Elles sont représentées par des
   cartes permettant d'accéder facilement aux champs n'ayant pas
   d'interprétations géographiques. De plus, les SIG ne contiennent
   pas de fonctions susceptibles d'agir sur la table donc sur la
   carte. L'accés aux champs non géographiques est obtenu en pointant
   sur un objet particulier. Seuls les champs de l'objet désigné sont
   affichés contrairement aux tableurs qui essaient toujours de
   montrer l'ensemble des données. Par contre, leurs outils d'édition
   de cartes sont très puissants.</p>

<p>Les fonctionnalités des tableurs et des SIG ont donc toujours été
   dissociées. SimTaDyn est un prototype de synthèse de ces deux types
   de fonctionnalités. Il manipule des tables dynamiques c.à.d. des
   tables pouvant contenir en plus des données standards des fonctions
   capables de modifier la table elle-même. Il représente les données
   géographiques en positionnant les objets correspondants dans le
   plan. Il essaie de viualiser simultanément tous les objets de même
   type.</p>

<p>SimTaDyn, à la différence des tableurs standards, ne possède plus
   forcément un pavage de cellules rectangulaires mais un pavage
   polygonal quelconque du plan. De plus, les frontières des pavés ---
   qui sont des lignes brisées donc, finalement, une union de
   segments --- sont considérées comme des cellules à part entière. De
   même, les bords des segments sont des sommets eux mêmes considérés
   comme des cellules à part entière. Donc finalement, SimTaDyn,
   possède trois types de cellules : les sommets, les segments et les
   pavés. Les cellules contiennent aussi plusieurs champs, dont
   certains peuvent être des fonctions mathématiques.</p>

SUBSECTION(ICON_DOWNLOAD[]Téléchargement,download)


TABLEAU(2,LINK(simtadyn/simtadyn_soutenance4.pdf,Le rapport),
LINK(simtadyn/simtadyn_sources.tar.gz,Les Sources de SimTaDyn),
ICON_PDF,ICON_TGZ,
400 Ko --- format PDF,
500 Ko --- format TAR.GZ )

<p>SimTaDyn fonctionne sur Mac Os X 10.3 avec X11 et sur une
   distribution Linux (Mandrake 9.1 par exemple) ou Unix. Il n'a pas
   été testé sur Windows !!!</p>

<p>STRONG(Dépendances.) Pour installer SimTaDyn il faudra installer au par
   avant les outils suivants :</p>

LISTE(Un compilateur C,MySQL EXTLINK(http://www.mysql.org).,
      GTK+2.0 EXTLINK(http://www.gtk.org).,
      GtkGLExt EXTLINK(http://www.gtkglext).,
      OpenGL EXTLINK(http://www.opengl.org).)

divert(DIVERT_FOOTER_CODE)

END_BODY(ecstasy,Le projet Ecstasy,myforth,Interpréteur Forth)
