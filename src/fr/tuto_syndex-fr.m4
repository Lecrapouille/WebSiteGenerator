dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Logiciel de génération de code distribué SynDEx)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

dnl ICON_NEW STRONG(Page en cours de rédaction).

LEFT_MENU(LEFT_RUBRIC(Découverte du logiciel SynDEx,
Qu'est ce que la méthodologie AAA ?,#aaa,
Qu'est ce que SynDEx ?,#synd,
Mes tutoriels SynDEx en vidéo,#videotuto)

LEFT_RUBRIC(Modèles d'algorithmes et d'architectures,
Modèle d'algorithme,#algo,
Modèle d'architecture,#archi,
Heuristique de distribution et d'ordonnancement,#heur)

LEFT_RUBRIC(En résumé, En résumé : les entrées de SynDEx,#resumentree,
En résumé : les sorties de SynDEx,#resumesortie,
Travail de l'utilisateur,#userwork)

LEFT_RUBRIC(Comprendre le macro code généré,
Exemple de code généré,#ex,
Analyse du code macro par macro,#analyse,
Comprendre les macros de synchronisation,#synchro,
Comprendre le fonctionnement des send_ et receive_,#sendrec,
Résultat du code généré,#res,
Noyau d'exécutif,#noy,
Travail de l'utilisateur,#comp),BANNIERES)

divert(DIVERT_FOOTER_CODE)

divert(DIVERT_BODY_CODE)

SECTION(Découverte du logiciel SynDEx)
SUBSECTION(ICON_EYES[]Présentation,intro)

<p>Nous avons vu MYLINK(tuto_scicos,ici), que le logiciel
   Scilab/Scicos peut facilement intégrer des bibliothèques écrites en
   langage C pour interagir avec des systèmes embarqués via des
   capteurs ou des actionneurs (caméra, joystick, port série). Nous
   avons également vu qu'il n'est pas toujours aisé de l'insérer dans
   une boucle d'asservissement pour contrôler des systèmes temps réel
   (comme pour l'MYLINK(helico_intro,hélicoptère quatre
   rotors)). Néanmoins, il est toujours possible de demander à Scicos
   de générer automatiquement du code C à partir d'un schéma block. Ce
   code peut être compilé, par exemple, pour un Linux RTAI (un Linux
   dont le noyau a été patché pour utiliser le temps réel dur. Voir
   EXTLINK(http://www.scicos.org/scicosrtai.html,ici) pour plus de
   renseignement).</p>

<p>On peut vouloir être encore plus ambitieux et, toujours à partir du
   même schéma block, vouloir générer automatiquement du code pour
   n'importe quelle architecture multiprocesseur et répartir au mieux
   les opérations d'un programme qui peuvent être exécutées en
   parallèle. Scicos ne le fait pas automatiquement mais, par contre,
   il existe un logiciel nommé SYNDEX qui permet de générer du code
   distribué.</p>

<p>Cette page fait une rapide présentation du logiciel SynDEx. Ce
   logiciel est actuellement utilisé pour la deuxième version de mon
   MYLINK(helico_intro,hélicoptère quatre rotors).  Un noyau
   d'exécutif (terme SynDEx que l'on peut définir en première
   approximation par bibliothèque) écrite en C permet au logiciel
   SynDEx de générer du code pour les microprocesseurs dsPIC.</p>

<p>STRONG(NOTE:) cette bibliothèque est en cours de développement et
   n'est pas encore disponible sur ce site.</p>

SUBSECTION(ICON_READ[]Qu'est ce que la méthodologie AAA ?,aaa)

<p>Le document EXECV4 décrit la méthodologie AAA :</p>

<p>La méthodologie d'STRONG(Adéquation Algorithme Architecture) (AAA)
   est basée sur des modèles de graphes pour spécifier d'une part
   l'algorithme et d'autre part l'architecture matérielle. La
   description de l'algorithme permet de mettre en évidence le
   parallélisme potentiel tandis que celle de l'architecture met en
   évidence le parallélisme disponible. Cette méthode consiste en fait
   à décrire l'implantation en terme de transformations de graphes. En
   effet, le graphe modélisant l'algorithme est transformé jusqu'à ce
   qu'il corresponde au graphe matériel modélisant l'architecture.
   L'implantation de l'algorithme sur l'architecture consiste donc à
   réduire le parallélisme potentiel au parallélisme disponible tout
   en cherchant à respecter les contraintes temps réel. Toutes ces
   transformations effectuées avant l'exécution en temps réel de
   l'application, correspondent à une distribution et à un
   ordonnancement des différents calculs sur les processeurs et des
   communications sur les liaisons physiques inter-processeurs. C'est
   à partir de ces allocations spatiales et temporelles qu'un exécutif
   va pouvoir être généré et permettre l'exécution de l'algorithme sur
   l'architecture construite avec des processeurs. Cependant, pour que
   cette implantation soit vraiment efficace, il est nécessaire de
   réaliser une adéquation entre l'algorithme et
   l'architecture. Celle-ci consiste à choisir parmi toutes les
   transformations proposées celle qui optimise les performances temps
   réel.</p>

LOWPICTURE(tuto/syndex/AAA,Résumé de la méthodologie AAA.)

SUBSECTION(ICON_EYES[]Qu'est ce que SynDEx ?,synd)

<p>SYNDEX est un logiciel de CAO mettant en oeuvre la méthodologie AAA
   pour le prototypage rapide et l'optimisation de la mise en oeuvre
   d'applications distribuées temps réel embarquées. A partir d'un
   algorithme et d'une architecture tous deux donnés sous forme de
   graphe, SynDEx génère une implémentation distribuée de l'algorithme
   en langage LINKM4 appelé exécutif. On peut obtenir un graphe
   d'algorithme en important dans SynDex un schéma Scicos.</p>

<p>Ce logiciel est développé par l'équipe AOSTE à l'INRIA
   Rocquencourt. J'ai été stagiaire dans cette équipe. Voir
   MYLINK(stages_presentation,ici) pour plus de renseignements.</p>

SUBSECTION(ICON_EYES[]Mes tutoriels SynDEx en vidéo,videotuto)

<p>Voici une première vidéo tutoriel (qui est en cours de réalisation
   avec l'utilitaire WINK) qui montre comment créer une
   application SynDEx simple. J'en ferai d'autres pour expliquer comment
   demander à SynDEx de générer le code.</p>

TABLEAU(1,LINK(tuto/syndex/T1_CreerArchiAlgo/CreerArchiAlgo.htm,Tutoriel
1),ICON_TGZ,Format Flash)


SECTION(Modèles d'algorithmes et d'architectures,modelalgoarchi)
SUBSECTION(ICON_GEAR[]Algorithmes,algo)

<p>Un algorithme est modélisé par un graphe flot de données
   éventuellement conditionné (il s'agit d'un hypergraphe orienté),
   qui se compose de sommets et d'arcs. Un sommet est une opération et
   un arc un flot de données, c'est-à-dire un transfert de données
   entre deux opérations.</p>

LOWPICTURE(tuto/syndex/algo,Exemple de graphe
d'algorithme sous SynDEx)

<p>Une opération peut-être soit un calcul (comme une addition), soit
   une mémoire d'état (retard), soit un conditionnement ou encore une
   entrée-sortie. Les sommets qui ne possèdent pas de prédécesseur
   sont des interfaces d'entrée (capteurs recevant les stimuli de
   l'environnement) et ceux qui ne possèdent pas de successeur
   représentent des interfaces de sortie (actionneurs produisant les
   actions vers l'environnement). Dans le cas d'une opération de
   calcul, la consommation des entrées précède la production des
   sorties.</p>

SUBSECTION(ICON_GEAR[]Architecture,archi)

<p>Une architecture est modélisée par un graphe dont chaque sommet
   représente un processeur ou un média de communication, et chaque
   arc représente une connexion entre un processeur et un média de
   communications (SAM ou RAM). On ne peut connecter directement deux
   processeurs ou deux médias. Chaque sommet est une machine
   séquentielle qui séquence soit des opérations de calcul pour les
   processeurs, soit des opérations de communications pour les médias
   de communications.</p>

LOWPICTURE(tuto/syndex/archi,Exemple de graphe d'architecture sous SynDEx)

<p>Un processeur et les médias de communication sont des représentations
   abstraites de ce que peut être un PC, un Macintosh, un processus
   (Window, Unix, Mac) ou un microcontrôleur PIC, dsPIC ou bien des
   médias de communications comme le TCP/IP, bus CAN, USB, FireWire,
   port série.</p>

SUBSECTION(ICON_GEAR[]Heuristique de distribution et d'ordonnancement,heur)

<p>Une fois les spécifications de l'algorithme et de l'architecture
   effectuées, il est nécessaire de réaliser l'adéquation. Celle-ci
   est chargée de respecter d'une part l'ordre des événements précisés
   lors de la spécification de l'algorithme et d'autre part les
   contraintes temps réel. Pour cela, parmi toutes les
   transformations de graphes possibles, est choisie celle qui optimise les
   performances temps réel de l'implantation en terme de latence. La
   latence ou temps de réponse R est donnée par la longueur
   du chemin critique du
   graphe logiciel, dont les sommets sont valués par les durées
   d'exécution des opérations correspondantes y compris celles des
   communications inter-processeurs.</p>

<p>Afin de résoudre ce problème d'optimisation du temps de réponse,
   une heuristique a été développée. Il s'agit d'un algorithme glouton
   dont chaque étape alloue une opération à un processeur, route les
   éventuelles communications inter-processeurs c'est-à-dire crée des
   opérations de communication et alloue chacune d'elles à une liaison
   physique. L'ordonnancement des opérations de calculs ou de
   communication est directement déduit de l'ordre dans lequel elles
   sont allouées.</p>

<p>Cette méthode consiste donc à faire progresser le long du graphe
   une coupe séparant les opérations déjà placées sur des processeurs
   de celles qui ne le sont pas encore. La progression se fait en
   respectant les précédences du graphe logiciel. De toutes les
   opérations à distribuer sur la coupe et de tous les processeurs, on
   choisit la paire qui optimise une fonction locale de coût prenant
   en compte :</p>

LISTE(Les différences entre dates locales d'exécution au plus
  tôt et au plus tard (schedule flexibility),

l'allongement du temps global d'exécution : le temps de réponse (latence),

le rythme d'entrée (cadence),

la capacité mémoire.)

SECTION(En résumé,sum)
SUBSECTION(ICON_EYES[]Entrées de SynDEx,resumentree)
<p>Pour résumé, SynDEx prend en entrée :</p>

LISTE(Un graphe d'algorithme (obtenu, par exemple, à partir d'un
schéma bloc Scicos)., Un graphe d'architecture constitué de
processeurs (rectangles bleus et blancs) et de médias de communication
(ronds bleus et arcs)., Les durées des tâches et des communications
(et dans la prochaine version leur période).)

TABLEAU(3,LOWPICTURE(tuto/syndex/algo,Graphe
d'algorithme),LOWPICTURE(tuto/syndex/archi,Graphe d'architecture),
LOWPICTURE(tuto/syndex/duration,Durée des opérations))

SUBSECTION(ICON_EYES[]Sorties de SynDEx,resumesortie)

<p>SynDEx génère automatiquement :</p>

LISTE(Un agenda des tâches à exécuter dans le temps., Des exécutifs
   à savoir les programmes pour chaque processeur écrit en pseudo
   code.)

<p>L'agenda des tâches à exécuter est constitué de colonnes
   symbolisant les processeurs de l'architecture ainsi que les médias
   de communication :</p>

LISTE(Le contenu des colonnes sont les tâches ou les envois/réceptions
   à exécuter dans le temps (de haut en bas) pour chaque processeur ou
   chaque média.,Les épaisseurs des tâches donnent la durée
   d'exécution.,La couleur orange est l'opération (ou communication)
   pointée par le curseur de la souris (on ne la voit pas sur la
   capture d'écran).,La couleur verte indique les opérations qui sont
   exécutées avant l'opération orange et,La couleur rouge indique les
   opérations qui s'exécutent après l'opération orange.)</p>

TABLEAU(2,LOWPICTURE(tuto/syndex/schedul,Agenda des tâches),
LOWPICTURE(tuto/syndex/executif,Exécutif))

<p>Un exécutif est la représentation algorithmique de l'agenda. A
   chaque colonne, un exécutif lui correspond. Il y a donc un exécutif
   généré par processeur. Le pseudo code est en fait la syntaxe du
   langage de macroprocessing LINKM4. Comme on peut le voir sur l'image ci
   dessus, chaque exécutif généré contient une ITALIQUE(thread main)
   qui exécute les calculs (loi de commande, capteurs, actionneurs) et
   au moins une ITALIQUE(thread de communication) qui appellent les
   fonctions de haut niveau envoyer et recevoir une donnée.</p>

<p>Dans la section ici, on explique plus en détail le fonctionnement de l'exécutif.</p>

SUBSECTION(ICON_EYES[]Travail de l'utilisateur,userwork)

<p>STRONG(Entrées de SynDEx :) L'utilisateur doit dessiner dans l'IHM
   les deux types de graphes et définir les périodes de chaque tâches
   et de communication. La création du graphe d'algorithme peut être
   obtenu à partir d'un schéma bloc Scicos via une passerelle
   EXTLINK(http://www-rocq.inria.fr/syndex,S2S).</p>

<p>STRONG(Sorties de SynDEx :) Les exécutifs générés ne peuvent pas
   être exploités tels quels. Il faut d'abord les traduire dans un
   langage adapté (C, assembleur, ...) puis les compiler et les
   flasher dans le micro contrôleur. Cette étape n'est malheureusement
   pas automatisée dans SynDEx à cause du trop grand nombre d'architectures
   disponibles sur le marché (il lui faudrait une base de données des
   registres disponibles pour chaque architecture). C'est le rôle du
   cross-compilateur de les connaître. Il faut pouvoir associer à
   chaque macro M4 une fonction dans le langage désiré.  L'utilisateur
   doit écrire des fichiers d'association entre macro M4 et langage
   désiré. L'ensemble de ces fichiers est appelé ITALIQUE(noyau
   d'exécutif).</p>

SECTION(Comprendre le macro code des exécutifs,comprendre)
SUBSECTION(Exemple de code généré,ex)

<p>D'apparence complexe, ce code est en fait très simple à comprendre
   puisque tous les exécutifs générés ont le même squelette.</p>

CODE
processor_(dsPIC30F,dsPICmaitre,H4H_syndex,SynDEx-6.8.5 (C) INRIA)

semaphores_(
  Semaphore_Thread_RxTx,
  EnvoiMot_a_dsPICmaitre_RxTx_empty,
  EnvoiMot_a_dsPICmaitre_RxTx_full,
  prep_message_out_dsPICmaitre_RxTx_empty,
  prep_message_out_dsPICmaitre_RxTx_full)

alloc_(int,EnvoiMot_a,100)
alloc_(int,prep_message_out,100)

thread_(USART,RxTx,dsPICmaitre,MacBook)
  loadDnto_(,MacBook)
  Pre0_(prep_message_out_dsPICmaitre_RxTx_empty,)
  loop_
    Suc1_(EnvoiMot_a_dsPICmaitre_RxTx_empty,)
    recv_(EnvoiMot_a,PCnonEmbarque,MacBook,dsPICmaitre)
    Pre0_(EnvoiMot_a_dsPICmaitre_RxTx_full,)
    Suc1_(prep_message_out_dsPICmaitre_RxTx_full,)
    send_(prep_message_out,dsPIC30F,dsPICmaitre,MacBook)
    Pre0_(prep_message_out_dsPICmaitre_RxTx_empty,)
  endloop_
  saveFrom_(,MacBook)
endthread_

main_
  proc_init_
  spawn_thread_(RxTx)
  MonGrosCalcul(EnvoiMot_a,prep_message_out)
  Pre1_(EnvoiMot_a_dsPICmaitre_RxTx_empty,RxTx)
  loop_
    Suc0_(EnvoiMot_a_dsPICmaitre_RxTx_full,RxTx)
    Suc0_(prep_message_out_dsPICmaitre_RxTx_empty,RxTx)
    MonGrosCalcul(EnvoiMot_a,prep_message_out)
    Pre1_(prep_message_out_dsPICmaitre_RxTx_full,RxTx)
    Pre1_(EnvoiMot_a_dsPICmaitre_RxTx_empty,RxTx)
  endloop_
  wait_endthread_(Semaphore_Thread_RxTx)
endmain_

endprocessor_
ENDCODE

<p>Comme dit précédemment, ce genre de pseudo code devra être traduit
   dans un langage évolué avant de pouvoir être compilé. Ici, on
   utilisera comme langage cible le langage C pour plus de
   facilité. Le programme obtenu après compilation pourra être
   exécuté sur un OS comme Windows, Linux ou Mac ou sur un
   microcontrôleur comme un (ds)PIC.</p>

SUBSECTION(Analyse du code macro par macro,analyse)

<p>Voici la liste exhaustive des macros à comprendre ainsi que leur rôle.</p>

<p>La macro STRONG(processor_) définit les informations du processeur
   concerné. Par exemple :</p>
CODE
processor_(dsPIC30F,dsPICmaitre,H4H_syndex,...)
ENDCODE

<p>indique que, dans le cadre de l'application SynDEx nommée
   H4H_syndex.sdx, ce code est destiné au processeur nommé dsPICmaitre
   qui est du type dsPIC30Fxxxx.</p>

<p>La macro STRONG(semaphores_) définie tous les sémaphores binaires
   (empty ou full) nécessaires à la bonne synchronisation des threads
   de calcul et de communication de notre programme. A
   l'initialisation du processeur ces sémaphores sont TOUTES
   initialisées à 0 (empty). Pour l'instant, pas besoin d'en savoir
   plus sur leur rôle.</p>

CODE
semaphores_(
  ...
  EnvoiMot_a_dsPICmaitre_RxTx_empty,
  EnvoiMot_a_dsPICmaitre_RxTx_full)
ENDCODE

<p>La macro STRONG(alloc_) réserve un tableau statique de N éléments d'un type
   donné. La taille du tableau ne peut évoluer dynamiquement.</p>

CODE
alloc_(int,EnvoiMot_o,100)
ENDCODE

<p>Par exemple ici on définit un tableau nommé EnvoiMot_o de cent
   éléments de type entier (en général codé sur 32 bits pour le
   langage C mais tout dépend du choix du langage cible choisi ainsi
   que celui de l'architecture du processeur cible). Généralement dans
   l'IHM de SynDEx on met les identifiants _o et _i aux noms des ports
   pour indiquer s'ils sont en entrées ou sorties.</p>

<p>La macro STRONG(main_) désigne la thread de calcul. Les macros
   STRONG(thread_) désignent des threads de communication. Par exemple</p>

CODE
thread_(USART,RxTx,dsPICmaitre,MacBook)
ENDCODE

<p>désigne une thread de communication qui connecte notre processeur
   dsPICmaitre à un autre processeur nommé MacBook (mais dont on ne
   connaît pas l'architecture) via les pins RxTx et utilise le
   protocole USART (ici norme RS232).</p>

<p>La macro STRONG(spawn_thread_) désigne une fonction créant une thread de
   communication (spawn = générer). Par exemple</p>

CODE
spawn_thread_(RxTx)
ENDCODE

<p>correspond à la fonction UNIX thread_create. Ici RxTx réfère au
   protocole USART.</p>

<p>La compréhension des macros STRONG(loop_) et STRONG(endloop_) ne
   pose à priori pas de problème : elles désignent la boucle du
   programme à exécuter. On peut choisir différents types de boucle :
   finie ou infinie, et peuvent avoir différents aspects syntaxiques
   après le macroprocessing (STRONG(while) ou STRONG(for) en langage
   C). Tout dépend comment l'utilisateur à décider de macro-processer
   ce pseudo code. Le code s'exécutant avant STRONG(loop_) s'appelle
   la phase d'initialisation et a pour identifiant la macro
   STRONG(INIT). Le code après STRONG(endloop_) est appelé phase de
   terminaison et a pour identifiant la macro STRONG(END). Le code
   dans la boucle a pour identifiant la macro STRONG(LOOP). Nous avons
   donc trois types de phases. Pour connaître le type phase en cours
   de macroprocessing, une macro a été définie et porte le nom de
   STRONG(MGC).</p>

<p>Les macros du genre STRONG(MonGrosCalcul) sont des fonctions
   définies par l'utilisateur. Elle prennent en paramètre des tableaux
   alloués par les macros STRONG(alloc_), les lisent et les
   remplissent (ports d'entrée, ports de sortie).</p>

CODE
MonGrosCalcul(EnvoiMot_a,prep_message_out)
ENDCODE

<p>Comme nous avons trois types différents de phases (INIT, LOOP,
   END), la macro STRONG(MonGrosCalcul) peut être présente au maximum
   trois fois (et au minimum une fois) dans la thread de calcul
   (STRONG(main_)) : une fois par type de phase. Une option dans l'IHM de
   SynDEx permet de désactiver le dupliquât dans les phases INIT et
   END. Dans notre exemple, seule la phase d'initialisation est
   désirée.</p>

dnl C'est à l'utilisateur d'écrire le code que les macros doivent
dnl   accomplir lors de leurs  expansions dans les noyaux
dnl   d'exécutifs.

<p>Les macros STRONG(loadDnto_) et STRONG(saveFrom_), sauf erreur de
   ma part, servent de bootloader au processeur. Dans mon cas,
   n'utilisant pas de bootloader pour mes microcontrôleurs, je n'ai
   pas plus approfondi l'utilité des ces fonctions.</p>

<p>Les macros STRONG(send_) et STRONG(receive_) (exécutés uniquement
   dans les threads de communication) servent à échanger des données
   avec les autres processeurs. Par exemple :<p>

CODE
send_(prep_message_out,dsPIC30F,dsPICmaitre,MacBook)
ENDCODE

<p>envoie le tout le contenu du tableau prep_message_out de notre
   processeur dsPICmaitre (toujours du type dsPIC) à l'autre
   processeur MacBook.</p>

SUBSECTION(Comprendre les macros de synchronisation,synchro)

<p>Nous passons maintenant à l'étude des macros les plus
   compliquées à savoir STRONG(Suc0), STRONG(Pre0), STRONG(Suc1) et
   STRONG(Pre1) qui sont des macros de synchronisation entre les
   threads de calcul et de communication.</p>

<p>Pour comprendre leur utilité, il ne faut pas oublier que tous les
   processeurs (au sens SynDEx) ne gèrent pas le multithreading au
   sens "plusieurs processus" comme les OS Unix. Des microcontrôleurs
   comme les PIC exécutent séquentielement un seul programme car ils
   n'ont qu'un seul PC (pointeur d'interprétation). Ils ont un seul
   processus même s'ils sont capables d'exécuter en même temps
   l'incrémentation de plusieurs timers, d'envoyer une donnée sur
   l'USART, recevoir une donnée SPI de générer un signal PWM et de
   lire une valeur analogique.</p>

<p>Pour cela, il faut simuler le multithreading et c'est pour cela
   qu'on a besoin des macros STRONG(Suc0), STRONG(Pre0), STRONG(Suc1)
   et STRONG(Pre1).</p>

<p>Les STRONG(SucX) et STRONG(PreX) (X = {0,1}) sont les verrous de
   sémaphores binaires pour la synchronisation de l'exécution des
   pseudo threads entre elles (calcul et communication). Elles
   correspondent sous Linux aux fonctions STRONG(wait) et
   STRONG(signal) ou P/V en allemand. STRONG(wait) permet de poser un
   verrou alors que STRONG(signal) enléve le verrou. (STRONG(Note :)
   la mnémotechnique est P pour "Puis-je ?" et V pour "Vas y !"). Avec
   un dsPIC il faut définir ces fonctions alors que sous Unix elles
   sont déjà codées. De même, la macro STRONG(spawn_) ne sert pas pour
   les dsPIC car les threads de communication et de calcul ne sont
   plus que de simples fonctions d'où le terme (non officiel) que
   j'utiliserai "pseudo thread".</p>

<p>Une question légitime à ce niveau, qu'elle est la méthode de
   simulation  de fonctionnement des threads ? La réponse est simple c'est
   la macro STRONG(Pre1) de la pseudo thread de calcul qui va indiquer
   au PC de sauter vers le STRONG(Suc1) lui correspondant dans la
   pseudo thread de communication. Avant le saut, on sauve la valeur
   du PC dans une pile. STRONG(Pre1) joue, en première approximation,
   le rôle de STRONG(goto) et STRONG(Suc1) joue le rôle de label
   (étiquette).</p>

<p>Il ne reste plus qu'à savoir comment retourner à la pseudo thread
   de calcul. En fait, STRONG(Suc1) et STRONG(Pre1) sont plus
   compliqués qu'il n'y paraît à première vue : ils modifient les valeurs des
   sémaphores binaires (souvenez vous de la macro STRONG(semaphores_)
   !).  Si lors de l'exécution du STRONG(Suc1), la valeur du
   sémaphores ne correspond pas alors on dépile la valeur du PC pour
   revenir à l'endroit du code avant le saut dans la pseudo thread de
   communication; sinon le PC continue à avancer dans le code de la
   pseudo thread de communication.</p>

<p>STRONG(Suc0) et STRONG(Pre0) permettent de synchroniser les
   STRONG(send_) et STRONG(receive_).</p>

<p>Pour résumer, quand on exécute pas à pas un code généré par SynDEx
   on voit que le PC va sauter de la thread de main à une thread de
   communication puis le selon la valeur
   des sémaphores binaires :</p> LISTE(soit le PC va
   revenir la où il était dans la thread de main juste avant le saut.,
   Soit continuer son exécution dans la thread de communication.)

<p>La répartition des STRONG(send_), des STRONG(receive_), et des
   opérations définies par l'utilisateur comme STRONG(MonGrosCalcul),
   dépend de l'heuristique employée par SynDEx. Elle dépend du nombre de
   processeur, du parallélisme potentiel, du parallélisme disponible
   et de la durée des tâches et des communications (qu'il faudra ajuster
   au mieux, à savoir connaître le temps au plus tard). Par
   heuristique on entend que la solution fournie est bonne sans être
   forcément optimale car le calcul de la solution optimale est trop
   complexe (NP-complet).</p>

<p>Le document EXECV4, difficile à appréhender lors de la première
   lecture, donne plus de renseignements sur comment coder en C ou
   assembleur les macros STRONG(Suc0), STRONG(Pre0), STRONG(Suc1) et
   STRONG(Pre1).</p>

SUBSECTION(Comprendre le fonctionnement des send_ et receive_,sendrec)

<p>Les macros STRONG(send_) et STRONG(receive_) permettent
   respectivement d'envoyer et de recevoir des données entre les
   différents processeurs. Le code associé dépend du type de média de
   communication. En effet, il faut vérifier que les STRONG(send_)
   d'un processeur et les STRONG(receive_) du processeur à l'écoute
   restent synchronisés.</p>

<p>Sur des protocoles comme l'UART, il faudra mettre en place des
   buffeurs circulaires et des signaux de contrôle de flux ou de
   protocole d'accord (handshaking). C'est sans aucun doute les macros
   les plus durs à coder. Des noyaux d'exécutif générique SynDEx
   existent déjà pour le protocole CAN et TCP/IP et peuvent être
   téléchargés sur le site officiel de SynDex.</p>

<p>Je m'amuse à coder mon propre protocole de communication UART
   (norme RS232) communément appelé port série. Voir
   MYLINK(comm_rs232,ICI) pour plus de renseignements.</p>

SECTION(Résultat du code généré)
SUBSECTION(Noyau d'exécutif)

<p>Nous venons de voir quelles étaient le rôle des différentes macros
   SynDEx. Il faut les traduire dans un langage cible : c'est le rôle
   des noyaux d'exécutifs.</p>

<p>Comme nous l'avons dit le code généré par SynDEx utilise la syntaxe M4. Ce code</p>
Par exemple
CODE
[define(`toto',`tutu')]
ENDCODE

A chaque fois que le parseur M4 va voir le mot toto dans le fichier il
va le remplacer par le mot tutu.  Je conseille de lire le manuel
LINKM4 et le document EXECV4. (NOTE: ce site est ENTIEREMENT généré
par macro M4)

<p>Dans le jargon de l'équipe AOSTE, l'ensemble
des définitions M4 define réunies dans un même fichier est appelé
noyau d'exécutifs et porte l'extension .m4x</p>

CODE
[define(`main_',`int main(void) {')]
ENDCODE

Pour les définitions des opérations de l'utilisateur le code est un peu plus compliqué.

CODE
[define(`MonAddition',`ifelse(
    processorType_,`PIC16F',`ifelse(
         MGC,`INIT',``movlw $1            ; charger $1 dans W
                      movwf mavariable    ; mavariable vaut maintenant $1
                      movlw $2            ; charger $2 dans W
                      addwf  mavariable,f ; résultat : (W) + (mavariable), donc $1 + $2
                                          ; résultat sauvé dans mavariable (,f).'',
         MGC,`LOOP',``'',
         MGC,`END',``'')',
    processorType_,processorType_,`ifelse(
         MGC,`INIT',``'',
         MGC,`LOOP',``$3[1] = $1[1] + $2[1];'',
         MGC,`END',``'')')')]
ENDCODE


SUBSECTION(Travail de l'utilisateur,comp) LISTE(Avoir une librairie de
définitions M4 pour traduire les exécutifs générés par SynDEx dans un
langage voulu (assembleur[,] C[,] ...). Certaines librairies ont déjà
été définies/codées et peuvent être téléchargées sur le site de
SynDex. C'est le cas de l'architecture Unix et du protocole TCP/IP et
bus CAN. Si ce n'est pas la cas, il faudra développer une librairie
par vous même., Exécuter le Makefile pour faire l'expansion des macros
exécuter les fichiers
m4 puis compiler les fichiers obtenus pour en faire des exécutables et
enfin flasher les processeurs.)

Par exemple voici ma génération de code pour dsPIC et Unix.
CODE
/******************************************************************************/
/* SEMAPHORES BINAIRES                                                        */
/******************************************************************************/
static int semaphores[[5]] = { 0, 0, 0, 0, 0 };

#define SEMAPHORE_THREAD_RXTX                     4
#define ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY         3
#define ENVOIMOT_A_DSPICMAITRE_RXTX_FULL          2
#define PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_EMPTY   1
#define PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_FULL    0

/******************************************************************************/
/* Pseudo thread de communication USART entre dsPICmaitre et MacBook */
/******************************************************************************/
void thread_comm_USART(int state)
{
    /* ********** */
    /* Phase INIT */
    /* ********** */

    /* La phase d'init ce thread a ete transfere dans */
    /* l'init de la fonction main */

    /* ********** */
    /* Phase LOOP */
    /* ********** */
    while (1)
      {
          /* Les "case" ne sont pas termines par des break :  */
          /* c'est pour pouvoir continuer le code dans les "case" suivants */
          switch (state)
            {
            case -1: /* sert a reboucler */
            case ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY: /* Suc1 */
                if ((semaphores[[ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY]] ^= 1) == 1)
                    return;
                USART_read(EnvoiMot_a, 5); /* dsPICmaitre --> MacBook */
                semaphores[[ENVOIMOT_A_DSPICMAITRE_RXTX_FULL]] = 1; /* Pre0: unlock */

            case PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_FULL: /* Suc1 */
                if ((semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_FULL]] ^= 1) == 1)
                    return;
                USART_write(prep_message_out, 5); /* MacBook --> dsPICmaitre */
                semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_EMPTY]] = 1; /* Pre0: unlock */

            default:
                state = -1; /* Re boucle */
                break;
            }                   /* end switch thread comm  */
      }                         /* end loop thread comm */

    /* ********* */
    /* Pahse END */
    /* ********* */

}                               /* end thread comm */

/******************************************************************************/
/* Thread Main                                                                */
/******************************************************************************/
int main(void)
{
    /* ********** */
    /* Phase INIT */
    /* ********** */

    /* Initialisation du thread de comm USART */
    USART_init(); /* spawn */

    semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_EMPTY]] = 1; /* Pre0: unlock */
    thread_comm_USART(-1);
    thread_comm_USART(ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY); /* Pre1: lock */

    /* ********** */
    /* Phase LOOP */
    /* ********** */
    while (1)
      {
          /* Suc0: while until unlock on interrupt */
          while (semaphores[[ENVOIMOT_A_DSPICMAITRE_RXTX_FULL]] == 0)
              ;
          semaphores[[ENVOIMOT_A_DSPICMAITRE_RXTX_FULL]] = 0;

          /* Suc0: while until unlock on interrupt */
          while (semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_EMPTY]] == 0)
              ;
          semaphores[[PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_EMPTY]] = 0;

          UnGrosCalcul();

          thread_comm_USART(PREP_MESSAGE_OUT_DSPICMAITRE_RXTX_FULL); /* Pre1: lock */
          thread_comm_USART(ENVOIMOT_A_DSPICMAITRE_RXTX_EMPTY); /* Pre1: lock */
      }  /* end loop thread calcul */

    /* ********* */
    /* Pahse END */
    /* ********* */

    /* Suc0: while until unlock on interrupt */
    while (semaphores[[SEMAPHORE_THREAD_RXTX]] == 0)
        ;
    semaphores[[SEMAPHORE_THREAD_RXTX]] = 0;

    return 0;
}
ENDCODE

<p>STRONG(Note :) L'utilitaire Linux STRONG(indent) permet de formater et de re-indenter le code généré de façon automatique.</p>

SECTION(Conclusion)
SUBSECTION(Le mot de la fin,conclu)
<p>Bien SynDEx soit un logiciel puissant in n'est pas encore capable
  de tout gérer. Les
   points suivants sont en cours de développement :</p>
   LISTE(Tolérance aux pannes : c'est une méthode qui consiste à
   doubler ou tripler le nombre de processeurs pour éviter qu'une panne
   matériel fasse cracher toute l'application. C'est très important pour
   l'avionique)., Des tâches multi périodes : par exemple on désire
   exécuter la tâche A toutes les 10 ms et la tâche B toutes les 20
   ms. Par cycle A sera exécuter 2 fois et B une fois.,Des données
   asynchrones comme l'envoie d'une donnée par un capteur (caméra),
   ...)</p>

<!-- <p>Concernant l'écriture de mon exécutif pour dsPIC, je n'ai pas
  encore terminé le code des send_ et receive_. Par contre le
  squelette du programme semble fonctionner. Ensuite il faudra passer
  aux tests.</p>
-->


<!-- <p>Manque la chaine Scicos SynDEx Mplab</p> -->

SUBSECTION(Projet(s) similaire(s))
<p>Il existe au moins un projet similaire pour la génération automatique de code
pour les processeurs (ds)PIC. EXTLINK(http://www.kerhuel.eu/RTWdsPIC/) </p>

SUBSECTION(Liens)
M4
SYNDEX
Tuto SYNDEX
Mon port série
CyCab

divert(DIVERT_FOOTER_CODE)

END_BODY(,,,,) dnl helico_electronique,helico_asservissement)
