dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Projet Ecstasy)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_3D)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Raccourcis,Introduction,#intro,Aperçus du
jeu,#view,Téléchargement,#download,Au coeur
d'Ecstasy,#heart,Liens,#links), BANNIERES)

divert(DIVERT_BODY_CODE)

SUBSECTION(ICON_READ[]Présentation,intro)

<p>Ecstasy est un projet étudiant d'info-sup fait à l'école EPITA
   (2002-2003), réalisé en OpenGl et Borland Delphi et ayant pour buts
   de simuler la dynamique d'une voiture (confère mon
   MYLINK(tuto_dyna,tutoriel)), et de représenter en 3D la circulation
   automobile d'une ville de type américaine (c'est à dire ayant une
   forme géométrique régulière).</p>

<p>Les dessins 3D des voitures proviennent de nombreux sites web
  consacrés au jeu
  EXTLINK(https://fr.wikipedia.org/wiki/Midtown_Madness_2,Midtown
  Madness II), sont téléchargeables gratuitement puis ont été
  converties au format 3D Studio Max et enfin exportées au format
  ASE. Si leurs auteurs ne veulent pas les voir dans ce jeu, qu'ils
  me fasse signe et je les retirerais aussitôt du programme.</p>

SUBSECTION(ICON_EYES[]Aperçus du jeu,view)

TABLEAU(3,CAPTION(ecstasy/saut.jpg),
CAPTION(ecstasy/pont.jpg),
CAPTION(ecstasy/menu.jpg))
CENTER(Cliquer sur les images pour les agrandir.)

SUBSECTION(ICON_DOWNLOAD[]Téléchargement,download)

<p>Ce projet n'est plus développé mais le code source est disponible
sur GITHUB(Lecrapouille/Ecstasy,GitHub). Il vous faudra un Delphi
Borland (version 5 de mémoire) pour compiler les sources. Certaines
ressources graphiques et sonores n'y ont pas été mises sur le repo git
(pour des soucis de poids) mais vous pouvez les télécharger ci-dessous.

TABLEAU(3,LINK(ecstasy/ecstasy1_setup.rar,Ecstasy version 0.1),
LINK(ecstasy/ecstasy1_light.rar,Version légère version 0.1),
LINK(ecstasy/ecstasy1_sources.rar,Les sources version 0.1),
ICON_TGZ,ICON_TGZ,ICON_TGZ,
9 Mo --- format RAR,
3.4 Mo --- format RAR,
1.7 Mo --- format RAR,
LINK(ecstasy/ecstasy2.rar,Ecstasy version 0.2),
LINK(ecstasy/ecstasy2_sources.rar,Les sources version 0.2),
LINK(ecstasy/ecst_sout4.pdf,Le rapport),
ICON_TGZ,ICON_TGZ,ICON_PDF,
6 Mo --- format RAR,
1.5 Mo --- format RAR,
500 Ko --- format PDF)

<p>Remarques:</p>
<ul>
<li>Ce projet fonctionne pour Windows 98, XP mais n'a pas été testé sur
  des versions plus récentes.</li>
<li>Ce projet n'a pas été conçu pour fonctionner pour Linux, Mac OS
  X (Window étant imposé par nos professeurs).</li>
<li>Programmeurs novices à l'époque, nous n'avons omis de mettre
  un cadenceur pour la boucle d'itération du jeu (en général 30 ou 60
  images par secondes). Donc, selon la puissance de votre PC, le jeu
  peut être extrémement rapide, le rendant injouable.</li>
<li>Dans la version 0.2, les immeubles suivent mieux l'altitude de la
  route, la vitesse du jeu est plus rapide que dans la première
  version et le roulis a été rajouté à la voiture du
  joueur. Toutefois, il subsiste une erreur dans la dynamique des
  voitures et c'est pour cela, qu'il n'y a qu'un seul type de voiture
  dans cette version (le jeu reste tout à fait jouable). </li>
<li>La version 0.1 contient un setup qui permet d'installer et de
  supprimer correctement le jeu (il y aura aucun risque de plantage
  pour votre Windows car l'installation consiste simplement à copier
  l'exécutable à l'endroit désiré par l'utilisateur et rien de
  plus). Dans la version 2, il n'y aura pas de setup (vu que je n'ai
  pas le temps de recréer le setup).</li>
</ul>


SUBSECTION(ICON_GEAR[]Au coeur d'Ecstasy,heart)

<p>Si un joueur veut définir lui-même sa propre voiture
dans 3D Studio Max. Il peut facilement l'importer dans Ecstasy de la
façon suivante :</p>
<ul>
<li>Créer un nouveau dossier avec le nom de la voiture dans le
    dossier STRONG(data\Voitures).</li>
<li>Dessiner une carcasse de voiture avec 3D Studio Max et l'exporter
    au format ASE (ascii) dans le nouveau dossier sous le nom de STRONG(carcasse.ase). La
    voiture doit avoir une longueur de 12 unités et 5
    unités de largeur et doit avoir sa tête
    orientée vers la droite dans la fenêtre STRONG(Top)
    (LINK(ecstasy/export0.jpg,voir l'image)). Attention toutes les
    meshes doivent avoir leur texture : si un seul triangle ne
    possède pas sa texture Ecstasy ne démarre pas. Pensez
    à centrer la voiture sur l'origine !</li>
<li>Pour l'exporter en ASE cochez les options comme dans l'image
    suivante (LINK(ecstasy/export1.jpg,voir l'image)).</li>
<li>Dessiner également la roue gauche centrée sur
l'origine et l'exporter sous STRONG(roue.ase).</li>
<li>Prendre une photo de la voiture et la nommer
    STRONG(photo.jpg).</li>
<li>Mettre les textures (au format bmp, tga ou jpeg) dans le dossier
    STRONG(data\Textures).</li>
<li>Créer un fichier STRONG(info.txt) et mettre les
    paramètres de la voiture (poids de la roue, de la carcasse,
    raideur des ressort, position des roues, etc).</li>
<li>Lancer le programme, sélectionner la nouvelle voiture et
jouer.</li>
</ul>

TABLEAU(2,CAPTION(ecstasy/export0.jpg),CAPTION(ecstasy/export1.jpg))
CENTER(Cliquer sur les images pour les agrandir.)

<p>Trois remarques :</p>
<ul>
<li>Si la voiture ne plaît pas au joueur, alors celui-ci peut la supprimer directement du
    dossier. Ecstasy doit avoir au moins une voiture pour pouvoir s'exécuter.</li>
<li>Si un ou plusieurs des fichiers suivants (carcasse.ase, roue.ase,
    photo.jpg ou info.txt) n'existe pas (ou porte un autre nom) un
    message d'erreur apparaît et la voiture ne sera pas prise en
    compte dans le jeu.</li>
<li>Modifier les paramètres de la voiture, sans comprendre ce
    que l'on fait, peut conduire à des problèmes
    numériques; par exemple, si la réaction du sol est
    trop forte ou le pas en temps est trop grand des
    instabilités numériques peuvent apparaître et
    entraîner l'arrêt du programme.</li>
</ul>


SUBSECTION(ICON_GEAR[]Liens utiles pour la programmation OpenGL,links)


<p>Voici quelques sites qui ont retenu mon attention concernant OpenGL
  et Delphi. La plupart des liens sont malheureusement morts, mais je
  les laisse au cas ou.</p>
<ul>
  <li>OpenGl et Delphi :
    <ul>
      <li>Le site de Martin Beaudet : utile pour apprendre à
      créer sa première fenêtre et ses primitives
      en OpenGl-Delphi :
      EXTLINK(http://iquebec.ifrance.com/eraquila/).</li>
      <li>Le site de Jan Horn : excellent site sur OpenGl en Delphi :
      EXTLINK(http://www.sulaco.co.za/).</li>
      <li>Le site Delphi3D : Programmes intéressants et leurs
      codes à
      télécharger. EXTLINK(http://www.delphi3d.net/).</li>
      <li>Glscene : un composant OpenGl pour Delphi (freeware)
      EXTLINK(http://glscene.sourceforge.net/index.php).</li>
      <li>MnOgl : un autre composant OpenGl pour delphi, mais moins
      évolué que Glscene
      EXTLINK(http://www.delphi32.com/vcl/4731/).</li>
    </ul>
  </li>
  <li>OpenGl et C (et autres langages) :
    <ul>
      <li>Le site The OpenGL Challenge :
      EXTLINK(http://videogamer.dhs.org/).</li>
      <li>Le site de nehe avec de nombreux tutoriaux :
      EXTLINK(http://nehe.gamedev.net/).</li>
      <li>Le site de GameTutorials : EXTLINK(http://www.gametutorials.com).</li>
    </ul>
  </li>
</ul>

divert(DIVERT_FOOTER_CODE)

END_BODY(speedway,Le projet SpeedWay,simtadyn,Le projet SimTaDyn)
