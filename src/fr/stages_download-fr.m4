dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Stages à l'INRIA Rocquencourt, équipe AOSTE)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_CV)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Raccourcis,Présentation,#intro,Histoire de la conduite automatique,#histoire,Cyber Cabi,#cycab,Travail effectué,#travail,Résumé,#resume),
LEFT_RUBRIC(Pages suivantes,Présenation,stages_presentation-LANG.html,Stage INRIA 2,stages_travail2-LANG.html,
Stage INRIA 1,stages_travail1-LANG.html,Download,stages_download-LANG.html),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Stage 2)
SUBSECTION(Sujet)
<p>Le but de ce stage a été de poursuivre le travail mené sur le suivi automatique de CyCabs.
Il a fallu implémenter un algorithme d'estimation de la distance entre deux véhicules basé sur de
la détection de contours dans des images. Il a fallu déterminer l'asservissement longitudinal du
CyCab suiveur en simulation avec le logiciel Scilab. Enfin, il a fallu générer, grâce à la chaîne
d'outils Scilab/Scicos/SynDEx le code temps réel, avec ses communications et synchronisations
distribuées sur chacun des processeurs embarqués.</p>

SUBSECTION(Download,down2)
TABLEAU(3,LINK(stages/Stage2/quadrat_q-rapport.pdf,Rapport),
LINK(stages/Stage2/quadrat_q-slides.pdf,Transparents soutenance),
LINK(stages/Stage2/CyCabWebCamera33.tar.bz2,Code source),
ICON_PDF,ICON_PDF,ICON_TGZ,
1.7 Mo --- format PDF,
6.7 Mo --- format PDF,
75.7 Mo --- format TAR.BZ2)

<p>Note:</p>
<p>Le poids de la tarball contenant le code source est assez important du aux nombreuses images contenues dedans.</p>

SUBSECTION(Videos)

TABLEAU(3,LINK(stages/Stage2/Chaise1.divx,Test banc),
LINK(stages/Stage2/manu.divx,Conduite manuelle),
Suivi automatique,
ICON_TGZ,ICON_TGZ,ICON_TGZ,
1.7 Mo --- format DIVX,
5.8 Mo --- format DIVX,
xxx)

<p>Note:</p>
<p>Avant de terminer mon stage, je n'ai pas eu le temps de faire une
vidéo ITALIQUE(souvenir) du suivi automatique.</p>

<p>Dans la vidéo de conduite manuelle, on observe des mouvements
saccadés provenant du CyCab possédant la camera. En effet, le joystick
est assez sensible et les gains utilisés pour les contrôleurs sont un
peu forts (ils n'ont pas été modifiés après avoir installé un nouveau
processeur plus rapide) ce qui donne des effets de braquage brusques
alors qu'on effleure à peine le joystick.  L'application de conduite
manuelle utilisé ici est un peu violente. Merci à Patrice Bodu pour
avoir conduit le CyCab de tête ;0)</p>

SECTION(Stage 1)
SUBSECTION(Sujet)
<p>Le but de ce stage a été d'étudier et de développer un éditeur de noyaux applicatif. Cet
éditeur, intégré dans l'interface graphique de SynDEx, facilite en automatisant certaines tâches
fastidieuses, la création de noyaux d'exécutif. Avant ce travail, l'utilisateur devait écrire pour
chaque opération un code source dans le langage choisi et écrire aussi le squelette en langage
m4 qui entoure ce code source. Maintenant, seul le code source reste à écrire, le squelette étant
généré automatiquement par l'Éditeur de Code.</p>

SUBSECTION(Download,down1)
TABLEAU(4,LINK(stages/Stage1/syndex_rapport.pdf,Rapport),
LINK(stages/Stage1/syndex_presentation.pdf,Presentation de SynDEx),
LINK(stages/Stage1/syndex_tutoriels.pdf,Tutoriels SynDEx),
LINK(stages/Stage1/syndex_application.zip,Tutoriels Exemples),
ICON_PDF,ICON_PDF,ICON_PDF,ICON_TGZ,
1.1 Mo --- format PDF,
1 Mo --- format PDF,
300 Ko --- format PDF,
500 Ko --- format TAR.GZ)

divert(DIVERT_HEADER_CODE)

END_BODY(stages_travail2,Stage 2,)