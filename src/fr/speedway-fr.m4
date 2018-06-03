divert(DIVERT_HEADER)

TITLE(Projet SpeedWay)
KEYWORDS(3D Game, Delphi, OpenGL, EPITA)
DESCRIPTION(3D game made opengl and delphi)
SECONDARY_HEAD_MENU(SECONDARY_HEAD_MENU_3D)

divert(DIVERT_LEFT_MENU)

LEFT_RUBRIQUE(AA,BB,CC)
LEFT_RUBRIQUE(DD,EE,FF,HH,II)

divert(DIVERT_BODY)

SECTION(Le projet SpeedWay)
SUBSECTION(ICON_READ,Présentation,intro)

<p>Speedway est un doom-like 3D, où des voitures divisées en deux
   camps se combattent jusqu'à ce que l'un des deux camps ait réduit
   le nombre d'adversaire à zéro ! On peut jouer sur une demi douzaine
   d'univers et de voitures différentes.</p>

<p>Speedway est un projet étudiant à l'école EPITA (2001-2002) open
   source. Il a été fait en Opengl, Delphi Delphi et DirectSound et
   fonctionne uniquement pour Windows 95/98/2000/XP. Speedway fut,
   pour l'ensemble de l'équipe, notre premier projet (en équipe) et
   nos premiers pas dans le monde de la programmation.</p>

SUBSECTION(ICON_EYES,Aperçus du jeu,view)

TABLE(3,CAPTION(speedway/blackmesa.jpg),
CAPTION(speedway/carte.jpg),
CAPTION(speedway/ville.jpg),
CAPTION(speedway/hell.jpg),
CAPTION(speedway/foret.jpg),
CAPTION(speedway/tank.jpg))
CENTER(Cliquer sur les images pour les agrandir.)

SUBSECTION(ICON_DOWNLOAD,Téléchargement,download)

<p>Ce projet n'est plus développé mais les sources sont disponibles
   sur GITHUB(Lecrapouille/Speedway,GitHub). Il vous faudra un Delphi
   Borland (version 5 de mémoire) pour compiler les sources. Certaines
   ressources graphiques et sonores n'y ont pas été mises sur le repo
   git (pour des soucis de poids) mais vous pouvez les télécharger
   ci-dessous.

TABLE(3,LINK(speedway/speedway_soutenance4.pdf,Le
rapport),LINK(speedway/speedway.rar,SpeedWay version
0.1),LINK(speedway/speedway_sources.rar, Les Sources Delphi),
ICON_PDF,ICON_TGZ,ICON_TGZ, 100 Ko --- format PDF, 10 Mo --- format
RAR, 750 Ko --- format RAR )


SUBSECTION(ICON_GEAR,Au coeur de SpeedWay,heart)

<p>Ce projet fonctionne pour Windows 98, XP mais n'a pas été testé sur
  des versions plus récentes.</p>

<p>Ce projet n'a pas été conçu pour fonctionner pour Linux, Mac OS X
  (Window étant imposé par nos professeurs).</p>

<p>Programmeurs novices à l'époque, le jeu est très lent même avec un
    PC actuel. Cela est du aux nombreux tests de collisions non
    optimisés car testé sur tous les triangles de la scène. Un arbre
    BSP ou un Quad-Tree aurait aidé le jeu à aller plus vite.</p>

<p>Les éléments de programmation du jeu sont :</p>
LIST(Dessins (voitures et cartes) dessinés grâce au
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
LIST(STRONG(HAUT/BAS/DROIT/GAUCHE) : avance/recule/droite/gauche.,
    STRONG(1 à 6) : change d'armes.,
    STRONG(ESPACE) : tirer.,
    STRONG(HOME) : arme suivante.,
    STRONG(A) : change de vue (3 différentes).,
    STRONG(TABULATION) (change de voitures).)



SUBSECTION(ICON_GEAR,Liens utiles pour la programmation OpenGL,links)

<p>Voici quelques sites qui ont retenu mon attention concernant OpenGL
   et Delphi. La plupart des liens sont malheureusement morts, mais je
   les laisse au cas ou.</p>

LIST(OpenGl et Delphi :
      LIST(Le site de Martin Beaudet : utile pour apprendre à créer
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
      LIST(Le site The OpenGL Challenge :
            EXTLINK(http://videogamer.dhs.org/).;,

            Le site de nehe avec de nombreux tutoriaux :
            EXTLINK(http://nehe.gamedev.net/).,

            Le site de GameTutorials : EXTLINK(http://www.gametutorials.com/).)
)

divert(DIVERT_FOOTER)

END_BODY(,,ecstasy,Le projet Ecstasy)
