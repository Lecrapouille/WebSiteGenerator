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

<p>Ecstasy is a Delphi and OpenGL project where its aims is to
   simulate the dynamic of a car (as explained in
   MYLINK(tuto_dyna,dynamique)) and to show in 3D the traffic of an
   american-like city (i.e. with a regular geometric shape).</p>

<p>Ecstasy is an EPITA school project (2002-2003), you can download it
   freely with its code source. The full game is not fully
   completed. Cars come from numerous sites for the Midtown Madness II
   game. If authors do not want see their cars in this game, please
   email us to remove it, and we will do it.</p>

<p>Authors are:</p>
LISTE(Anass KADIRI,Quentin QUADRAT)

SUBSECTION(ICON_EYES[]Game overview,view)

TABLEAU(3,CAPTION(ecstasy/saut.jpg),
CAPTION(ecstasy/pont.jpg),
CAPTION(ecstasy/menu.jpg))
CENTER(Click on pictures to enlarge.)

SUBSECTION(ICON_DOWNLOAD[]Download,download)

TABLEAU(3,LINK(ecstasy/ecstasy1_setup.rar,Ecstasy version 0.1),
LINK(ecstasy/ecstasy1_light.rar,Light version version 0.1),
LINK(ecstasy/ecstasy1_sources.rar,Project sources version 0.1),
ICON_TGZ,ICON_TGZ,ICON_TGZ,
9 Mo --- format RAR,
3.4 Mo --- format RAR,
1.7 Mo --- format RAR,
LINK(ecstasy/ecstasy2.rar,Ecstasy version 0.2),
LINK(ecstasy/ecstasy2_sources.rar,Project sources version 0.2),
LINK(ecstasy/ecst_sout4.pdf,The french rapport),
ICON_TGZ,ICON_TGZ,ICON_PDF,
6 Mo --- format RAR,
1.5 Mo --- format RAR,
500 Ko --- format PDF)

<p>Notes:</p>

LISTE(In the version 0.2[,] buildings follow the altitude of the road
      and the frame rate is better than the version 0.1. In this
      version, the roll of cars have been added[,] but there is a bug
      in the code that makes the dynamic of the car bottom go
      wrong. That is why one kind of car is available (the game is
      still playable).,

      In both versions[,] collisions have not been implemented (lack
      of time to implement this).,

      The version 0.1 contains a setup allowing to install the game
      (do not be afraid: there is no risk of corruption for your
      Windows: this is just a copy/paste of the exe and its data). In
      the version 0.2 there is no setup, exe is directly runnable.)

SUBSECTION(ICON_GEAR[]Inner side of Ecstasy,heart)

<p>If a player wants to add his own car with the 3D Studio
   Max software, he can easily do import it into the game by the
   followin way:</p>

LISTE(Create a new directory with the name of the car in the parent
      directory STRONG(data\Voitures) (note: all names are in french).,

      Sketch a car (without its wheels) in 3D Studio Max and export it
      in ASE format (ascii format) in the directory with the name
      STRONG(carcasse.ase). The car must be 12 units length and 5
      units width. The front of the car must be oriented to the right
      in the STRONG(Top) window (LINK(ecstasy/export0.jpg,see picture
      here)). Be careful: all meshes must have a texture ! If one mesh
      does not contains its own texture Ecstasy will not start. Think
      to center the car in the origine of the axis.,

      To export in ASE check options as showed in the following
      (LINK(ecstasy/export1.jpg,picture)).,

      Draw the left wheel centered in the axis origin. Export it as
      STRONG(roue.ase) in the repertory.,

      Take a photo of the car and name it STRONG(photo.jpg) and put it
      in the STRONG(data\Textures) repertory.,

      Create a STRONG(info.txt) file and put in it all car parameters
      (like wheel weight[,] car weight[,] spring tightness[,] wheel
      position ...).,

      Run the exe[,] select your new car and enjoy !)

TABLEAU(2,CAPTION(ecstasy/export0.jpg),CAPTION(ecstasy/export1.jpg))
CENTER(Click on picture to enlarge.)

<p>Three notes:</p>

LISTE(If the player does not like a car[,] he can remove this one
      directly from the STRONG(data\Voitures) directory. The only
      restriction is that Ecstasy has to have at least one car to get
      launched.,

      If one of the following files is missing (carcasse.ase,
      roue.ase, photo.jpg ou info.txt) or has a different name, a
      error message appears and the car will not be loaded in the
      game.,

      Modify car parameters without understanding what we're doing may
      imply numerical problems during the game. For example if the
      ground reaction is too strong or the time step is too high,
      numerical instabilities appear and get Ecstasy crashed.)

SUBSECTION(ICON_GEAR[]Useful internet links for OpenGL programmation,links)

<p>There are some sites about programming OpenGL with Delphi that have
   retained my attention:</p>

  LISTE(OpenGl and Delphi:

      LISTE(Martin Beaudet's site: useful to understand to create
            first OpenGL window and basic primitives:
            EXTLINK(http://iquebec.ifrance.com/eraquila/).,

            Jan Horn's site: a greatful site with lot of interessing
            code sources EXTLINK(http://www.sulaco.co.za/).,

            Delphi3D's: lot of interessing programs with code source
            EXTLINK(http://www.delphi3d.net/).,

            Glscene: A OpenGl componement for Delphi (freeware)
            EXTLINK(http://glscene.sourceforge.net/index.php).,

            MnOgl: an other OpenGl componement for Delphi, but less
            evolved than Glscene EXTLINK(http://www.delphi32.com/vcl/4731/)),

  LISTE(OpenGl and C (and other langage):

      LISTE(The OpenGL Challenge's site: EXTLINK(http://videogamer.dhs.org/).,

            Nehe's site: lot of tutorials EXTLINK(http://nehe.gamedev.net/).,

            GameTutorials' site: EXTLINK(http://www.gametutorials.com))))

divert(DIVERT_FOOTER_CODE)

END_BODY(speedway,Le projet SpeedWay,simtadyn,Le projet SimTaDyn)
