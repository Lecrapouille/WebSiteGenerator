divert(DIVERT_HEADER_CODE)

DEF_TITLE(Dynamique d'une voiture et principe de la moindre action)
DEF_KEYWORDS(principle of least action)
DEF_DESCRIPTION(Dynamics of a car with the principle of least action)
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Raccourcis,Introduction,#intro,
Aperçus,#view,Téléchargement,#download), BANNIERES)

divert(DIVERT_BODY_CODE)

SUBSECTION(ICON_READ[]Présentation,intro)

<p>Comment simuler simplement la dynamique d'une voiture pour
l'implémenter dans un jeu ?  Attention : ceci n'est pas un cours de
modélisation d'une voiture réelle, mais juste une aide pour un
simulateur très simple. Pour voir un effet de cette dynamique vous
pouvez télécharger mon jeu : LINK(dyna-LANG.html,Ecstasy).</p>

<p>Je tiens à remercier mon père pour m'avoir expliqué le principe de
la moindre action.</p>

<p>Vous trouverez sur cette page, de difficulté croissante :</p>

LISTE(Une brève introduction au LINK(dyna/dyna_action.pdf,principe de
      la moindre action)[,] avec un exemple le plus simple possible.,

      LINK(dyna/dyna_monocycle.pdf,L'étude d'un monocycle) : le
      véhicule est modélisé en 2D[,] par une carcasse de masse
      ponctuelle accrochée à une roue par un ressort.,

      LINK(dyna/dyna_moto.pdf,L'étude d'une moto) : le véhicule est
      modélisé en 2D[,] par une carcasse représentée par une barre de
      masse ponctuelle à laquelle sont accrochées deux roues par des
      ressorts. La carcasse n'a pas d'inertie et seul le tangage est
      modélisé.,

      LINK(dyna/dyna_voit.pdf,L'étude d'une voiture) : le véhicule est
      modélisé en 3D[,] par une carcasse représentée par une plaque de
      masse ponctuelle à laquelle sont accrochées quatre roues par des
      ressorts. Par rapport au sujet précédent[,] on étudie en plus le
      roulis et la carcasse a une inertie.,

      LINK(dyna/dyna_mvt_horizon.pdf,Le mouvement horizontal de la
      voiture) : comment le véhicule tourne lorsqu'on tourne le
      volant.)

SUBSECTION(ICON_EYES[]Aperçus,view)

TABLEAU(3,CAPTION(dyna/ressort.jpg),
CAPTION(dyna/moto.jpg),
CAPTION(dyna/voiture.jpg))
CENTER(Cliquer sur les images pour les agrandir.)

SUBSECTION(ICON_DOWNLOAD[]Téléchargement,download)

<p>Les documents ont été écrits en LaTex et les codes sources sont
disponibles sur GITHUB(Lecrapouille/PrincipeMoindreAction,GitHub).</p>

TABLEAU(3,
LINK(dyna/dyna_action.pdf,principe de la moindre action),
LINK(dyna/dyna_monocycle.pdf,L'étude d'un monocycle),
LINK(dyna/dyna_moto.pdf,L'étude d'une moto),
ICON_PDF,ICON_PDF,ICON_PDF,
37 Ko--- format PDF,
44 Ko --- format PDF,
49 Ko --- format PDF,
dnl
LINK(dyna/dyna_voit.pdf,L'étude d'une voiture),
LINK(dyna/dyna_mvt_horizon.pdf,Le mouvement horizontal de la voiture),
,
ICON_PDF,ICON_PDF,,
67 Ko --- format PDF,
42 Ko --- format PDF,)

divert(DIVERT_FOOTER_CODE)

END_BODY(,)
