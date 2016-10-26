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
SUBSECTION(ICON_READ[]Présentation,intro)

<p>Speedway est un doom-like 3D, où des voitures divisées en deux
   camps se combattent jusqu'à l'un des deux camps ait réduit le
   nombre d'adversaire à zéro ! On peut jouer sur une demi douzaine
   d'univers et de voitures différentes.</p>

<p>Speedway fut, pour l'ensemble de l'équipe, notre premier projet (en
   équipe) et nos premiers pas dans le monde de la programmation. Ce
   projet n'est plus développé.</p>

<p>Speedway est un projet EPITA (2001-2002) libre et gratuit, même les
   sources. Il a été fait en Opengl, Delphi 5 et DirectSound.
   Fonctionne uniquement pour Windows 95/98/2000/XP.</p>

<p>Les auteurs sont :</p>
LISTE(Joel GRIGNON,
Priscillien MEERMANN,
Quentin QUADRAT.)

SUBSECTION(ICON_EYES[]Aperçus du jeu,view)

TABLEAU(3,CAPTION(speedway/blackmesa.jpg),
CAPTION(speedway/carte.jpg),
CAPTION(speedway/ville.jpg),
CAPTION(speedway/hell.jpg),
CAPTION(speedway/foret.jpg),
CAPTION(speedway/tank.jpg))
CENTER(Cliquer sur les images pour les agrandir.)

SUBSECTION(ICON_DOWNLOAD[]Téléchargement,download)

TABLEAU(3,LINK(speedway/speedway_soutenance4.pdf,Le
rapport),LINK(speedway/speedway.rar,SpeedWay version
0.1),LINK(speedway/speedway_sources.rar, Les Sources Delphi),
ICON_PDF,ICON_TGZ,ICON_TGZ, 100 Ko --- format PDF, 10 Mo --- format
RAR, 750 Ko --- format RAR )


SUBSECTION(ICON_GEAR[]Au coeur de SpeedWay,heart)

<p>Les éléments de programmation du jeu sont :</p>
LISTE(Dessins (voitures et cartes) dessinés grâce au
    logiciel 3D Studio Max.,

    Conversion de fichiers ASE de 3D Studio Max en une liste de
    triangles directement utilisables pour OpenGL.,

    Détection de collision sur les triangles de la carte
    (avec la caméra et les voitures).,

    Champs de force entre voitures et sur les murs (attractifs et
    répulsifs).,

    Tirs des voitures.,

    Quelques effets avec OpenGl comme des explosions (avec des
    particules ou uniquement avec des textures)[,] des arcs
    électriques[,] des effets d'éblouissements.,

    Sons.,

    Scénario du jeu, bonus, HUD, armes, etc.)

<p>Le scénario est très simple : éliminer toutes les voitures ennemies
   en leur tirant dessus et en convertissant les morts. La conversion
   se fait en se rapprochant de la voiture détruite et cette dernière
   ressuscite instantanément et devient un allié. Goûter alors aux
   plaisirs de la nécromancie mécanique ^^.</p>

<p>Pour jouer, vous devez connaître les touches suivantes :</p>
LISTE(STRONG(HAUT/BAS/DROIT/GAUCHE) : avance/recule/droite/gauche.,
    STRONG(1 à 6) : change d'armes.,
    STRONG(ESPACE) : tirer.,
    STRONG(HOME) : arme suivante.,
    STRONG(A) : change de vue (3 différentes).,
    STRONG(TABULATION) (change de voitures).)



SUBSECTION(ICON_GEAR[]Liens utiles pour la programmation OpenGL,links)

<p>Voici quelques sites qui ont retenu mon attention concernant OpenGL :</p>
LISTE(OpenGl et Delphi :
      LISTE(Le site de Martin Beaudet : utile pour apprendre à créer
           sa première fenêtre et ses primitives en OpenGl-Delphi :
           EXTLINK(http://iquebec.ifrance.com/eraquila/).,

           Le site de Jan Horn : excellent site sur OpenGl en Delphi :
           EXTLINK(http://www.sulaco.co.za/).,

           Le site Delphi3D : Programmes intéressants et leurs codes à
           télécharger. EXTLINK(http://www.delphi3d.net/).,

           Glscene : un composant OpenGl pour Delphi (freeware)
           EXTLINK(http://glscene.sourceforge.net/index.php).,

           MnOgl : un autre composant OpenGl pour delphi, mais moins
           évolué que Glscene
           EXTLINK(http://www.delphi32.com/vcl/4731/).),

      OpenGl et C (et autres langages) :
      LISTE(Le site The OpenGL Challenge :
            EXTLINK(http://videogamer.dhs.org/).;,

            Le site de nehe avec de nombreux tutoriaux :
            EXTLINK(http://nehe.gamedev.net/).,

            Le site de GameTutorials : EXTLINK(http://www.gametutorials.com/).)
)

divert(DIVERT_FOOTER_CODE)

END_BODY(,,ecstasy,Le projet Ecstasy)
