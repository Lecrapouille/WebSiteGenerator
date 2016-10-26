dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

dnl DEF_TITLE(Quentin QUADRAT - Ingénieur informaticien des systèmes temps réel (EPITA))
DEF_TITLE(Page personelle de Quentin QUADRAT)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_HOME)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(
LEFT_RUBRIC(Projets sur le temps réel,Projet Hélicoptère quatre
rotors,helico_intro-LANG.html,Suivi automatique de voiture
CyCab,stages_travail2-LANG.html),

LEFT_RUBRIC(Tutoriels sur le TR,Le logiciel Scilab/Scicos,tuto_scicos-LANG.html,Le logiciel SynDEx,tuto_syndex-LANG.html,
Programmation du port série,comm_rs232-LANG.html),

LEFT_RUBRIC(Projets Informatiques,Interpréteur
Forth,myforth-LANG.html,SimTaDyn,simtadyn-LANG.html,Ecstasy,ecstasy-LANG.html,SpeedWay,speedway-LANG.html),

LEFT_RUBRIC(Tutoriels,Dynamique d'une voiture,tuto_dyna-LANG.html,Les
arbres de partitionnement binaire de l'espace,tuto_bsp-LANG.html,Chargeur
de fichier ASE,tuto_ase-LANG.html,Programmation avec le langage de macro M4,tuto_m4-LANG.html),

LEFT_RUBRIC(Expérience professionnelle,CV,cv-LANG.html,Stages à
l'INRIA Rocquencourt,tuto_syndex-LANG.html),BANNIERES)

divert(DIVERT_BODY_CODE)

<!-- ICON_BUILD STRONG(ATTENTION l'ensemble de ce site est en construction) -->

<!-- <p>STRONG(Chapitrage :)</p>
<ul>
<li>LINK(helico_intro-LANG.html,Construction d'un hélicoptère quatre rotors)</li>
<li>LINK(stages_travail2-LANG.html,Voiture CyCab)</li>
<li>LINK(myforth-LANG.html,Interpréteur Forth)</li>
<li>LINK(simtadyn-LANG.html,Le projet SimTaDyn)</li>
<li>LINK(ecstasy-LANG.html,Le projet Ecstasy)</li>
<li>LINK(speedway-LANG.html,Le projet SpeedWay)</li>
<li>LINK(dyna-LANG.html,Dynamique simplifiée d'une voiture)</li>
<li>LINK(bsp-LANG.html,Elimination des parties cachées)</li>
<li>LINK(ase-LANG.html,Le format ASE)</li>
<li>LINK(stages_presentation-LANG.html,Stages)</li>
</ul> -->

SECTION(Projets sur les systèmes embarqués et le temps réel,tr)
SUBSECTION(ICON_GEAR[]Construction d'un hélicoptère quatre rotors,helico,helico_intro)

<p>Etude et réalisation d'une plateforme volante à quatre
   rotors du type Dragonflyer, X-UFO ou Engager.</p>
<p>Cette étude comprend les parties suivantes :</p>
LISTE(construction de la carcasse de l'hélicoptère et du banc de test, réalisation
de la carte électronique, programmation des microcontrôleurs de
la commande automatique, communication avec un ordinateur non
embarqué.)

<p>ICON_BUILD STRONG(PROJET EN COURS DE REALISATION).</p>

SUBSECTION(ICON_GEAR[]Stage à l'INRIA sur du suivi automatique de voitures
CyCab,cycab,stages_travail2)

<p>Le CyCab est un véhicule électrique de 300 Kg développé à
   l'INRIA destiné au transport de deux personnes dans des
   environnements urbains et péri-urbains encombrés. Sa longueur
   n'excède pas celle d'un vélo, c'est-à-dire 1.9 mètre pour une
   largeur de 1.2 mètre. Le but de mon stage à l'INRIA Rocquencourt a
   été de poursuivre un travail mené sur le suivi automatique de
   CyCabs avec une caméra bas coût et les logiciels Scilab, Scicos et
   SynDEx.</p>

SECTION(Tutoriels concernant le temps réel,tutotr)

SUBSECTION(ICON_READ[]Le logiciel de de modélisation et de simulation
Scicos,tuto_scicos,tuto_scicos)
<p>Scicos est un logiciel de modélisation graphique pour
  systèmes dynamiques et est une boite à outil inclus dans le logiciel
  Scilab. Avec Scicos on peut créer des blocs diagrammes pour
  modéliser et simuler la dynamique de systèmes hybrides et compiler
  des modèles dans un code exécutable. Scicos est utilisé pour le
  traitement du signal et la commande automatique et étudier des
  systèmes physique et biologiques.</p>

<p>Comme ce logiciel est utilisé pour le développement de mon
   MYLINK(helico_intro,hélicoptère quatre rotors), j'explique ici son
   fonctionnement, comment lier des bibliothèques C dans ses blocs
   diagrammes et comment le configurer pour l'interfacer dans une
   application temps réel (en boucle avec un système embarqué).</p>

SUBSECTION(ICON_READ[]Le logiciel SynDEx,tuto_syndex,tuto_syndex)

<p>SynDEx est un logiciel de CAO basé sur la méthodologie AAA
   "algorithm-architecture adequation", pour le prototypage rapide et
   l'optimisation de l'implémentation d'applications temps réel
   distribuée sur des architectures multicomposents. Il a été designé
   puis développé à l'INRIA Rocquencourt par l'équipe AOSTE.</p>

<p>Comme ce logiciel est utilisé pour le développement de mon
   MYLINK(helico_intro,hélicoptère quatre rotors), j'explique ici son
   fonctionnement, comment utiliser son IHM et comment convertir des
   blocs diagrammes Scicos vers SynDEx.</p>

SUBSECTION(ICON_READ[]Programmation du port série au standard POSIX,comm_rs232,comm_rs232)
<p>ICON_BUILD[]Ce tutoriel explique le fonctionnement du port série et
  la norme RS232, puis montre les fonctions POSIX pour développer son
  propre protocole.</p>

SECTION(Projets en informatique,infos)
SUBSECTION(ICON_GEAR[]Interpréteur Forth,myforth,myforth)

<p>MyForth est un interpréteur de langage Forth en cours de
   réalisation qui devrait être, à terme, multitâche. Le Forth est un
   langage à pile qui possède un dictionnaire de mots agissant sur la
   pile. Un programme Forth définit de nouveaux mots qui s'ajoutent à
   ce dictionnaire. Il possède des mécanismes simples et généraux
   permettant de construire de nouveaux types de données
   efficaces.</p>

<p>ICON_BUILD STRONG(PROJET ARRETE).</p>


SUBSECTION(ICON_GEAR[]SimTaDyn,simtadyn,simtadyn)

<p>SimTaDyn est un prototype de tableur spécialisé dans la gestion
   d'objets dynamiques 2D comme les cartes géographiques ou les
   mailleurs 2D.  Il permet l'édition d'objets 2D qui sont des pavages
   du plan manipulables comme des cellules d'une feuille d'un
   tableur. A chaque pavé peut-être associé à une dynamique définie
   par un mot Forth. Un pavé est polygonal, ses bords et ses sommets
   sont eux aussi vus comme des cellules d'un tableur. On peut donc
   aussi leur associer des mots Forth.</p>

SUBSECTION(ICON_GEAR[]Ecstasy,ecstasy,ecstasy)

<p>Ecstasy est un jeu en 3D. Le joueur conduit un voiture dans une
  ville de type américaine construite sur un tore. Elle est
  constituée d'immeubles, de terrains, d'un fleuve et d'une
  centaine de voitures qui s'arrêtent aux feux tricolores.
  Chaque voiture est un modélisée par un système
  mécanique à 9 degrés de liberté.</p>


SUBSECTION(ICON_GEAR[]SpeedWay,speedway,speedway)

<p>Speedway est un jeu de tirs en 3D, où des voitures divisées en deux
   camps se combattent.  On peut jouer sur une demie douzaine de
   cartes et avec une dizaine de véhicules différents.</p>

SECTION(Tutoriels)
SUBSECTION(ICON_READ[]Programmation avec le langage de macro M4,qqm4,tuto_m4)
<p>ICON_BUILD[]Ce tutoriel explique le fonctionnement du langage de
  macro M4.</p>


SUBSECTION(ICON_READ[]Dynamique d'une voiture,dynavoit,tuto_dyna)

<p>Comment simuler une voiture avec sa suspension dans un jeu ? Tout
   d'abord, vous trouverez un bref rappel sur le principe de la
   moindre action.  Après, on abordera l'étude du tangage d'une moto :
   le véhicule est modélisé en 2D, par une carcasse représentée par
   une barre de masse ponctuelle à laquelle sont accrochées deux roues
   par des ressorts. Enfin, on attaquera l'étude du roulis et du
   tangage d'une voiture : le véhicule est modélisé en 3D, par une
   plaque à laquelle sont accrochées quatre roues par des
   ressorts.</p>


SUBSECTION(ICON_READ[]Les arbres de partitionnement binaire de l'espace,bsp,tuto_bsp)

<p>L'un des problèmes importants lors d'une projection d'une scène
   graphique, qu'elle soit en 2D ou en 3D, est d'éliminer ses parties
   cachées. Cet exposé va présenter un algorithme pour résoudre ce
   problème : l'algorithme de partitionement binaire de l'espace
   (Binary Space Partition en Anglais ou BSP), qui permet d'afficher
   les objets les plus éloignés aux plus proches.</p>


SUBSECTION(ICON_READ[]Le format ASE de 3D Studio Max,ase,tuto_ase)
<p>Lorsque vous utilisez 3D Studio Max, il se peut que vous voulez
   exporter votre dessin pour pouvoir l'utiliser dans votre jeu. L'un
   des nombreux formats d'exportation est le format ASE (ASCII Scene
   Export). Quelle est sa syntaxe ? Quelles sont les similitudes avec
   celle d'OpenGL ? Vous trouverez ici comment exporter une scène
   statique composée d'une caméra et de plusieurs objets ainsi que
   leur texture.</p>

SECTION(Expérience professionnelle)
SUBSECTION(ICON_EYES[]Aide à la conception de noyau applicatif pour le
logiciel SynDEx,syndex,stages_presentation)
<p>Mes deux stages à l'INRIA Rocquencourt, au sein de l'équipe AOSTE.</p>

SUBSECTION(ICON_EYES[]Curriculum Vitae,cv,cv)

<p>Accéder à mon curriculum vitae (format html et pdf).</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(,,plansite,Plan du site)
