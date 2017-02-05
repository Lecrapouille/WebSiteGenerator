dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Génération d'un site en HTML avec le langage M4)
DEF_KEYWORDS(m4 generation html)
DEF_DESCRIPTION(Generation HTML website with M4 language)
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Contexte,#contexte),BANNIERES)

divert(DIVERT_BODY_CODE)

SUBSECTION(ICON_READ[]Présentation,intro)

<p>Dans ce document, j'explique comment fonctionne mon outil de
génération de pages HTML afin de créér de petits sites internet
statiques. Toutes les pages de ce site (donc celle que vous étes
entrain de lire) ont été générées par cet outil. Par "site internet
statique" j'entends un site qui ne requière pas de logique spéciale
côté serveur pour fonctionner, les pages sont rapidements mises en
forme, peuvent être mises en cache, etc. A l'opposé, un site dynamique
doit s'encourir de plus de moyen en utilisant un serveur de requêtes
donc avec un temps d'affichage de la page théoriquement plus lente.</p>

<p>Cet outil utilise le langage de macro-procession LINKM4. M4 est
utilisé en général avec les autotools et sert à la création de
fichiers configure qui généreront des makefiles, qui ces derniers,
servent à compiler des projets. L'idée de base de M4 était de pouvoir
faire des copier/coller de code facilement.</p>

<p>Un macro-processeur prend en entrée un flôt de texte, recherche des
chaines de charactères (qu'on lui aura auparavant spécifiées) et les
remplace par d'autres chaines de charactères (également
spécifiées). Il va itérer un certain nombre de fois jusqu'à ce qu'il
n'y ait plus chaines à remplacer. Comme exemple, on peut citer le
préprocesseur de GCC est aussi un macro-processeur : il va parser les
#define et autres #ifdef dans un code en C avant d'attaquer la
compilation des fichiers.</p>

<p>Ce document n'est pas un cours sur le langage M4, je suis trop
débutant dans ce langage, mais plutot un des exemples de code pour
vous donnez des idées d'automatisation de création de page html. Les
gourous de ce langage trouveront certainement des solutions plus
élégantes. Pour ceux qui préfèrent apprendre le langage M4, je leur
conseille de lire le document
EXTLINK(http://mbreen.com/m4.html,suivant) pour mieux comprendre
toutes les subtilités du langage M4 (et elles sont nombreuses et pas
évidentes).</p>

<p>Même si vous n'aimez pas le look de ce site, vous verez comment
adapter cet outil pour changer la forme du votre. Je tiens à préciser
que la programmation de sites web n'a jamais été une passion chez moi,
pour les raisons suivantes qui m'ont poussé à développer cet
outil :</p>

LISTE(

je trouve que l'édition manuelle de page HTML devient vite épuisante
car le code devient vite illisible : le texte à écrire étant noyé dans
une couche de balises verbeuses et noyé une deuxième fois par la
syntaxe des accents. Comme preuve concrète regardez le contenu HTML de
ma page d'MYLINK(index,acceuil) (touche Controle et touche U sous
Firefox) et comparez la avec son
LINK(https://github.com/Lecrapouille/PageOueb/blob/master/src/fr/index-fr.m4,code
en M4);,

il y a longtemps[,] j'avais testé des outils de création de sites
web : c'était certe amusant mais la page devenait très vite trop
lourde à débuger;,

l'incompatibilité des navigateurs à afficher correctement la même page
web (Internet Explorer étant le premier à ne jamais respecter la
norme) faisant perdre un temps précieux pour une mise en page qui
fonctionne sur un navigateur mais pas sur l'autre;,

je n'étais pas particulièrement intéréssé par l'apprentissage du
langage PHP et les dernières technologies web générent[,] certes de
beaux sites[,] mais n'ont été créés[,] à mon avis[,] que pour générer
des sites
EXTLINK(https://fr.wikipedia.org/wiki/Pi%C3%A8ge_%C3%A0_clics,p---s à
clics) : mais ceci est un autre débat et pour plus de renseignement
vous pouvez consultez cette excellente vidéo :
EXTLINK(https://youtu.be/81rTkCGTM4Y?list=PLyIecIQvrWsGJ8_ZkrRxKYu1eEr7G3bxI,UnDropDansLaMare
S03 E01: Internet en 2025).,

Les gestionnaires de pages wiki et de blogs sont lourds à mettre en
place : nécessitant de mettre en place de nombreux scripts php[,] des
bases de données SQL[,] de gérer des administrateurs[,] des mots de
passes. Par conséquents pouvant offrir autant de failles de sécurité
(du vécu).)

<p>Par conséquent j'ai décidé de développer un petit outil fait maison
d'aide à la génération de pages HTML. L'idée d'utiliser M4 vient :</p>

LISTE(d'avoir toujours écrit mes documents en LaTeX et jamais avec
l'éditeur Word. LaTeX est un langage pour générer des documents texte
en PDF de qualité professionelle. C'est un langage proche de HTML mais
sa philosophie est : "occupez vous du contenu de votre document[,] je
m'occupe pour vous de sa mise en page". J'ai voulu me raproché de
cette idée : me contenter d'écrire uniquement le texte et de laisser
mon outil générer le code HTML.,

la lecture d'un article sur le journal Linux Magazine traitant de ce
sujet (j'ai oublié le numéro).,

la syntaxe markdown des wiki.,

mon stage où j'ai appris le langage M4.)

SUBSECTION(ICON_DOWNLOAD[]Téléchargement,download)

<p>Le code source du générateur est disponible sur
GITHUB(Lecrapouille/PageOueb,GitHub).</p>

SUBSECTION(ICON_GEAR[]Au coeur de M4,heart)

<p>Pour la suite de ce document, je propose une convention non
officielle. J'aime bien utiliser l'extension fichier STRONG(m4x) quand
il s'agit d'un fichier où l'on va stocker ses macros (x pour
exécutable, par exemple webgenerator.m4x). Par contre, quand il s'agit
d'un fichier STRONG(m4) que l'on va macro-processer pour obtenir un
fichier html je préfère garder l'extension m4 (par exemple
mapage.m4).</p>

<p>M4 comprend des caractères spéciaux pour délimiter des chaines :
ils servent à supprimer la macro-procession. Par default les
délimiteurs sont les caractères ` pour débuter et ' pour terminer. M4
supprime ces delimiteurs avant de renvoyer la chaine de caractères en
sortie. M4 permet de changer les délimiteurs, par exemple pour
utiliser les crochets on écrira la commande suivante
[changequote([,])]

<p>Voici vos deux premières macros que l'on va nommer [ARROW_HOME] et
[STRONG] et à placer dans le fichier webgenerator.m4x : la première
prend aucun paramètre alors que la deuxième prend un paramètre que
l'on note $1. Les virgules servent à séparer les paramétres.</p>

CODE[changequote([,])
define([ARROW_HOME],[&lt;img class="icone5" src="img/home.png" alt="home"/&gt;])
define([STRONG],[&lt;strong&gt;$1&lt;/strong&gt;]) ]ENDCODE

<p>Si on lance M4 sur le fichier mapage.m4 :</p>
CODE Voici une image de maison [ARROW_HOME] et ceci un [STRONG(un texte en gras)]. ENDCODE

<p>il va générer la sortie suivante :<p>
CODE Voici une image de maison &lt;img class="icone5" src="img/home.png" alt="home"/&gt;
et ceci un &lt;strong&gt;texte en gras&lt;/strong&gt;. ENDCODE

<p>Que si l'on sauve dans un fichier html et l'affiche dans un
navigateur on verra apparaître ARROW_HOME et STRONG(un texte en
gras).</p>

<p>Nous avons vu par ce simple exemple la puissance potentielle de cet
outil surtout si cette balise html doit être appelée plusieurs fois
dans plusieurs pages html et que l'on veuille la remplacer, on va
optimizer notre travail car il suffira simplement de modifier le
ficher m4x à un seul endroit.</p>

<p>Voici comment appeller M4 dans un terminal de Linux (l'idéal
étant d'écrire une régle dans un fichier Makefile) :</p>
CODE m4 webgenerator.m4x autrefichier.m4x mapage.m4 > mapage.html
ENDCODE

<p>Nous allons montrer tout au long de ce document d'autres macros
encore plus puissantes mais avant d'aller plus loin, je conseille de
lire le document EXTLINK(http://mbreen.com/m4.html,suivant) pour mieux
comprendre toutes les subtilités du langage M4 (et elles sont
nombreuses).</p>

SUBSECTION(ICON_GEAR[]Simplification de la gestion des liens,liens)

<p>Si la balise html &lt;a&gt; est trop complexe pour vous, alors cette
  macro conditionnelle reprenant l'idée de la syntaxe markdown (wiki) peut vous être utile :</p>
CODE[define([LINK],[ifelse([$2],,[&lt;a href="$1"&gt;$1&lt;/a&gt;],[&lt;a href="$1"&gt;$2&lt;/a&gt;])])]

Exemple 1 : [LINK(https://www.google.fr,google)]
Exemple 2 : [LINK(https://www.google.fr)]
ENDCODE

<p>[ifelse] est un if-then-else testant la valeur du premier paramétre
(ici $2) avec la valaur deuxième paramètre (ici: vide) et selon le
résultat de la comparaison une action différente sera faite. Dans
notre cas si le deuxième paramètre n'est pas donné (donc non défini)
alors l'url compléte sera affichée LINK(https://www.google.fr) sinon
c'est le nom court qui sera affiché
LINK(https://www.google.fr,google).</p>

<p>En supposons que [LANG] est une macro déjà définie, voici d'autres
macros du même genre. La première macro permet de faire des liens vers
des pages du même site en prenant en compte automatiquement la langue
et sans qu'on la précise. La deuxième macro permet d'afficher un petit
logo <img src="img/externallink.jpg"/> apres le nom de l'url :</p>

CODE[define([MYLINK],[ifelse([$2],,[&lt;a href="$1-LANG.html"&gt;$1&lt;/a&gt;],[&lt;a href="$1-LANG.html"&gt;$2&lt;/a&gt;])])]

[define([EXTLINK],[&lt;a href="$1" target="_blank"&gt;ifelse([$2],,[$1],[$2])
&lt;img src="img/externallink.jpg" alt="ext link"
border="0"/&gt;&lt;/a&gt;])
]ENDCODE

<p>Par exemple [MYLINK(tuto_m4,tutoriel M4)] donnera le resultat
suivant : MYLINK(tuto_m4,tutoriel M4) qui et pointera sur la page
correspondante à [LANG].</p>

<!-- <p>[dnl] est une macro qui permet d'ajouter des commentaires. Ici, la
commande étant trop grande, elle est scindée. [dnl] permet d'ignorer
les caractères comme le retour chariot qui seraient insérés dans le
code html. Cela rend laid le code m4x mais ce mal est parfois
nécéssaire. On notera que les espaces sont importants et peuvent être
pris en compte dans la sortie. Là encore, ne pas mettre d'espace entre
les séparateurs de paramètres permet de sécuriser le code généré de
caractère d'espace indésirables au détriment de la lisibilité.</p> -->

SUBSECTION(ICON_GEAR[]Changer la langue,lan)

<p>Une des problématiques sur les pages est la gestion des
langues. Pour chaque page dans une langue donnée on souhaite pouvoir
accéder à la page équivalente dans une autre langue. Voici une
solution possible dans le cas d'une page bilingue (solution mais pas
très esthétique, en attendant d'avoir mieux).</p>

<p>A mettre dans le fichier m4x :</p>
CODE[define([RAP_FR],[&lt;img src="img/fr.png" alt="fr"/&gt;])
define([RAP_EN],[&lt;img src="img/en.png" alt="en"/&gt;])

ifdef([LANG],,[define([LANG],[fr])])

define([CHANGE_LANG],[&lt;p&gt;
ifelse(LANG,fr,[DRAP_FR LINK(THISFILE-en.html,DRAP_EN)],
[LINK(THISFILE-fr.html,DRAP_FR) DRAP_EN])&lt;/p&gt;])
]ENDCODE

<p>Les deux premières définitions permettent de dessiner un drapeau en
français et un drapeau en anglais. La troisième définition teste si la
macro [LANG] est définie et dans le cas où elle ne l'est pas encore,
on lui force la valeur arbitraire fr (pour la langue française). La
dernière définition permet de génèrer une image-lien vers la page dans
l'autre langue (du français vers l'anglais ou bien de l'anglais vers
le français). L'image du lien sera le drapeau de la langue de la
page pointée.</p>

<p>Que l'on compile avec :</p>
CODE m4 webgenerator.m4x -DTHISFILE=mapage -DLANG=fr autrefichier.m4x mapage-fr.m4 > mapage-fr.html
ENDCODE

<p>On pourra donc créer deux dossiers : anglais avec les fichiers
  mapage-en.m4.</p>

SUBSECTION(ICON_GEAR[]Titres[,] sections et sous-sections,sect)

<p>Basiquement ne font qu'appeler les balises de titres &lt;h1&gt;
  &lt;h2&gt; &lt;h3&gt; mais on peut complexifier leur comportement en
  créant une ancre pour les menus sommaires rapides (à gauche en bleu)
  ainsi que leur donner un lien vers une page du site (page
  d'acceuil) :</p>

CODE[dnl $1: h1 h2 h3
dnl $2: title
dnl $3: anchor
dnl $4: link
define([_THE_SECTION_],
[ifelse($4,,[ifelse($3,,[&lt;$1&gt;$2&lt;/$1&gt;],[&lt;a id="$3" name="$3"&gt;&lt;/a&gt;&lt;$1&gt;$2&lt;/$1&gt;])],
[ifelse($3,,[&lt;$1&gt;&lt;a href="$4-]LANG[.html"&gt;$2&lt;/a&gt;&lt;/$1&gt;],dnl
[&lt;a id="$3" name="$3"&gt;&lt;/a&gt;&lt;$1&gt;&lt;a href="$4-]LANG[.html"&gt;$2&lt;/a&gt;&lt;/$1&gt;])])])
]ENDCODE

<p>Ensuite, pourquoi se contenter du seul titre ? Pour faire joli on
peut penser à mettre le texte dans une boite indentée par rapport au
titre (avec la balise &lt;div&gt; et le code css qui va avec). Dans le code
suivant un titre ferme en fait la boite.</p>

CODE[define([SECTION],[_SECTION1_(h1,$@)])
define([SUBSECTION],[_SECTION2_(h2,$@)])
define([BOX],[&lt;div class="boite"&gt;])
define([ENDBOX],[RIGHT(LINK(#gotoup,ARROW_UP)) &lt;/div&gt;])

define([_IEME_SECTION_],[0])

define([_SECTION2_],[ifelse(_IEME_SECTION_,0,,[ENDBOX])
&lt;!-- Subsection --&gt;
_THE_SECTION_($@)BOX[]define([_IEME_SECTION_],[1])])

define([_SECTION1_],[ifelse(_IEME_SECTION_,0,,[ENDBOX])
&lt;!-- Section --&gt;
_THE_SECTION_($@)define([_IEME_SECTION_],[0])])
]ENDCODE

SUBSECTION(ICON_GEAR[]Créer de listes,list)

<p>Voici comment remplacer les listes html &lt;ul&gt; et
leurs équivalents &lt;ol&gt;. La macro [shift] permet de faire une boucle (ici
recursive). [shift] supprime le paramètre de tête et retourne la
queue de la liste. Dans notre première définition on arreter de
'[shift]'er quand la liste est vide.</p>
CODE[define([LISTE_],[ifelse([$1],,,[&lt;li&gt;$1&lt;/li&gt; LISTE_(shift($@))])])
define([LISTE],[;&lt;ul&gt;LISTE_($@)&lt;/ul&gt;])]ENDCODE

<p>Exemple :</p>
CODE[LISTE(Je suis A;,Je suis B;LISTE(Je suis B1;,Je suis B2;),Je suis C.)]ENDCODE

<p>Sera affiché comme : </p>
LISTE(Je suis A;,Je suis B;LISTE(Je suis B1;,Je suis B2;),Je suis C.)

<p>Le lecteur attentif détectera le problème suivant : comment
afficher une virgule si cette dernière est interprétée comme un
spérateur de paramètre ? Sauf erreur de ma part M4 ne permet pas de
remplacer le caractère virgule par un autre caractère comme on a pu le
faire avec [changequote], donc la solution est d'écrire votre virgule
sous cette forme [[,]] pour la première liste et [[[,]]] pour la
deuxième liste.</p>

CODE[LISTE(Je suis A[,],Je suis B[,]LISTE(Je suis B1[[,]],Je suis B2[[,]]),Je suis C.)]ENDCODE

LISTE(Je suis A[,],Je suis B[,]LISTE(Je suis B1[[,]],Je suis B2[[,]]),Je suis C.)

SUBSECTION(ICON_GEAR[]Créer des tableaux,table)

<p>Apres avoir créer des listes, voyons quelque chose de similaire :
  créer des tableaux html &lt;table&gt;</p>
CODE[define([forloop], [pushdef([$1], [$2])_forloop([$1], [$2], [$3], [$4])popdef([$1])])
define([_forloop],[$4[]ifelse($1, [$3], ,[define([$1], incr($1))_forloop([$1], [$2], [$3], [$4])])])

define([VECT_HEAD],[$1[]define([_list],[shift($@)])])

define([TABLEAU],[
define([COL],[$1]) dnl nombre de colonnes
define([_list],[shift($@)])
define([LIG],[eval($# / COL)]) dnl nombre de lignes
&lt;table width="90%" align="center"&gt;
forloop(iii,1,LIG,[    &lt;tr&gt;
forloop(jjj,1,COL,[        &lt;td align="center"&gt;VECT_HEAD(_list)&lt;/td&gt;
])    &lt;/tr&gt;
])
&lt;/table&gt;])
]ENDCODE

<p>Comme exemple concret, voyez ma page sur mon jeu
MYLINK(ecstasy,Ecstasy) section téléchargement ou aperçu du jeu
utilise ce code; sinon voici un exemple simple de tableau sur 3
colonnes.</p>
CODE[TABLEAU(3,
A1,B1,C1,
A2,B2,C2)
]ENDCODE

<p>Affichera :</p>
TABLEAU(3,A1,B1,C1,A2,B2,C2)

<p>On pourra évidement complexifier les paramètres du tableau en
insérant des macros M4 au lieu des simples chaines de caractères A1,
A2 ...</p>

SUBSECTION(ICON_GEAR[]Du code source en couleur,code)

<p>Il se peut que vous souhaitiez afficher du code sur votre
page. Voici la solution la plus simple, sans couleur qui donnera les
cadres que vous voyez actuellement :</p>
CODE[define([CODE],[&lt;div class="code"&gt;&lt;pre&gt;&lt;code&gt;])
define([ENDCODE],[&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;])
]ENDCODE

<!-- <p>Associé avec le fichier css suivant pour faire un cadre bleu avec
un fond blanc. Ce qui donnera les cadres que vous voyez actuellement.</p>
CODE .code {
     background-color:  #fff;
     border:            1px dotted #69c;
     margin:            10px 0 0 20px;
     padding:           0 1em;
     display:           block;
}
ENDCODE -->

<p>Modifions un peu le code m4x pour avoir une coloriation du
code. Par exemple, si nous souhaitons colorier en gras et bleu le mot
STRONG(BLEU(for)) quand nous éditons du code C mais en gras et rouge
pour du STRONG(ROUGE(Java)).</p>

<p>D'abord définissons quelques macros d'aide. [CONCAT] permet de
concater deux chaines ensemble. [STRONG] permet de mettre en gras une
portion de texte, [COLOR_] permet de colorier une portion de code avec
la couleur passée en paramètre. Finallement [BLEU] et [ROUGE] deux
couleurs.</p>

CODE[define([CONCAT],[$1$2])
define([STRONG],[&lt;strong&gt;$1&lt;/strong&gt;])
define([COLOR_],[&lt;font color="$1"&gt;$2&lt;/font&gt;])
define([BLEU],[COLOR_(blue,$1)])
define([ROUGE],[COLOR_(red,$1)])
]ENDCODE

<p>Maintenant on peut modifer le code de [CODE] qui prend en
paramétre le nom du langage. [ENDCODE] est modifier pour oublier le
nom du langage (modification facultative):</p>
CODE[define([CODE],[define([CODE_],[$1])][&lt;div class="code"&gt;&lt;pre&gt;&lt;code&gt;])
define([ENDCODE],[&lt;/code&gt;&lt;/pre&gt;&lt;/div&gt;define([CODE_],)])
]ENDCODE

<p>Pour finir on va définir les macros pour colorier le mot clef for
  dans la bonne couleur.</p>
CODE[define([_FOR],[STRONG(for)])
define([C_FOR],[BLEU(_FOR)])
define([JAVA_FOR],[ROUGE(_FOR)])
define([FOR],[CONCAT(CODE_,[_FOR])])
]ENDCODE

<p>La première ligne définie une couleur par defaut au mot for. La
deuxième ligne définie une couleur pour le langage C. La troisième
ligne définie une couleur pour le langage Java. Enfin, la dernière
ligne affiche dans la bonne couleur le mot for. En effet lors de la
première itération M4 va processer cette ligne et retourner
[CONCAT(C,_FOR)] puis la deuxième itération retourner [C_FOR] qui
donnera la bonne balise html.</p>

<p>Exemple :</p>
CODE[CODE(C) FOR i ENDCODE
CODE(JAVA) FOR i ENDCODE
CODE FOR i ENDCODE
]ENDCODE

define([JAVA_FOR],[ROUGE(_FOR)])dnl
<p>Va afficher sur un navigateur.</p>
CODE(C) FOR i ENDCODE
CODE(JAVA) FOR i ENDCODE
CODE FOR i ENDCODE

SUBSECTION(ICON_GEAR[]Squelette d'une page,squ)

<p>Se fait seulement en qautre étapes ! Vous pouvez oublier votre
éditeur propriétaire de documents html et économiser votre argent.</p>

<p>La macro [divert] permet de retarder les résultats
d'interprétations du flux d'entrée. Dans notre cas elle permet de
séparer le flux dans des flux temporaires (permettant de trier les
données) puis de coller les flux entre eux de la façon voulue
(réorganiser) en appellant [undivert]. A savoir que les lignes
comprises entre [divert(-1)] et [divert(0)] sont des commentaires.</p>

<p>STRONG(Etape 1:) On commence par donner des identifiants aux différents flux :</p>
CODE[define([DIVERT_FOOTER_CODE],[42])
define([DIVERT_BODY_CODE],[43])
define([DIVERT_NAVIGATION_CODE],[44])
define([DIVERT_HEADER_CODE],[45])
]ENDCODE

<p>STRONG(Etape 2:) On construit le squelette de notre page web. La
mienne est constituée des éléments suivants (les couleurs sont
indiquèes pour vous aider à les repérer sur la page que vous étes
entrain de lire. En effet, notre html généré ne gère pas la couleur,
c'est le rôle de la feuille de style, un fichier avec l'extension
css) :</p>

LISTE(En haut une bannière bleue avec le titre (en blanc) de la page;,

En dessous le menu général du site (orange) et son sous-menu (bleu);,

A gauche en bleu le panneau de navigation stockant des boites tel que le sommaire;,

Plusieurs boites comme le sommaire;,

Le corps de la page de couleur grise contenant le document;,

Enfin en bleu les flêches de navigation.)

<p>STRONG(Etape 3:) Voici le code m4x du squelette page web. On le
  place dans un fichier m4x car c'est lui qui va génèrer la page html
  et de façon identique à toutes les pages du site :</p>
CODE[define([END_BODY],[
divert
_HTML_HEADER_
&lt;table id="page"&gt;
  &lt;!-- SKELETON BEGIN HEADER --&gt;
  &lt;tr&gt;
    &lt;td colspan="2"&gt;
      &lt;div id="header1"&gt;
        &lt;!-- BEGIN USER HEADER 1 --&gt;
        _META_TITLE_
        &lt;!-- END USER HEADER 1 --&gt;
        &lt;/div&gt;
    &lt;/td&gt;
  &lt;/tr&gt;

  &lt;tr&gt;
    &lt;td colspan="2"&gt;
      _MENU_DU_HAUT_
    &lt;/td&gt;
  &lt;/tr&gt;

  &lt;tr&gt;
    &lt;td colspan="2"&gt;
      _SOUS_MENU_
    &lt;/td&gt;
  &lt;/tr&gt;
  &lt;!-- SKELETON END HEADER --&gt;

  &lt;!-- SKELETON BEGIN NAVIGATION MENU --&gt;
  &lt;tr&gt;
    &lt;td id="navigation"&gt;
        &lt;!-- BEGIN USER NAVIGATION MENU --&gt;
        undivert(DIVERT_NAVIGATION_CODE)
        &lt;!-- END USER NAVIGATION MENU --&gt;
    &lt;/td&gt;
    &lt;!-- SKELETON END NAVIGATION MENU --&gt;


    &lt;!-- SKELETON BEGIN BODY --&gt;
    &lt;td id="content"&gt;
        &lt;!-- BEGIN USER BODY --&gt;

        undivert(DIVERT_BODY_CODE)
        &lt;/div&gt;
        &lt;!-- END USER BODY --&gt;
    &lt;/td&gt;
  &lt;/tr&gt;
  &lt;!-- SKELETON END BODY --&gt;

  &lt;!-- SKELETON BEGIN FOOTER --&gt;
  &lt;tr&gt;
    &lt;td colspan="2" id="footer"&gt;
          &lt;!-- BEGIN USER FOOTER --&gt;
          undivert(DIVERT_FOOTER_CODE)
          FINALBOX($@)
          &lt;!-- END USER FOOTER --&gt;
    &lt;/td&gt;
  &lt;/tr&gt;
  &lt;!-- SKELETON END FOOTER --&gt;
&lt;/table&gt;
HTML_FOOTER
&lt;!-- EOF --&gt;])
]ENDCODE

<p>Si un jour je décide de changer la mise en page, il me suffit de
changer l'organistion de cette 50aine de lignes sans que cela implique
une refctorisation du texte &lt;p&gt;Bla bla&lt;/p&gt; de l'étape
4.</p>

<p>STRONG(Etape 4:) Il ne reste plus qu'à écrire votr fichier m4 avec
son texte, ses images, bref tout le contenu importants à écrire et
qui ne sera plus noyé par vos balises html. Il reste néamoins les
balises &lt;p&gt; impossibles à mettre sous forme de macros car cela
allourdirait le document.</p>

CODE[divert(DIVERT_HEADER_CODE)

DEF_TITLE(Le langage de macro M4)
DEF_KEYWORDS(M4 HTML)
DEF_DESCRIPTION(generation de pages html avec m4)
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Sommaire,Introduction,#intro),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Génération d'un site en HTML avec le langage M4)

SUBSECTION(Introduction,intro)

&lt;p&gt;Bla bla&lt;/p&gt;

divert(DIVERT_FOOTER_CODE)

END_BODY(page1,description page 1,page2,description page 2)
]ENDCODE

<p>[_HTML_HEADER_ _META_TITLE_ DEF_KEYWORDS DEF_DESCRIPTION] vont
générer les balises meta par exemple indiquant que l'on utilise XHTML
1.0 strict, etc. Le genre de code pénible à écrire mais à
copier/coller pour chaque page web. Donc leur code est à placer dans
le fichier m4x.</p>

<p>[_MENU_DU_HAUT_ _SOUS_MENU_ HTML_FOOTER] sont du code commun à
toutes les pages du site. Donc leur code est à placer dans le fichier
m4x.</p>

<p>[LEFT_MENU(LEFT_RUBRIC(Sommaire,Introduction,#intro),BANNIERES)] sont
construits pour pointer vers les sections et sous sections du
  document.</p>

<p>[END_BODY] (de l'étape 3) quand il sera appelé va générer la page
  web grâce au système de [divert] et [undivert].</p>


SUBSECTION(ICON_GEAR[]Conclusion,conclusion)

<p>Nous avons vu comment génèrer des pages html en écrivant quelques
macros et à l'execption des balises paragraphes &lt;p&gt; un fichier
m4 ne contient plus de code html. Nous avons pu nous abstraire du
langage cible. Par la même occasion il est possible d'écrire un
fichier latexgenerator.m4x et générer un fichier LaTeX au lieu de html
et ce à partir du même fichier m4.</p>

<p>Avantages de M4 pour la génération de pages HTML :</p>

LISTE(Les pages sont statiques : contrairement à PHP une seule fois
suffit pour générer la page html. Il n'y a pas besoin d'avoir de
serveur php. Donc ressources minimalistes., Le fichier m4 est trés
lisible et ne contient plus que le texte essentiel sans aucune
balise.,La maintenance est donc aisée et repérer les modifications du
fichier avec un outil comme git devient donc simple.)

<p>Inconvénients de M4 pour la génération de pages HTML :</p>

LISTE(Les pages sont statiques : contrairement à PHP, une fois
générées leur contenu ne peut plus être modifié. Mais on peut penser
qu'un serveur fasse tourner le macro-processeur M4 au lieu d'utiliser
PHP, modifie le contenu du fichier M4 et regénère du HTML., M4 utilise
la macro [[divert]] pour placer les flux de données où l'on souhaite
dans un fichier mais ne permet pas de rediriger le flux dans plusieurs
fichiers (on a forcément une entrée et une sortie)., La syntaxe M4
n'est pas simple et créer ses propres macros devient vite impossible à
relire.,Un mot du texte peut entrer en conflit avec par l'une des
macros provoquant soit son remplacement par un texte indésirable (ou
vide) soit en faisant un appel récursif soit en modifiant l'ordre des
paramètres. Par exemple [[LINK]] ou [[LISTE]] est une macro et on ne
peut plus l'utiliser dans un texte sans devoir leur ajouter des quotes
supplémentaires et le symbole virgule ne peut plus être utlisé
simplement à l'intérieur d'une [[LISTE]] sans être quoté. Par
exemple[,] pour afficher dans le navigateur le mot [[LISTE]] depuis
une macro [[LISTE]] (ce qui est le cas ici)[,] je dois l'écrire
&#91;&#91;[[LISTE]]&#93;&#93; dans le fichier m4 sinon il sera
interprété.)

<p>Pour finir sur le ton de la blague et de la rigeur non scientifique
que M4 peut être vu comme une sorte de système de
EXTLINK(https://fr.wikipedia.org/wiki/Vases_communicants,vases
communicants) : on constatera que plus les fichiers m4 seront clairs,
propres, minimalistes, plus les fichiers m4x seront gros, touffus et
devenant incompréhensibles.</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(,)
