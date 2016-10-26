dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Projet SpeedWay)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_3D)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Introduction,#intro,Aperçus du jeu,#view,Telechargement,#download,Au coeur de SpeedWay,#heart,Liens,#links), BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Le projet SpeedWay)
SUBSECTION(ICON_READ[]Purpose,intro)

<p>Speedway is a Doom-like 3D game, where cars divised in two teams
   are fightening each other until one of the two clan team has no
   more fighters. Speedway contains six universes and several
   differents kind of cars.</p>

<p>Speedway was a annual EPITA school project (2001-2002) and for all
   developers was the first project in computer science and first team
   work project. This project is no more in progress but the code
   source and the exe can be downloaded here and are free and open. It
   has been made in Delphi 5, OpenGL, DirectSound, so it works only
   for Windows 95/98/2000/XP.</p>

<p>Authors are:</p>
LISTE(Joel GRIGNON, Priscillien MEERMANN, Quentin QUADRAT.)

SUBSECTION(ICON_EYES[]Game overview,view)

TABLEAU(3,CAPTION(speedway/blackmesa.jpg),
CAPTION(speedway/carte.jpg),
CAPTION(speedway/ville.jpg),
CAPTION(speedway/hell.jpg),
CAPTION(speedway/foret.jpg),
CAPTION(speedway/tank.jpg))
CENTER(Click on pictures to enlarge.)

SUBSECTION(ICON_DOWNLOAD[]Download,download)

TABLEAU(3,LINK(speedway/speedway_soutenance4.pdf,The rapport),
          LINK(speedway/speedway.rar,SpeedWay version 0.1),
          LINK(speedway/speedway_sources.rar,Code sources),
          ICON_PDF,ICON_TGZ,ICON_TGZ,
          100 Ko --- format PDF,
          10 Mo --- format RAR,
          750 Ko --- format RAR)

SUBSECTION(ICON_GEAR[]Inner side of Speedway,heart)

<p>Elements of programmation of this game are:</p>

LISTE(Sketches (cards and cars) with the 3D Studio Max software.,

      Importation into the game of 3D Studio Max sketches.,

      Collision detection with cars and walls of the environement.,

      Attractive and repulsive force fields between cars and walls as
      artificial intelligence of bots.,

      Bots shoots.,

      Some special effects with OpenGL like explosions (with or
      without particles)[,] electric sparks[,] flash effect.,

      Sounds)

<p>The aim of this game is quite simple: eleminate enemy cars by
   shooting them and bring back to life dead cars. The rise is done by
   approching the player to a dead car (enemy or friendly).</p>

<p>To play, you have to know the different keys:</p>
LISTE(STRONG(UP/DOWN/RIGHT/LEFT): move forward/backward/right/left.,
    STRONG(1 to 6): change the weapon.,
    STRONG(ESPACE): shoot.,
    STRONG(HOME): next weapon.,
    STRONG(A): change the view (3 differents).,
    STRONG(TABULATION) (echange the car with a friend).)

SUBSECTION(ICON_GEAR[]Liens utiles pour la programmation OpenGL,links)

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

END_BODY(,,ecstasy,Le projet Ecstasy)
