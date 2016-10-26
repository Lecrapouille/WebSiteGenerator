dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Trees of binary space partitioning)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Contexte,#contexte,Sommaire du rappot,#som,
Voir le rapport,#rap,Liens,#links),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Les BSP)
SUBSECTION(ICON_EYES[]Purpose,contexte)

<p>One of significant problems during projection of a graphical scene,
   either in 2D or in 3D, is to remove hidden parts of the scene. This
   paper will show an algorithm to resolve this problem: the algorithm
   of binary space partitioning (BSP)which allows to draw objects in the
   good order: from the farthest to the nearest plan. This method is
   used in games like Half-Life I or Doom I.</p>

<p>This paper has been writen as an assessment for the EPITA school (2001-2002).</p>

SUBSECTION(ICON_READ[]Table of contents,som)

LISTE(Scene in 3D:,
      Remind of matricial computation and geomety:
      LISTE(Matricial computation,
            2D Geometry,
            2D projective geoometry,
            3D projective geoometry),
       Algorithm of binary space partitioning:
       LISTE(binary partitioning of a set,
             Representation of a 2D scene by a BSP,
             Drawer algorithm),
       Appendix:
       LISTE(Establishing the adherence of a point in a half-space,
             Partition of a 2D scene by a cut into two scenes,
             References))

SUBSECTION(ICON_READ[]See the paper,rap)

TABLEAU(1,LINK(bsp/bsp.pdf,Le rapport),ICON_PDF,format PDF -- 70 Ko)

SUBSECTION(ICON_GEAR[]Internet links to BSP trees,links)

<p>There are some sites about BSP that have retained my attention:</p>

LISTE(The FAQ about BSP: EXTLINK(http://www.faqs.org/faqs/graphics/bsptree-faq/),

  A book of M. Abrash in french: ITALIQUE(Le zen de la programmation
  graphique) Edt. International Thomson Publishing, France 1997.,

  Lot of sites talk about inplemetation about BSP in games : EXTLINK(http://www.gametutorials.com/,Gametutorials)[,]
  EXTLINK(http://www.gamedev.net/,GameDev))

divert(DIVERT_FOOTER_CODE)

END_BODY(,)
