dnl -*- html -*- Coloration Syntaxique pour Emacs
TITLE(Auto-chargement d'une bibliothèque dynamique)
KEYWORDS()
DESCRIPTION()

SECONDARY_HEAD_MENU(SECONDARY_HEAD_MENU_3D)
divert(DIVERT_NAVIGATION_CODE)
LEFT_MENU(LEFT_RUBRIQUE()) dnl TABLE_OF_CONTENTS))
dnl Sommaire,Introduction,#intro,Aperçus du jeu,#view,Téléchargement,#download,Au coeur du Forth,#heart,Liens,#links), BANNIERES)

BEGIN_BODY

SECTION(ICON_READ,Introduction,intro)

<p>J'écris cet article suite à la découverte de ce
EXTLINK(http://runtimecompiledcplusplus.blogspot.fr,projet) (dont les
sources sont disponibles sur
GITHUB(RuntimeCompiledCPlusPlus/RuntimeCompiledCPlusPlus,GitHub))
qui propose une méthode perméttant de charger à la volée du code
C/C++, un language compilé, et ainsi imiter le comportement d'un
language interprété. Le but recherché est de minimiser le temps de
compilation et de ne pas avoir à relancer l'application à chaque fois
qu'on l'a compile. Cette méthode repose sur l'utilisation des
bibliothèques dynamiques. Dans la vidéo du blog, l'auteur modifie une
ligne de code C++ permettant de changer la couleur d'un objet 3D dans
une application de type jeu vidéo. Lorsque l'auteur sauve le fichier C++,
la couleur change sans devoir redémarrer l'aplication. Gain de
temps.</p>

<p>Le but de mon article n'est pas de faire un cours sur les
mécanismes d'une bibliothèque dynamique, le lecteur est invité à faire
sa propre recherche sur internet avec comme mot clef "shared library"
(par exemple:
EXTLINK(http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html,c
HOWTO Linux)). Le but est d'expliquer trés simplement comment
fonctionne puis d'écrire un code trés basique expliquant le
comportement. En effet le projet initial, malgré la présence d'un
wiki, explique mal la méthode générale et le code est trop compliqué:
il n'a pas été conçu de façon générique. En effet les auteurs, pour la
rélalisation d'un projet professionel (jeu 2D) ont ajouté cette
méthode optimisant leur temps de dévelopement mais il aurait été plus
logique, pour un soucis pédagogique, de faire l'inverse: présenter
l'algorithme puis comme exemple de présenter l'application utilisant
cette méthode.</p>

SECTION(ICON_READ,bibliothèque dynamique,bibl)

<p>Une bibliothèque dynamique (Shared Library en anglais) ... TODO
]  bref rappel.</p>

SUBSECTION(ICON_READ,Création d'un bibliothèque dynamique,crea)

<p>Crééons un fichier C nommé lib.c dont le code suivant affiche la
  chaine de caractère "Hello world":</p>
CODE[]#include &#60;stdio.h&#62;

void helloworld(void) { printf("Hello word\n"); }ENDCODE

<p>Pour créér la bibliothèque dynamique associée que l'on nommera, par exemple sur Mac
  OS X: livecode.dylib. Le fichier lib.o ne nous intéresse pas. Un peu plus loin dans cet article, nous ré-écrirons ce code dans un Makefile.<p>
CODE[]gcc -c -W -Wall lib.c
gcc -dynamiclib -undefined suppress -flat_namespace lib.o -o livecode.dylib
ENDCODE

 <p>Si tout se passe bien, deux fichiers auront été créés: lib.o et
 livecode.dylib (ou bien livecode.so ou bien livecode.dll selon l'architecture
 utilisée). Par sécutité, vérifions que la fonction helloworld est bien présente
   dans la bibliothèque:</p>
CODE[]nm livecode.dylib
0000000000000f70 T _helloworld
                 U _printf
                 U dyld_stub_binder
 ENDCODE

 <p>Nous voyons que le symbole _helloworld est bien défini: il a une
 addresse 0f70.</p>

SUBSECTION(ICON_READ,Utilisation d'une bibliothèque dynamique,util)

<p>Nous utiliserons pour cela la classe
EXTLINK(https://developer.gnome.org/glibmm/stable/classGlib_1_1Module.html,Module)
de la bibliothèque glibmm qui est une surcouche (wrapper) C++ de la version C
EXTLINK(https://developer.gnome.org/glib/stable/glib-Dynamic-Loading-of-Modules.html,glib)
utilisée pour le projet EXTLINK(https://www.gtk.org,GTK+). La raison
est la suivante: être multi-plateforme (Linux, OSX, Windows). On
  aurait tout aussi bien pu utiliser la bibliothèque EXTLINK(https://pocoproject.org,
POCO) (confère sa
EXTLINK(https://pocoproject.org/slides/120-SharedLibraries.pdf, documentation)).</p>

CODE[]1  #include &#60;iostream&#62;
2  #include &#60;glibmm/module.h&#62;
3
4  typedef void (*fptr)();
5
6  int main()
7  {
8    Glib::Module module("livecode.dylib");
9    if (module)
10   {
11      void* func = nullptr;
12      bool found = module.get_symbol("helloworld", func);
13      std::cout &#60;&#60; "found " &#60; &#60; found &#60; &#60; std::endl;
14      if (found)
15        {
16          fptr my_fptr = reinterpret_cast&#60;fptr&#62;(reinterpret_cast&#60;long&#62;(func)) ;
17          my_fptr();
18        }
19    }
20  else
21    {
22      std::cout &#60;&#60; "Not loaded" &#60;&#60; std::endl;
23    }
24
25  return 0;
26 }ENDCODE

<p>Explication du code:</p>
<p>Ligne 2: Utilisation de la classe Module fournie par la
  glibmm.</p>
<p>Ligne 4: définition d'un pointeur sur fonction sans paramètre et
  retournant void.</p>
<p>Ligne 8: On charge la bibliothèque dynamique livecode.dylib et si
  elle est correctement chargée, ligne 12, on recupère la fonction
  helloworld et que l'on cast ligne 16.</p>
<p>Ligne 17: on execute le pointeur sur fonction qui doit afficher
  "Hello World" sur stdout.</p>
<p>Ligne 26: module est détruit, l'appel de son destructur permet de
 décharger la bibliothèque.</p>

SUBSECTION(ICON_READ,Chargement automatiquement d'une bibliothèque dynamique,charg)

<p>Fort de cette connaissance, nous allons modifier le code précédent
pour émuler le comportement dynamique d'un language
interprété. Crééons le fichier module.cpp avec le code qui
suit. module.cpp sera compilé sous la forme d'un exécutable et sera
nommé "module". Ce que nous voulons que cet exécutable fasse: il
chargera la fonction helloworld de livecode.dylib (issu de lib.c) et
dés que l'utilisateur modifie le code du fichier lib.c un moyen (à
déterminer) indiquera à module qu'il a été changé. Une fois notifié,
le fichier lib.c sera compilé puis rechargé à nouveau dans
l'application module. Par exemple, si l'on se contente de modifier le
texte "hello world" par un autre texte, à chaque fois que le fichier
lib.c est sauvegardé, le nouveau texte sera affiché
automatiquement.</p>

<p>Voici la première partie du code de module.cpp:</p>
CODE[]1   #include &#60;iostream&#62;
2   #include &#60;glibmm/module.h&#62;
3
4   typedef void (*fptr)();
5
6   static long prevUpdateTime = 0;
7   static Glib::Module *module = nullptr;
8   static const std::string c_livefile = "lib.c";
9   static const std::string c_livefunc = "helloworld";
10  static const std::string c_livelib = "livecode.dylib";
11
12  static bool reload()
13  {
14   bool ret = false;
15
16   // Don't forget to clean up
17   if (nullptr != module)
18     {
19       std::cout &#60;&#60; "delete module" &#60;&#60; std::endl;
20       delete module;
21     }
22
23   module = new Glib::Module(c_livelib);
24   if ((nullptr != module) && (*module))
25     {
26       std::cout &#60;&#60; "Success loading "
27                 &#60;&#60; c_livelib &#60;&#60; "'"
28                 &#60;&#60; std::endl;
29
30       void* func = nullptr;
31       if (module->get_symbol(c_livefunc, func))
32         {
33           std::cout &#60;&#60; "found the function "
34                     &#60;&#60; c_livefunc &#60;&#60; "()"
35                     &#60;&#60; std::endl;
36           fptr my_fptr = reinterpret_cast &#60; fptr&#62;(reinterpret_cast &#60; long&#62;(func));
37           my_fptr();
38
39           ret = true;
40         }
41       else
42         {
43           std::cerr &#60;&#60; "Couldn't find the function "
44                     &#60;&#60; c_livefunc &#60;&#60; "() '"
45                     &#60;&#60; module->get_last_error()
46                     &#60;&#60; "'" &#60;&#60; std::endl;
47         }
48     }
49   else
50     {
51       std::cerr &#60;&#60; "Error: No dice loading '"
52                 &#60;&#60; c_livelib &#60;&#60; "'"
53                 &#60;&#60; std::endl;
54     }
55   return ret;
56 }ENDCODE

<p>Lignes 8 à 10 nous définissons respectivement les noms du fichier,
 de la fonction et de la bibliothèque. Ligne 6 définit la variable
 prevUpdateTime qui est utilisée pour détecter une modification du
 fichier lib.c.</p>

<p>La fonction reload() permet de recharger la bibliothèque
  livecode.dylib. Si elle est déjà présente, elle est d'abord
  déchargée (lignes 17 à 21) puis rechargée (lignes 23 à 56) de la
  même manière que vu précédement.</p>

<p>Voici la deuxième partie du code de module.cpp:</p>
CODE[]57
58 #include &#60;cstdlib&#62; // system
59
60 static void recompileAndReload()
61 {
62   std::cout &#60;&#60; "#################################" &#60;&#60; std::endl;
63
64   std::string cmd = "make lib";
65   system(cmd.c_str());
66   reload();
67 }ENDCODE

<p>Ligne 60, la fonction recompileAndReload permet de compiler le
 fichier lib.c et de créer le fichier livecode.dylib en appellant le
 Makefile via l'appel system system(). Ici nous lui demanderons
 d'exécuter la régle lib. Le contenu du Makefile sera détaillé plus
  loin dans cet article.</p>

<p>Ligne 66: la fonction reload() est appelée.</p>

<p>Voici la troisième partie du code de module.cpp:</p>
CODE[]68
69 #  include &#60; sys/stat.h&#62; // stat
70
71 void checkAndUpdate(std::string const & livefile)
72 {
73   struct stat fileStat;
74
75   if (stat(livefile.c_str(), &fileStat) &#60; 0)
76     {
77       std::cerr &#60;&#60; "Couldn't stat file " &#60;&#60; livefile &#60;&#60; std::endl;
78       return;
79     }
80
81   long currUpdateTime = fileStat.st_mtime;
82   if (currUpdateTime != prevUpdateTime)
83     {
84       std::cout &#60;&#60; "Compile reload" &#60;&#60; std::endl;
85       recompileAndReload();
86     }
87   prevUpdateTime = currUpdateTime;
88 }ENDCODE

<p>La fonction checkAndUpdate permet de vérifier que le fichier lib.c
 n'a pas été modifié. Ici on se contente simplement de comparer la
 date de modification du fichier. Notons qu'une date modifiée
 n'implique pas forcément que le contenu du fichier ait changé. Le
 lecteur pourra consolider la condition de rechargement par exemple
 avec l'article
 EXTLINK(http://nullprogram.com/blog/2014/12/23,suivant).</p>

<p>Voici la dernière partie du code de module.cpp:</p>
CODE[]89
90 #include &#60; unistd.h&#62; // sleep
91
92 int main()
93 {
94   while (true)
95     {
96       checkAndUpdate(c_livefile);
97       usleep(100000);
98     }
99
100  return 0;
101 }ENDCODE

<p>On se contente toutes les 100 ms de vérifier que le fichier n'a pas
 été modifé. En alternative à cette boucle, on peut penser à utiliser
 des notifications comme par exemple
 EXTLINK(https://fr.wikipedia.org/wiki/Inotify,inotify) pour Linux
  (non portable).</p>

<p>Finallement voyons le dernier fichier important le Makefile:</p>
CODE[]all: module

.PHONY: module
module:
        g++ -W -Wall --std=c++11 `pkg-config --cflags --libs gtkmm-3.0` module.cpp -o module

.PHONY: lib
lib:
        gcc -c -W -Wall lib.c
        gcc -dynamiclib -undefined suppress -flat_namespace lib.o -o livecode.dylib

clean:
        rm -fr *~ *.o *.dylib module
ENDCODE

<p>La régle par défault "all" compile uniquement l'exécutable
 module. On doit appeller la régle lib pour compiler le fichier lib.c
 et avoir le fichier livecode.dylib. Rappelez vous que c'est la
 fonction recompileAndReload qui appelle le Makefile avec la régle
 lib.</p>

SUBSECTION(ICON_READ,Test et conclusion,test)

<p>TODO: tarball</p>

<p>Testons le projet:</p>
CODE[]make
./module
ENDCODE

<p>Devrait afficher:</p>
CODE[]Compile reload
#################################
gcc -c -W -Wall lib.c
gcc -dynamiclib -undefined suppress -flat_namespace lib.o -o livecode.dylib
Success loading livecode.dylib'
found the function helloworld()
Hello word
ENDCODE

<p>Modifions le fichier lib.c, remplaçons "Hello world" par "Bonjour
  tout le monde". Sauvegardons le fichier. Dans la console, on doit
  voir apparaître le nouveau texte:</p>
CODE[]Compile reload
#################################
gcc -c -W -Wall lib.c
gcc -dynamiclib -undefined suppress -flat_namespace lib.o -o livecode.dylib
Success loading livecode.dylib'
found the function helloworld()
Hello word
Compile reload
#################################
gcc -c -W -Wall lib.c
gcc -dynamiclib -undefined suppress -flat_namespace lib.o -o livecode.dylib
Success loading livecode.dylib'
found the function helloworld()
Bonjour tout le monde
ENDCODE

<p>En conclusion, nous avons vu comment une méthode qui permet
d'utiliser le language C comme un language interprété tout en
gardantl'avantage d'un language compilé. Cette technique est
certainement très utile pour des applications visuelles (jeux vidéos)
ou d'asservissement (loi de contrôle) afin d'apprécier un comportement
tel que le tuning de paramètres (comme un moteur de particule pour le
jeu vidéo ou bien le réglage d'un asservissement PID par exemple) sans
avoir à redémarer l'application: modifier le code, sauvegarder et voir
le changement de comportement.</p>

<p>Nous n'avons pas aborder les sujets suivants: chargement d'un code
 en C++, comment sauvegarder et restaurer le contexte (états) de
 l'application avant et après chargement de la bibliothèque,
 désactiver ce comportement pour le mode release (code destiné à
 l'utilisateur final). ni comment se protéger d'un segfault avec le code
 chargé dynamiquement.</p>

END_BODY(simtadyn,Le projet SimTaDyn,,)
undivert(DIVERT_TABLE_OF_CONTENT)
