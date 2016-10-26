dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Les arbres de partitionnement binaire de l'espace (BSP))
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Contexte,#contexte,Sommaire du rappot,#som,
Voir le rapport,#rap,Liens,#links),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Les BSP)
SUBSECTION(ICON_EYES[]Contexte,contexte)

<p>L'un des problèmes importants lors d'une projection d'une
scène graphique, qu'elle soit en 2D ou en 3D, est
d'éliminer les parties cachées de la scène. Cet
exposé va présenter un algorithme pour résoudre
ce problème : l'algorithme de partitionnement binaire de
l'espace (Binary Space Partition en Anglais ou BSP), qui permet
d'afficher les objets les plus éloignés avant d'afficher
les plus proche. Ce procédé est utilisé par des
jeux tels que Half-Life ou Doom.</p>

<p>Ce rapport a été réalisé, en français, pour le cours de micro
informatique Epita (2001-2002).</p>


SUBSECTION(ICON_READ[]Sommaire du rapport,som)

LISTE(Scène 3D,
      Rappel de géométrie et de calcul matriciel :
      LISTE(Calcul matriciel,
            Géométrie 2D,
            Géométrie projective 2D,
            Géométrie projective 3D),
       Algorithme de partitionnement binaire de l'espace (BSP) :
       LISTE(Partitionnement binaire d'un ensemble,
             Représentation d'une scène 2D par un BSP,
             Algorithme du peintre),
       Annexes :
       LISTE(Détermination de l'appartenance d'un point à un demi-espace,
             Partition d'une scène 2D en deux scènes par une coupure,
             Références))

SUBSECTION(ICON_READ[]Voir le rapport,rap)

TABLEAU(1,LINK(bsp/bsp.pdf,Le rapport),ICON_PDF,format PDF -- 70 Ko)

SUBSECTION(ICON_GEAR[]Liens concernant les arbres BSP,links)


<p>Voici quelques sites qui ont retenu mon attention concernant les
  arbres BSP :</p>
<ul>
  <li>La FAQ sur les arbres BSP :
  EXTLINK(http://www.faqs.org/faqs/graphics/bsptree-faq/)</li>
  <li>Un livre de M. Abrash en français : ITALIQUE(Le zen de la
  programmation graphique) Edt. International Thomson Publishing,
  France 1997.</li>
  <li>Beaucoup d'autres sites web parlent et implémente des arbres
  BSP dans leur jeu
  (EXTLINK(http://www.gametutorials.com/,Gametutorials),
  EXTLINK(http://www.gamedev.net/,GameDev). Google est votre ami
  !</li>
</ul>

divert(DIVERT_FOOTER_CODE)

END_BODY(,)
