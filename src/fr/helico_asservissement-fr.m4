dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

ICON_BUILD STRONG(Page en cours de rédaction.)

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Asservissements,asservi)

SUBSECTION(ICON_READ[]Contexte)

<p>L'asservissement de l'attitude de la plate-forme volante étant,
   bien évidement, la partie la plus dure du projet, elle est
   actuelement en cours de réalisation. Cependant, la régulation d'un
   axe de la plate-forme avec son centre de gravité fixé est
   fonctionel. Le PC envoie une consigne d'angle et la plate-forme
   modifie la puissance des moteurs afin de suivre la consigne.</p>

<p>La régulation d'un axe de la plateforme (prototype 1) est décrite
   dans le document PDF téléchargable
   EXTLINK(helico_download-LANG.html,ici). Actuelement j'en suis au
   prototype 2 (changement de microcontrôleurs). La différence
   fonctionnelle entre ces deux prototypes est que la carte
   électronique peut être indépendante du PC pour les calculs de la
   régulation.</p>

<p>Voici une liste des parties étudiées :</p>
LISTE(Etude théorique d'un moteur DC et asservissement en courant.,
Modèle de l'hélicoptère et asservissement du tangage et en altitude.,
Schémas blocs Scicos)

PICTURE(helico/schemas/helico_main.jpg,Schéma bloc Scicos pour
l'asservissement de l'hélicoptère.)

SECTION(Filtres numériques et régulateur PID numérique)

<p>Une question qui revient souvent sur le forum XBIRD est comment
   ITALIQUE(coder en C) un filtre (passe bas, haut, bande) et un
   régulateur PID. Ce n'est pas expliqué sur mon rapport. Je mets ici
   mon code à dispostion.</p>

SUBSECTION(ICON_GEAR[]Filtre numérique passe bas,bas)

<p>Un filtre passe-bas est un filtre qui laisse passer les basses
   fréquences et qui atténue les hautes fréquences. Sa fonction de
   transfert (temps continu) est :</p>

CODE
         1
X = -------------- U
       1 + S / w[]SUB(c)
ENDCODE

<p>S la variable de Laplace (exprimee en radian par seconde). U
   l'entree, X la sortie et w[]SUB(c) la fréquence de coupure
   désirée. Ecrit tel quel, cette formule n'est pas exploitable par un
   ordinateur car S désigne l'opérateur derivée dans le domaine de
   Laplace.</p>

<p>En utilisant la transformée en Z, on peut approximer S par (Z - 1)
  / h où Z est l'opérateur d'avance et h le pas de temps.</p>

<p>La fonction de transfert (temps discret) s'écrit :</p>
CODE
x[]SUB(n+1) = (1 - a) x[]SUB(n) + a u[]SUB(n)
ENDCODE

SUBSECTION(ICON_GEAR[]Filtre numérique passe bas,haut)

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_logiciel,Software,
helico_download,Téléchargement divers et variés)
