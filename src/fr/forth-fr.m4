dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Interpréteur Forth)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_3D)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Introduction,#intro,Aperçus du jeu,#view,Téléchargement,#download,Au coeur du Forth,#heart,Liens,#links), BANNIERES)

divert(DIVERT_BODY_CODE)

SUBSECTION(Histoire du Forth,intro)

<p>Ce document est une tentative de faire découvrir ou redécouvrir ce
langage, d'expliquer son fonctionnement interne ainsi que de mieux
faire comprendre certains mots dits BOLD(de haut niveau) en
espérant ne pas être un Nième tutoriel.

<p>Forth est un langage inventé par Charles H. Moore dans les années
1970 afin de palier la lourdeur des langages de l'époque incompatibles
pour des applications temps réel, Moore travaillant à l'époque à
l'Observatoire National de Radio-Astronomie des Etats-Unis. Forth a
été conçu pour être le plus simple et minimaliste possible où avec
environ 150 mots du langage, un petit système d'exploitation peut être
créé. Forth fut, par la suite, devenu un langage largement utilisé
dans ce milieu (comme la NASA) mais aussi pour des machines
personnelles telle que le Machintosh avec le MacForth (pour ne citer
que lui). Actuellement, le prix du stockage mémoire ayant fortement
baissé et la puissance brute en calcul augmentée, l'optimisation des
ressources en mémoire des systèmes embarqués est devenu moins
critique, ce langage est devenu beaucoup moins à la mode là où le C
demeure toujours en maître.

<p>Comme nous le verrons plus tard, faire son propre interpréteur
Forth est très simple, chacun pouvant posséder le sien mais pas
forcément compatible avec celui d'un autre. Cela fut un point noir de
ce language qui malgré plusieurs tentatives de standards (78, 83,
2012 ...) pour normaliser les mots les plus courants ne furent pas
forcément bénéfique au langage.

<p>Pour information, Charles H. Moore est toujours actif. Il a quitté
le consortium, jugeant que cela nuisait à l'innovation, il a ainsi pu
continuer à simplifier les structures Forth comme expliqué dans
EXTLINK(https://www.rfc1149.net/download/documents/ifi/forth.pdf,le
lien suivant) (section Structures simplifiées). Avec
EXTLINK(https://blogs.msdn.microsoft.com/ashleyf/2013/11/02/the-beautiful-simplicity-of-colorforth/,colorForth)
Moore a ajouté un rôle aux mots en leur ajoutant une couleur. Il a
également fondé GreenArrays Inc qui produit des puces
EXTLINK(http://bitlog.it/programming-languages/getting-started-with-the-ga144-and-arrayforth/,GA144)
qui contiennent un réseau communicant de sous-processeurs Forth dont
le EXTLINK(https://www.google.com/patents/US7752422,brevet) explique
clairement le fonctionement (et est très lisible pour un brevet).

<p>Nous allons, tout au long de ce document, revenir sur chaque
éléments de la définition, mais en quelques mots Forth peut-être
résumé à : LISTE(un langage à piles;, à la fois langage bas-niveau
(manipulant de l'assembleur et des registres hardware) et langage
haut-niveau (abstraction des données[,] faible couplage[,] etc);, un
langage auto-évolutif/modifiant (ré-entrance[,] métaprogrammtion);,
semi-compilé (embarquant son propre compilateur hybridé avec un
interpréteur);, embarquant sa propre machine virtuelle (servant de
stockage au byte-code généré par le compilateur et de stockage aux
ressources du système).)

SUBSECTION(Forth un langage algébrique,algebre)

<p>Forth un langage algébrique (context-free langage en anglais), qui
contrairement aux langages tels que le C ou Python, n'a pas de
  grammaire ambiguë, ne nécessite pas de rétro-action lexicale, etc.

<p>Un script Forth est une simple suite de mots (dont la signification
est proche de celle du langage naturel) séparés par des
espaces. L'interpréteur Forth qui va lire un flux d'entrée n'a besoin
que d'extraire le mot courant (qui doit être un mot connu) et parfois
le mot suivant (quand celui-ci n'est pas encore connu). Par convention
un mot Forth est formé de n'importe quelle suite de charactères ASCII
(historiquement la taille maximale d'un mot Forth est de 31
charactères ASCII mais cette limitation a disparue sur certains Forth
tels que gForth).

<p>Forth utilise la notation polonaise inversée à savoir que les
opérandes (paramètres) sont notées avant les opérateurs. Cette
notation évite l'utilisation de parenthèses palliant l'ordre de
priorité des opérateurs (par exemple mathématique comme la priorité de
la multiplication sur l'addition) et évitant ainsi l'utilisation d'une
grammaire inutilement complexes.

<p>Le code exemple suivant :
CODE
  2 3 4 + *
ENDCODE
<p>équivaut à l'expression arithmétique 2 * (3 + 4) alors que le code
  suivant :
CODE
  2 3 4 * +
ENDCODE
<p>équivaut à l'expression arithmétique 2 + (3 * 4).

SUBSECTION(Forth un langage à piles,pile)

<p>Grâce à la notation polonaise inversée les opérandes sont stockés
dans une pile de données (structure de type
dernier-entré-premier-sorti) et les opérateurs (équivalent aux
fonctions C mais que l'on nommera désormais BOLD(mot) par convention)
les consomment.

<p>Des langages tels que le C ou python cachent délibérement au
développeur l'utilisation de cette pile. Par exemple la sauvegarde du
contexte (paramètres des fonctions, variables locales) lors d'un appel
à une fonction ce qui peut entrainer des pénalités en temps
d'éxecution du programme et des débordements de piles (par exemple
soit en passant par copie des données trop grosses, soit en utilisant
la récursivité sur des lanaguages non adaptés à la récursion terminale
tels que le C).

<p>Le code suivant :
CODE
2 DUP + .
ENDCODE

<p>Va empiler l'opérande 2 dans la pile, puis le mot DUP va dupliquer
le sommet de la pile de données, le mot + consommera les deux valeurs
de la pile et les additionnera et remettre le résultat dans la pile
(soit 4) et le mot . consommera le sommet de la pile affichera la
valeur. Après exécution de ce script, on notera que la profondeur de
pile des donnée n'a pas été modifiée.

<p>La pile de données des Forth historiques permet de manipuler
uniquement des entiers signés (et non signés) ou des adresses de la
machine virtuelle (qui sont finalement vues comme un entier) et ne
gérent pas nativement les floatants (float et double du langage C) une
bibliothèque devait être chargées pour cela.

<p>En fait, Forth n'utilise pas une seule pile mais deux. La deuxième
appelées pile de retour sert à l'interpréteur Forth pour mémoriser
l'ordre d'exécution des mots. Cette pile est automatiquement gérée par
lui mais laisse quand même à l'utilisateur la possibilité de stocker
temporairement des éléments de la pile de données (ce qui n'est pas
toujours sans risque). Nous y reviendrons plus tard.

<p>Des Forth modernes peuvent ajouter nativement des piles de données
supplémentaires comme une pile d'entiers (appelés pile alternative)
et/ou une pile des floatants natifs. En général la pile de donnée
supplémentaire pour les entiers permet d'éviter l'utilisation
temporaire de la piles de retour.

<p>Un système de sécurité permet de vérifier que les piles ne
débordent pas par le haut ou par le bas (overflow/underflow) et
prévient l'utiliateur. Charles H. Moore quand à lui préfère utiliser
un buffer circulaire à la place d'une pile. Il n'y a plus de risque
possible de débordement de mémoire mais il n'a pas ajouté de système
pour pévenir l'utilisateur car selon lui le développeur doit maîtriser
le nombre d'opérandes qu'il manipule. De plus ce système permet de
décider à tout instant la pile comme étant vide.

SUBSECTION(Dictionnaire,dico)

<p>Forth est un langage qui auto-évolue: à partir de quelques mots de
base on peut créer un nouveau mot plus évolué. Par exemple, le code
suivant:

CODE
: FOO 2 DUP + . ;
ENDCODE

Permet de définir un nouveau mot Forth FOO via les mots : et ; qui
jouent le rôle de début et de fin de définition. Une fois définie, le
moto FOO quand il sera exécuté affichera la valeur 4.

<p>Les mots Forth et leur définition sont stockés dans une structure
de donnée appelée dictionnaire permettant de rechercher la définition
d'un mot existant, d'ajouter une nouvelle définition et, on le verra
plus tard, servant également de tas (heap) que les développeurs C/C++
utilisent connaissent pour allouer/désallouer des ressources. La norme
Forth n'impose pas

<p>L'interpréteur Forth à deux modes (états) soit il est en mode
interprétation soit en mode compilation. Des mots comme : et ;
permettent respectivement de passer en mode compilation puis
interprétation.  LISTE(En mode interprétation[,] la définition des
mots lus sont recherchés dans le dictionnaire puis exécutés., En mode
compilation[,] une entête dans le dictionnaire est créée afin de
permettre de retrouver le nouveau mot[,] puis chaque mot lus[,] s'ils
ne sont pas considérés comme immédiats[,] sont recherchés dans le
dictionnaire et leur référence stockée dans la définition du mot en
cours de définition.)

<p>Autre exemple plus évolué, s'il l'on suppose que le mot TYPE existe
  et qu'il ignore les caractères du tampon d'entrée (là où un
  utilisateur Forth va écrire son code) jusqu'au charactère indiqué,
  on peut facilement modifier l'interpréteur Forth pour la gestion des
  commentaires.
CODE
: ( ')' TYPE ; IMMEDIATE
ENDCODE
<p>Dés que le parseur exécutera le mot ( il ignorera tous les mots
  jusqu'à trouver le mot ) on notera que le mot rendu immédiat via
  IMMEDIATE sera exécuté lorsqu'il sera rencontré dans une
  définition. Dans notre cas cela permet d'ajouter des commentaires à
  l'intérieur


<p>Forth peut être vu comme une machine virtuelle



SUBSECTION(Langage évolutif,evol)

<p>Forth est un langage qui auto-évolue: à partir de quelques mots de
base on peut créer un nouveau mot plus évolué.



  qui, par exemple pourra
éventuellement modifier le comportement de l'interpéteur, ou créer sa
propre structure de langage comme ajouter les IF THEN ELSE, boucle FOR
WHILE.



SUBSECTION(Références,ref)

Voici une sélection d'ouvrages et de liens concernant le langage Forth que je
recommande: le parseur séparant les

LISTE(
EXTLINK(https://www.forth.com/starting-forth/,Starting Forth)
est le cours d'introduction pédagogique recommandé pour le débutant.,

EXTLINK(https://www.amazon.fr/Concept-Forth-Langage-syst%C3%A8me-dexploitation/dp/2866990110,
Le Concept Forth) de Pascal Courtois (français). Explique les mots de
base[,] comment fonctionne un interpréteur Forth mais est moins
complet que le livre Forth de W.P. Salman.,

EXTLINK(http://lars.nocrew.org/forth2012/index.html,forth2012) le
glossaire Forth ANSI 2012.,

EXTLINK(https://www.amazon.com/FORTH-W-P-SALMAN/dp/0387912568/,Forth)
W.P. Salman[,] O. Tisserand[,] B. Toulout. Edition Macmillan (english
version) ou Edition Eyrolles (french version) 1983. (ISBN-13:
978-0387912561[,] ISBN-10: 0387912568) est un excellent livre
décrivant de façon compléte le fonctionnement d'un interpéteur
Forth. Avec ce livre seul[,] il est possible de re-créer son propre
Forth. A noter que la version française 1983 contient quelques erreurs
de typographie dans le code Forth (probablement corrigés dans la
version de 1984).,

EXTLINK(http://git.annexia.org/?p=jonesforth.git;a=blob;f=jonesforth.S;h=45e6e854a5d2a4c3f26af264dfce56379d401425;hb=HEAD,JonesForth)
Un excéllent tutoriel sur l'implémentation d'un interpéteur Forth
écrit en assembleur. Cet document compléte le livre de W.P. Salman
pour la clareté de son code assembleur.,

EXTLINK(http://jpb.forth.free.fr/,Entrer dans le monde du Forth) Très
belle réalisation de cartes électroniques pour systèmes Forth.,

EXTLINK(http://thinking-forth.sourceforge.net/,Thinking Forth) Livre
pour les développeurs débutants donnant des conseils sur comment bien
programmer et penser son projet en Forth.,

EXTLINK(https://blogs.msdn.microsoft.com/ashleyf/2013/11/02/the-beautiful-simplicity-of-colorforth/,ColorForth)
Charles H. Moore, l'inventeur de ce langage, ayant décidé de quitter
le consortium car selon lui la normalisation du lanaguage empêchait
d'innover, a développé

EXTLINK(http://christophe.lavarenne.free.fr/ff/,FreeForth) un Forth fait
par Christophe Lavarenne.
)

SUBSECTION(Au coeur du Forth,heart)



SUBSECTION(Téléchargement,download)

TABLEAU(3,LINK(myforth/quentin_quadrat-myforth_0.3.tar.bz2,Version 0.3),
LINK(myforth/quentin_quadrat-myforth_0.2.tar.bz2,Version 0.2),
LINK(myforth/quentin_quadrat-myforth_0.1.tar.bz2,Version 0.1),
ICON_TGZ,ICON_TGZ,ICON_TGZ,
2 Mo --- format BZ2,
2 Mo --- format BZ2,
2 Mo --- format BZ2)

SUBSECTION(Liens)

<p>Vous pouvez telecharger le livre BOLD(Le concept FORTH) de Pascal COURTOIS (avec son aimable autorisation) sur :
LINKFORTH.</p>
<p>D'autres liens intéréssants :</p>
LISTE(
LINK(http://jpb.forth.free.fr/,Entrer dans le monde du Forth) Très belle carte électronique.,
LINK(http://christophe.lavarenne.free.fr/ff/,FreeForth) fait par Christophe Lavarenne.,
LINK(http://forth.free.fr/,Site sur le Forth) où on peut télécharger les scans du livre BOLD(Le concept FORTH).)

divert(DIVERT_FOOTER_CODE)

END_BODY(simtadyn,Le projet SimTaDyn,,)
