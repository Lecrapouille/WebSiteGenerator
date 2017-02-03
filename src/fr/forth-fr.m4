dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Interpréteur Forth)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_3D)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Introduction,#intro,Aperçus du jeu,#view,Téléchargement,#download,Au coeur du Forth,#heart,Liens,#links), BANNIERES)

divert(DIVERT_BODY_CODE)

SUBSECTION(ICON_READ[]Références à Forth,ref)

<p>Ce document est une tentative de faire découvrir ou faire
redécouvrir ce langage, d'expliquer son fonctionnement interne ainsi
que de mieux faire comprendre certains mots dits STRONG(de haut
niveau). Avant de commencer ce tutoriel, voici une sélection
d'ouvrages et de liens concernant le langage Forth que je recommande.
Je suggère aux lecteurs qui n'ont jamais fait de Forth de s'initier
avec les deux premiers liens avant de poursuivre ce document.

LISTE(
DRAP_EN EXTLINK(https://www.forth.com/starting-forth/,Starting Forth)
est le cours d'introduction pédagogique recommandé pour le débutant.,

DRAP_FR EXTLINK(https://www.rfc1149.net/download/documents/ifi/forth.pdf,Un cours)
académique sur le Forth.,

DRAP_EN EXTLINK(http://git.annexia.org/?p=jonesforth.git;a=blob;f=jonesforth.S;h=45e6e854a5d2a4c3f26af264dfce56379d401425;hb=HEAD,JonesForth)
Un excellent tutoriel sur l'implémentation d'un interpéteur Forth
écrit en assembleur. Cet document complète le livre de W.P. Salman
pour la clarté de son code assembleur.,

DRAP_EN DRAP_FR EXTLINK(https://www.amazon.com/FORTH-W-P-SALMAN/dp/0387912568/,Forth)
W.P. Salman[,] O. Tisserand[,] B. Toulout. Edition Macmillan (english
version) ou Edition Eyrolles (french version) 1983. (ISBN-13:
978-0387912561[,] ISBN-10: 0387912568) est un excellent livre
décrivant de façon compléte le fonctionnement d'un interpéteur
Forth. Avec ce livre seul[,] il est possible de re-créer son propre
Forth. A noter que la version française 1983 contient quelques erreurs
de typographie dans du code Forth (probablement corrigés dans la
version de 1984).,

DRAP_FR EXTLINK(https://www.amazon.fr/Concept-Forth-Langage-syst%C3%A8me-dexploitation/dp/2866990110,
Le Concept Forth) de Pascal Courtois (français[,] ISBN-10: 2866990110[,]
ISBN-13: 978-2866990114). Explique les mots de
base[,] comment fonctionne un interpréteur Forth mais est moins
complet que le livre Forth de W.P. Salman. On peut trouver des
  extraits sur Google (avec l'aimable autorisation de son auteur).,

DRAP_FR EXTLINK(http://jpb.forth.free.fr/,Entrer dans le monde du Forth) Très
belle réalisation de cartes électroniques pour systèmes Forth.,

DRAP_EN EXTLINK(http://thinking-forth.sourceforge.net/,Thinking Forth)
Livre pour les développeurs modérés en Forth donnant des conseils sur
comment bien penser son projet en Forth.,

DRAP_EN EXTLINK(http://lars.nocrew.org/forth2012/index.html,forth2012) le
glossaire Forth ANSI 2012.)

<p>Voici une liste non exhaustive de Forth non payants :

LISTE(
DRAP_EN EXTLINK(https://www.gnu.org/software/gforth/,gForth) le Forth GNU
toujours activement développé et servant de référence.,

DRAP_EN EXTLINK(https://thebeez.home.xs4all.nl/4tH/4tHmanual.pdf,4th)
un Forth considéré comme ne crashant jamais.,

DRAP_EN DRAP_FR EXTLINK(http://christophe.lavarenne.free.fr/ff/,FreeForth) un Forth
fait par Christophe Lavarenne où le mode exécution n'existe plus et
est remplacé par la compilation d'un mot anonyme.,

DRAP_EN EXTLINK(http://www.softsynth.com/pforth,pForth) un Forth connu
  à son époque et portable en C mais n'est plus développé.,

DRAP_EN EXTLINK(https://github.com/seanpringle/reforth,reForth) un
  Forth écrit en C avec des modifications intéressantes vis à vis des
  Forth standards. Il n'est plus développé.,

DRAP_EN DRAP_FR MYLINK(simtadyn, SimTaDyn) mon projet personel de
  cartes géographiques contenant son mon interpréteur Forth fait
  maison[,] portable[,] écrit en C++. L'interpréteur est compilable
  séparement du projet principal.,

DRAP_EN EXTLINK(https://github.com/ekoeppen/CoreForth, CoreForth) un
  Forth pour Cortex M0 et M3. Fonctionne chez moi avec une carte
  EXTLINK(https://www.arduino.cc/en/Main/arduinoBoardDue,Arduino Due).)

SUBSECTION(ICON_READ[]Histoire du Forth,intro)

<p>Forth est un langage inventé par Charles H. Moore dans les années
1970 afin de palier la lourdeur des langages de l'époque incompatibles
pour des applications temps réel, Moore travaillant à l'époque à
l'Observatoire National de Radio-Astronomie des Etats-Unis. Forth a
été conçu pour être le plus simple et minimaliste possible où avec
environ 150 mots du langage, un petit système d'exploitation peut être
créé. Forth fut, par la suite, devenu un langage largement utilisé
dans ce milieu (comme par la NASA) mais aussi pour des machines
personnelles telles que le Machintosh avec le MacForth (pour ne citer
que lui). Actuellement, le prix du stockage mémoire ayant fortement
baissé et la puissance brute en calcul augmentée, l'optimisation des
ressources des systèmes embarqués est devenu moins critique, ce
langage est devenu beaucoup moins à la mode là où le C demeure
toujours en maître.

<p>Comme nous allons le détailler tout le long de ce document, faire
son propre interpréteur Forth est très simple, chacun pouvant posséder
le sien mais pas forcément compatible avec celui d'un autre. Cela fut
un point noir de ce langage qui malgré plusieurs tentatives de
standards (78, 79, 83, 2012 ...) pour normaliser les mots les plus
courants ne furent pas forcément bénéfique au langage.

<p>Pour information, Charles H. Moore est toujours actif. Il a quitté
le consortium, jugeant que cela nuisait à l'innovation, il a ainsi pu
continuer à simplifier les structures Forth comme expliqué dans
EXTLINK(https://www.rfc1149.net/download/documents/ifi/forth.pdf,le
lien suivant) (confère la section Structures simplifiées). Avec
EXTLINK(https://blogs.msdn.microsoft.com/ashleyf/2013/11/02/the-beautiful-simplicity-of-colorforth/,colorForth)
Moore a ajouté un rôle aux mots en leur ajoutant une couleur. Il a
également fondé GreenArrays Inc. qui produit des puces
EXTLINK(http://bitlog.it/programming-languages/getting-started-with-the-ga144-and-arrayforth/,GA144)
contenant un réseau communicant de sous-processeurs Forth dont
le EXTLINK(https://www.google.com/patents/US7752422,brevet) explique
clairement le fonctionnement (et est très lisible pour un brevet).

<p>Nous allons, tout au long de ce document, revenir sur chaque
éléments de la définition, mais en quelques mots Forth peut-être
résumé à :

LISTE(un langage à piles;,

un langage extensible et auto-évolutif (ré-entrance[,] métaprogrammtion);,

semi-compilé (embarquant son propre compilateur hybridé avec un interpréteur);,

peut être vu comme un système d'exploitation car il est à la fois un
langage[,] une machine virtuelle[,] sait gèrer sa propre mémoire de masse
et dispose d'entrées/sorties;,

il est à la fois un langage bas-niveau (manipulant de l'assembleur et
des registres hardware) et un langage haut-niveau (abstraction des
données[,] faible couplage[,] etc);,

bien que la plupart des langages soient complets au sens de Turing[,]
Forth offre à l'utilisateur la possibilité d'accéder directement aux
différents éléments d'une machine de Turing (ruban infini[,] tête de
lecture/écriture[,] registre d'état[,] table d'actions.))

SUBSECTION(ICON_EYES[]Forth un langage algébrique,algebre)

<p>Forth un langage algébrique (context-free langage en anglais), qui
contrairement aux langages tels que le C ou Python, n'a pas de
grammaire ambiguë, ne nécessite pas de rétro-action lexicale, etc.  Un
script Forth est une simple suite de mots (dont la signification est
proche de celle du langage naturel) séparés par des
espaces. L'interpréteur Forth qui va parser un script (donné sur le
flux d'entrée) n'a besoin que d'extraire le mot courant (qui doit être
un mot connu) et parfois le mot suivant (quand celui-ci n'est pas
encore connu, par exemple lors de la définition d'un nouveau mot). Par
convention un mot Forth est formé de n'importe quelle suite de
charactères ASCII (historiquement la taille maximale d'un mot Forth
est de 31 charactères ASCII mais cette limitation a disparue sur
certains Forth tels que gForth).

<p>Forth utilise la notation polonaise inversée à savoir que les
opérandes (paramètres) sont notées avant les opérateurs. Cette
notation évite l'utilisation de parenthèses palliant l'ordre de
priorité des opérateurs (par exemple en mathématique la priorité de la
multiplication sur celle de l'addition) et évitant ainsi l'utilisation
d'une grammaire inutilement complexe et qui implique, au final, la
création d'un arbre de syntaxe abstraite (AST en anglais) où les
noeuds de l'arbre sont les opérateurs et les feuilles les opérandes et
que l'on exécute avec un parcourt
EXTLINK(https://en.wikipedia.org/wiki/Abstract_syntax_tree,
main-gauche).

<p>Le code suivant :
CODE
2 3 4 + *
ENDCODE
<p>équivaut à l'expression arithmétique 2 * (3 + 4) alors que le code
  suivant :
CODE
2 3 4 * +
ENDCODE

<p>équivaut à l'expression arithmétique 2 + (3 * 4) et si l'on désire
afficher à l'écran le résultat de 2 + (3 * 4), en langage C on
écrirait :
CODE
display(2 + (3 * 4))
ENDCODE

<p>Et ce qu'aurait généré comme AST un compilateur du genre de GCC
pour obtenir le résultat:
CODE
    display
       /
      +
     / \
    *   2
   / \
  3    4
ENDCODE

<p>mais en forth cela s'écrit simplement par :
CODE
2 3 4 * + .
ENDCODE

SUBSECTION(ICON_GEAR[]Dictionnaire Forth: une machine virtuelle,dico)

<p>Forth est un langage extensible : à partir de quelques mots de base
on peut créer un nouveau mot plus évolué. Par exemple, le code
suivant :

CODE
: FOO 2 DUP + . ;
ENDCODE

<p>Permet de définir un nouveau mot Forth FOO via les mots : et ; qui
jouent le rôle de début et de fin de définition. Une fois le mot FOO
défini, quand il sera exécuté, affichera la valeur 4.

<p>Les mots Forth et leur définition sont stockés dans une structure
de donnée appelée par convention le dictionnaire. La norme Forth
laisse libre l'implémentation du dictionnaire. Les premiers Forth
l'implémentent comme une liste chainée où tous les mots sont stockés
les uns à la suite des autres (sans trous); certains Forth séparent
les entrées des définitions (index séparé) tout en gardant le principe
de liste chainée entre les mots; d'autres utilisent une table de
hashage, etc.

<p>Sous la forme d'une liste chainée, le dictionnaire peut être vu
comme le ruban infini divisé en cases consécutives de Turing :

CODE
<--- DICTIONARY ENTRY (HEADER) -------->
+--------------+--------+--------------+--------------- - - - -
| LENGTH/FLAGS | NAME   | [LINK] POINTER | DEFINITION
+--------------+--------+--------------+--------------- - - - -
ENDCODE

<p>LISTE(

STRONG(LENGTH :) est le nombre de caractères ASCII du nom du
mot STRONG(NAME) et est codé sur les 5 bits de poids faible;,

STRONG(FLAGS) code sur les 3 bits de poids fort les informations
suivantes dont nous reviendrons en détail plus tard : LISTE(si le mot
est bien formé (smudge bit);, si le mot doit être considéré comme
immédiat;, et le dernier bit toujours à 1 servant de séparateur entre
les entrées du dictionnaire.),

STRONG(NAME :) est le nom du mot Forth et le nombre d'octet est
variable mais allant jusqu'à 2<sup>5</sup>-1 caractères (octets).,

STRONG(lINK POINTER :) est l'adresse de l'entrée précédente du
dictionnaire (la liste chaînée). L'adresse peut être relative ou
absolue[,] la première permettant de déplacer des ensembles d'entrées
sans devoir modifier les adresses. Le nombre d'octets d'une adresse
dépend de l'architecture choisie.,

STRONG(DEFINITION :) est une suite d'identifiant ou d'adresse du
dictionnaire pointant sur les mots déjà existants. Le nombre d'octets
pour coder une adresse ou un indentifiant dépend de l'architecture
choisie et au final la taille total du dictionnaire.)

<p>Le dictionnaire possède deux informations supplémentaires qui sont
eux mêmes vus comme des mots Forth (ils font partis de ce que l'on
appelle des variables utilisateurs):

LISTE(l'emplacement de l'entrée du dernier mot inséré dans le
dictionnaire (mot Forth LATEST parfois nommé LAST);,

le premier emplacement libre du dictionnaire (en général aprés le
dernier mot inséré) mais qui peut être contrôlé et déplacé façon tête
de lecture/écriture (mots Forth DP et/ou HERE selon le Forth.),

LATEST[,] DP et HERE sont bien des mots Forth donc aussi stocké dans le
dictionnaire.)

Par exemple, le code suivant :
CODE
: FOO * * ;
: BAR FOO . ;
ENDCODE

<p>va créer les deux entrées dans le dictionnaire de la façon suivante :
CODE
                   +--------------------+
                   |              +---- | ----------------------------------------+------------+
                   v              v     |                                         |            |
---------------- - - - ---------------- | --------------------------------------- | -----------|------------
| 0x81 | * |            | 0x83 | FOO |     | DOCOL | * | * | EXIT | 0x83 | BAR |    | DOCOL | FOO | . | EXIT
---------------- - - - ------------------------|-----|---|----|--------------------------|-------------------
         ^                                     |     |   |    |                          |
         |                     <-- - - - ------+     |   |    v          <-- - - - ------+
         +-------------------------------------------+---+
ENDCODE

<p>Les flèches représentent les adresses vers les autres mots du
dictionnaire. Vu que BAR a été inséré dans le dictionnaire après FOO
son STRONG([link] POINTER) pointe vers FOO et LATEST pointe vers
BAR. Les littéraux 0x81, 0x83 (notation base 16) sont les tailles des
mots avec le marqueur de séparation des entrées du dictionnaire. Les
mots Forth DOCOL et EXIT sont des mots particuliers que l'on décrira
plus tard.

<p>A chaque fois qu'un mot est inséré à la définition d'un mot, c'est
le mot HERE qui indique l'emplacement. Après l'ajout du mot, HERE est
autamatiquement déplacé pour toujours pointer sur un emplacement
libre mais des mots comme ALLOC permettant de reserver de la mémoire
déplace simplement HERE.

<p>L'avantage de cette structure de donnée est la non segmentation de
la mémoire : déplacer un dictionnaire en mémoire est trivial (surtout
si les addresses sont relatives et non absolues). La recherche
s'arrêtant au premier mot trouvé, on peut donc écraser une ancienne
définition comme il suit :
CODE
: FOO * * ;
: BAR FOO . ;
: FOO + + ;
: BAR FOO . ;
ENDCODE

<p>L'inconvénient majeur est que la recherche se fait avec une
complexité linéaire que l'on note O(n). Pour palier à ce problèmes des
mots Forth de même nature peuvent être regroupés en vocabulaires. Le
vocabulaire est l'ancêtre des espaces de nommages des langages
modernes (comme en C++ avec par exemple std::cout). Un vocabulaire est
un mot Forth gérant un index de LAST mais pointant sur des mots
choisis par le développeur. On a donc une sorte d'arbre où une
recherche partirait d'un feuille (d'un vocabulaire spécifié, donc un
mot équivalent à LAST) et se terminerait à la racine de l'arbre.

<p>Moore avec son colorForth est passé à une table de hashage et pour
sauver de la mémoire il compresse les noms des mots Forth avec un
codage de Huffman.

<p>Rappelons qu'un des flags dans l'entête d'une entrée indique si le
mot est valide ou non (c'est le smudge bit). S'il est mis, alors il
sera ignoré lors d'une recherche. Le mot FORGET suivit d'un mot
existant (par exemple FORGET FOO) permet de tronquer toutes les
définitions du dictionnaire jusqu'à ce mot. FORGET change simplement
la valeur de LATEST. On prendra garde à ne pas supprimer tout le
dictionnaire en tentant par exemple de supprimer le premier mot du
dictionaire.

<p>Forth se prête bien à la récursivité : un recursivité terminale
n'est rien d'autre qu'un saut en mémoire. Malheureusement, la syntaxe
varie fortement d'un Forth à un autre. En effet, selon le Forth
utilisé, lorsqu'une entête est créée dans le dictionnaire LATEST ne
pointe pas encore dessus, d'autre Forth, le smudge bit est mis tant
que le mot ; n'est pas exécuté effaçant le bit. Le mot SMUDGE doit
être utilisé dans la définition pour commuter le flag en question.

<p>Voici un exemple de recursivité :
CODE
: FACTORIELLE
 DUP 1 >
  IF
   DUP 1 - FACTORIELLE *
 THEN ;
ENDCODE

SUBSECTION(ICON_GEAR[]Forth un langage à piles,pile)

<p>Des langages tels que le C ou python cachent délibérément au
développeur l'utilisation de la pile de données, comme par exemple la
sauvegarde du contexte (paramètres des fonctions, variables locales et
bien d'autres encore) lors d'un appel à une fonction. Ceci pouvant
entraîner des pénalités en temps d'exécution du programme et des
débordements de la pile (par exemple soit en passant par copie des
données trop grosses, soit en utilisant la récursivité sur des
languages nal adaptés à la récursion terminale tels que le C).

<p>Avec la notation polonaise inversée, les opérandes sont stockés
dans une pile de données (structure de type
dernier-entré-premier-sorti) et les opérateurs (équivalent aux
fonctions C mais que l'on nommera désormais STRONG(mots) par
convention) les consomment. Par conséquent, contrairement à des
langages comme le C, la pile évite à Forth l'utilisation de variables
temporaires nommées (équivalent aux variables locales du C) comme
moyen de stockage de résultats intermédiaires et de passage aux
paramètres pour les opérateurs. Néanmoins Forth offre la possibilité
d'utiliser des constantes et des variables mais qui doivent être vues
comme des noms sur des emplacements mémoire de longue-durée
(équivalent aux globales du C) à savoir que leur durée de vie est lié
à celle du programme.

<p>Le code suivant :
CODE
2 DUP + .
ENDCODE

<p>Va empiler l'opérande 2 dans la pile. Le mot DUP va le consommer
puis le dupliquer (donc remis dans la pile de données). Le mot +
consommera les deux valeurs de la pile, les additionnera et empilera
le résultat (soit la valeur 4). Finalement le mot . consommera le
sommet de la pile affichera sa valeur à l'écran.

<p>La pile de données des Forth permet uniquement de manipuler des
entiers (signés et non signés) ou des adresses de la machine virtuelle
(qui sont finalement vues comme un entier), les valeurs en floatants
(float et double du langage C) ne sont pas gérées nativement, une
bibliothèque devant alors être chargée pour les gérer.

<p>En fait, par défaut, Forth n'utilise pas une seule pile mais deux
piles. La deuxième, appelée pile de retour, sert à l'interpréteur
Forth pour mémoriser l'ordre d'exécution des mots appellant d'autres
mots. Cette pile est automatiquement manipulée par lui mais laisse,
quand même, à l'utilisateur la possibilité de déplacer et stocker
temporairement des éléments de la pile de données (ce qui n'est pas
toujours sans risque). Nous y reviendrons plus tard.

<p>Des Forth modernes peuvent ajouter nativement des piles de données
supplémentaires comme une pile d'entiers (appelés pile alternative)
et/ou une pile des floatants. En général, la pile de donnée
supplémentaire permet d'éviter l'utilisation de la pile de retour
comme stockage temporaire et rendant l'interpéteur Forth plus fiable
aux erreurs de programmation.

<p>Un système de sécurité permet de vérifier que les piles ne
débordent pas (par le haut ou par le bas) et prévient l'utiliateur en
arrêtant l'exécution du mot en cours. Charles H. Moore quand à lui
préfère utiliser un buffer circulaire par rapport à une pile. Il n'y a
plus de risque possible de débordement de mémoire mais il n'a pas
ajouté de système pour pévenir l'utilisateur car selon lui le
développeur doit maîtriser le nombre d'opérandes qu'il manipule. De
plus, ce système permet de décider à tout instant la pile comme étant
vide.

<p>On constatera après l'exécution du dernier exemple, que la
profondeur de pile des donnée n'a pas été changée. Ceci n'est pas une
contrainte mais le standard Forth impose de laisser intact la
profondeur des piles pour au moins deux cas : LISTE(lors des
définitions d'un nouveau mot Forth, et la fin d'un fichier quand il
est inclus par un autre fichier.)


SUBSECTION(ICON_GEAR[]Fonctionnement de interpréteur externe,interpreteur)

<p>Un interpréteur Forth fonctionne très simplement : tant que le flux
d'entrée n'est pas fini, les mots sont lus les uns après les
autres. L'interpréteur posséde deux modes : soit il est mode
exécution, soit il est en mode compilation.

<p>En mode EXECUTION : LISTE(Si le mot lu est connu du dictionnaire
alors il est alors exécuté;, sinon le parseur vérifie que le mot lu
n'est pas un nombre (dans la base actuelle) : si c'est le cas alors un
nombre est alors déposé dans la pile de données;, sinon le mot n'est
pas connu et n'est pas un nombre : une erreur prévient l'utilisateur
et arrête le processus.)

<p>En mode COMPILATION les mots non-immédiats qui sont lus, s'ils sont
connus du dictionnaire, sont ajoutés les uns à la suite des autres au
dans la définition courante du dictionnaire. Si un mot n'est pas connu
une erreur prévient l'utilisateur et arrête le processus.

<p>Des peux de mots Forth que l'on a vus, c'est le mot : qui force le
mode COMPILATION de l'interpréteur alors que le mot ; le fait passer
en mode EXECUTION. On peut déja se poser la question comment l'inter
peut passer en mode exécution avec le mot ; s'il ne fait que compiler
tous les mots qu'il voit; logiquement, il ne devrait jamais s'arrêter
de compiler. La réponse vient du champ STRONG(FLAGS) où l'un des bits
permet de rendre un mot Forth immédiat. Par immédiat on sous-entend
que le mot sera immédiatement exécuté même si l'interpréteur est en
mode compilation. Attention: un mot immédiat ne commute pas le mode de
l'interpréteur : il est simplement interprété !

On raffine donc le définition et l'on profite pour ajouter un cas
particulier :
<p>En mode COMPILATION : LISTE(les mots non immédiats lus[,] s'ils
sont connus du dictionnaire[,] sont ajoutés les uns à la suite des
autres au dictionnaire dans la définition courante;, Si le mot est
immédiat et connu du dictionnaire il est alors interprété;, si le mot
n'est pas connu il est testé pour savoir si c'est un nombre : si oui,
il est ajouté à la définition mais on intercalera avant le mot
LITTERAL pour ne pas l'interpréter comme un mot Forth; sinon le mot
n'est pas connu une erreur prévient l'utilisateur et arrête le
processus.)

<p>Si l'inter lit tous les mots les uns apres les autres, avec le code
CODE
: FOO * * ;
ENDCODE
<p>FOO n'etant pas défini, l'interpréteur devrait déclencher une
erreur. En fait non, car comme on l'a dit l'interpréteur sait lire le
mot suivant et le mot : quand il est exécuté va lire le mot suivant, à
savoir FOO afin de créer une nouvelle entrée dans le dictionaire. Par
conséquent le mot suivant que l'interpréteur va lire sera *.

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

<p>Le mot IMMEDIAT rend immédiat le dernier mot du dictionnaire. Voici
un exemple plus évolué : on se propose d'ajouter un système de
commentaires à Forth. Pour cela on suppose que le mot TYPE existe déjà
(ce qui en général le cas) ce mot permet d'ignorer les caractères du
tampon d'entrée jusqu'au charactère indiqué comme paramère.

CODE
: ( ')' TYPE ; IMMEDIATE
ENDCODE

<p>Dés que le parseur exécutera le mot ( il ignorera tous les mots
jusqu'à trouver le mot ) et comme il est immédiat il va fonctionner
dans une définition (quand l'interpréteur sera en mode
compilation). Notons qu'il existe un autre type de commentaire Forth
le mot \ ignore entièrement la ligne courante.

SUBSECTION(ICON_GEAR[]Fonctionnement de interpréteur interne,interpreteur)

dnl parler du code assembleur dans le Forth

SUBSECTION(ICON_GEAR[]Variables et constante,var)

<p>Nous avons vu que Forth permet de stocker des
dnl https://fr.wikiversity.org/wiki/Forth/Conserver_des_donn%C3%A9es

divert(DIVERT_FOOTER_CODE)

END_BODY(simtadyn,Le projet SimTaDyn,,)
