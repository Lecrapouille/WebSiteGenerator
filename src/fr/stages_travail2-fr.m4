dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Développement d'un train virtuel de CyCabs avec Scilab/Scicos/SynDEx)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_CV)

divert(DIVERT_NAVIGATION_CODE)

ICON_NEW STRONG(Page en cours de rédaction).

LEFT_MENU(LEFT_RUBRIC(Raccourcis,Présentation,#intro,Histoire de la conduite automatique,#histoire,Cyber Cabi,#cycab,Travail effectué,#travail,Résumé,#resume),
LEFT_RUBRIC(Pages suivantes,Présenation,stages_presentation-LANG.html,Stage INRIA 2,stages_travail2-LANG.html,
Stage INRIA 1,stages_travail1-LANG.html,Download,stages_download-LANG.html),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Stage 2 : Résumé des activités)
SUBSECTION(ICON_READ[]Présentation,intro)

<p>Le MYLINK(stages_download,rapport) de mon deuxième stage
présente le travail réalisé dans le cadre du stage de 7 mois (janvier
-- juillet 2007) de fin d'étude pour l'EPITA, intitulé
ITALIQUE(Développement d'un train virtuel de CyCabs avec
Scilab/Scicos/SynDEx) et s'est déroulé à l'INRIA Rocquencourt sous la
direction de Yves Sorel, responsable du projet AOSTE dont l'équipe
travaille sur des modèles et des méthodes pour l'analyse et
l'optimisation des systèmes temps réel embarqués. L'équipe AOSTE est
en relation avec l'équipe IMARA qui travaille sur des projets de route
automatisée.</p>

<p>L'équipe AOSTE développe le logiciel de CAO SYNDEX qui met en oeuvre
la méthodologie AAA pour le prototypage rapide et l'optimisation de la
mise en oeuvre d'applications distribuées temps réel embarquées. A
partir d'un algorithme et d'une architecture donnés sous forme de
graphe, SynDEx génère une implémentation distribuée de l'algorithme en
macro-code. La validation de l'algorithme a été faite avec les
logiciels de modélisation/simulation SCILAB/SCICOS, développés par
l'équipe Scilab/METALAU.</p>

PICTURE(cycab/cycab.jpg,Un CyCab)

<p>Le CyCab est un véhicule électrique (sa longueur n'excède pas celle
d'un vélo, c'est-à-dire 1,9 mètre) destiné au transport de deux
personnes (largeur : 1,2 mètre) dans des environnements urbains et
péri-urbains encombrés : centres-villes, centres commerciaux, parcs
d'attractions, aéroports, etc. N'étant pas prévu pour de longs
trajets, sa vitesse est limitée à 30 kilomètre à l'heure. De base, il
peut être commandé manuellement par un joystick. Il sert d'application
directe au logiciel SynDEx. C'est ainsi qu'a été généré le code
distribué sur les processeurs embarqués du CyCab pour la conduite
manuelle. A présent, le but est d'effectuer un train de CyCabs liés
électroniquement grâce à une caméra à bas-coût.</p>

<p>Le but de mon stage a été de poursuivre le travail mené sur le
suivi automatique de CyCabs avec une caméra bas coût. Il a fallu
implémenter un algorithme d'estimation de la distance entre deux
véhicules basé sur de la détection de contours dans des images puis
déterminer l'asservissement longitudinal du CyCab suiveur en
simulation avec le logiciel Scilab. Enfin, il a fallut générer, grâce
à la chaîne d'outils Scilab/Scicos/SynDEx le code temps réel, avec ses
communications et synchronisations distribuées sur chacun des
processeurs embarqués.</p>

<!-- <p>Le MYLINK(rapport, stages_download) se compose de huit
parties. Dans la première partie, on présente l'architecture
matérielle du CyCab (les deux noeuds à coeur MPC, le PC embarqué,
reliés par un bus CAN). Dans la deuxième partie, on présente le
système d'exploitation du PC embarqué basé sur un Linux temps
réel. Dans les parties trois et quatre, nous rappellerons les éléments
d'automatique et de traitement d'images utilisés. Dans les parties
cinq et six, nous présentons les logiciels de développement~:
Scilab/Scicos et SynDEx. Enfin, dans les parties sept et huit nous
parlons des logiciels générés par Syndex pour faire de la conduite
manuelle puis automatique.</p> -->

SUBSECTION(ICON_READ[]Histoire de la conduite automatique,histoire)

<p>Dans le cadre de la route automatisée, l'INRIA a imaginé un système de
transport original de véhicules en libre-service pour la ville de
demain. Ce système de transport public est basé sur une flotte de
petits véhicules électriques spécifiquement conçus pour les zones où
la circulation automobile doit être fortement restreinte. Pour tester
et illustrer ce système, un prototype, nommé CyCab (contraction pour
Cyber Cab), a été réalisé.</p>

<p>Les chercheurs de l'INRIA et de l'Inrets (Institut National de
Recherche sur les Transports et leur Sécurité) travaillent depuis 1991
sur de nouveaux moyens de transport intelligent pour la ville. Ils
étudient en particulier le concept du libre-service et celui de la
voiture automatique. Les premiers résultats de recherche ont débouché
sur le projet Praxitèle (1993-1999), qui était en exploitation à
Saint-Quentin-en-Yvelines. Les partenaires industriels du projet
étaient CGFTE (la filiale transports publics de Vivendi), Dassault
Electronique, EDF et Renault.</p>

<p>Dans le cadre du projet Praxitèle l'INRIA a démontré la faisabilité de
la conduite automatique sous certaines conditions : créneau et train
de véhicule expérimenté sur une Ligier électrique instrumentée à cet
effet.</p>

<p>Pour des raisons de législation et de responsabilité ces automatismes
de conduite n'ont pas pu être implémentés sur les Clio électriques de
Saint-Quentin-en-Yvelines. Le CyCab a ensuite été développé par
l'INRIA avec l'aide de l'Inrets, de EDF, de la RATP et de la société
Andruet S.A. pour montrer le potentiel de l'informatique dans la
conduite de véhicules. Le CyCab est un véhicule électrique à quatre
roues motrices et directrices avec une motorisation indépendante pour
chacune des roues et pour la direction. Pour contrôler et commander
les 9 moteurs du CyCab (4 de traction, 1 de direction et 4 de frein),
une architecture matérielle a été choisie. Elle est constituée de
noeuds intelligents pouvant gérer les différents moteurs du CyCab et
répartie autour d'un bus de terrain CAN (Controller Area Network),
très répandu dans le monde de l'automobile.</p>

<p>Le rôle des noeuds est d'asservir les moteurs en fonction des
consignes de vitesse et de braquage qui transitent sur le bus CAN soit
en provenance de la position du joystick, soit par un programme de
planification de trajectoires. Le noeud doit donc non seulement être
capable de fournir la puissance nécessaire aux moteurs, mais aussi
exécuter les boucles d'asservissement de vitesse ou de position. Pour
ce faire il doit prendre en compte un certain nombre d'informations en
provenance des capteurs proprioceptifs : état, odomètrie, fins de
course, mesures de température, de courant, ...</p>

<p>Un train de véhicules est constitué d'un véhicule de tête piloté
par un conducteur humain alors que les autres véhicules sont
automatisés, à savoir que chacun d'eux suit celui qui le précède. Ainsi
le premier véhicule est suivi par le deuxième qui à son tour est suivi
par le troisième ... C'est donc une procession de véhicules. Ce type
d'automatisation a été pensé pour les conduites sur autoroute ou dans
les périphériques. Ce procédé a l'avantage de maximiser la vitesse des
véhicules ainsi que leur nombre tout en minimisant les accidents.</p>

SUBSECTION(ICON_GEAR[]Cyber Cabi,cycab)
<p>Il existe différents types de CyCab.  Celui utilisé a les caractéristiques suivantes :</p>
<ul>
<li> longueur : 1,90 m.</li>
<li> largeur : 1,20 m.</li>
<li> poids total avec batteries : 300 kg.</li>
<li> 4 roues motrices et directrices.</li>
<li> vitesse théorique maximale : 20 km/h.</li>
<li> autonomie : 2 heures d'utilisation continue.</li>
<li> capacité d'accueil : 2 personnes.</li>
<li> conduite manuelle ou automatique.</li>
</ul>

<p>La figure suivante montre une vue en coupe de
l'architecture du CyCab qui est constituée de :</p>

TABLEAU(2,PICTURE(cycab/cycab.gif,Vue en coupe d'un CyCab),
PICTURE(cycab/noeud.jpg,Noeud avant d'un CyCab))

<ol>
<li>Un ensemble de batteries avec un gestionnaire automatique de
  charge et un bouton arrêt d'urgence qui est soit de type poussoir
  soit de type radiocommandé.</li>
<li>Deux cartes électroniques et d'acquisition de données comprenant
  chacune un microprocesseur 32 bit Power PC (appelés MPC555). Chaque
  carte permet de contrôler 2 roues du CyCab (motricité et
  direction). Elles sont placées à l'avant et à l'arrière sous la
  coque.</li>
<li>Un PC embarqué, placé sous le siège du passager, possédant depuis
  ce stage, un processeur Intel cadencé à 3 GHz, avec un Linux temps
  réel, RTAI. L'ensemble est alimenté par une tension d'entrée de -48V
  (350W) et non de 220V. Un écran, un clavier et une souris sont
  reliés au PC.</li>
<li>Deux bus CAN indépendants~: le bus CAN 0 permet la communication
  entre les 2 MPC555 et le PC embarqué, alors que le bus CAN 1 permet
  d'ajouter d'éventuels futurs composants électronique.</li>
<li> 4 moteurs et leurs freins électriques et contrôlés par quatre
  contrôleurs de moteur appelés Curtis PMC 1227 servant
  d'amplificateurs de puissance pour contrôler la vitesse des
  roues. La consigne de vitesse est donnée par une tension de 0 à 5V
  aux Curtis qui fourniront des signaux PWM adéquats aux moteurs. Les
  Curtis protègent les noeuds des contre-courants des moteurs, quand
  par exemple, on les arrête brusquement.</li>
<li>Quatre décodeurs incrémentaux donnant la vitesse des roues</li>
<li>Deux vérins de direction électriques alimentés par un signal PWM
  faisant pivoter les quatre roues.</li>
<li>Un encodeur absolu avec sortie SPI et donnant l'angle des
  roues.</li>
<li>Un joystick de direction fournissant deux courants indiquant : --
  la consigne de vitesse des roues, -- la consigne de direction des
  quatre roues.</li>
<li>Pour cette étude, le CyCab possède une caméra
  EXTLINK(http://www.macway.com/fr/product/1167/camera-firewire-unibrain-fire-i-mac.html,FireI)
  se branchant sur un port FireWire du PC embarqué.</li>
</ol>

<p>Le logiciel SynDEx va distribuer le programme de conduite sur les 2
noeuds et sur le PC embarqué qui communiqueront grâce au bus CAN 0.
Le passager du CyCab peut communiquer avec le PC embarqué
(clavier/souris/écran, USB, FireWire, Ethernet, CAN 1) mais n'a accès
aux deux noeuds que par l'intermédiaire du bus CAN 1.</p>

<p>Le système d'exploitation du PC est un Linux (distribution est une
Debian 4.0). Le noyau 2.6.18-52 a été patché pour le temps réel avec
RTAI 3.4 puis recompilé.</p>

<p>Linux a un noyau
EXTLINK(http://en.wikipedia.org/wiki/Monolithic_kernel,monolithique). Sa
mémoire est divisée entre l'espace utilisateur et l'espace
noyau. L'espace utilisateur désigne la région mémoire dédiée aux
applications, à l'exclusion du noyau lui-même, qui fonctionne dans son
propre espace mémoire. L'espace noyau est l'endroit où le code réel du
noyau réside après son chargement, et où la mémoire est allouée pour
les opérations qui prennent place à son niveau.</p>

<p>Après l'application du patch pour le temps réel, on distingue deux
nouvelles partitions : un espace utilisateur fonctionnant avec le
temps réel appelé LXRT et un espace noyau fonctionnant avec le temps
réel appelé RTAI. Ces différentes se distinguent de par l'utilisation
des différents schedulers utilisés et les espaces mémoire
utilisés.</p>

<p>Une partie du programme de conduite (manuel ou automatique) va
tourner sous forme de module RTAI servant essentiellement de timer 10
ms aux deux noeuds MPC (c'est assez étrange comme façon de faire). Le
processus LXRT va gérer les images de la caméra, appliquer le
traitement de l'image et communiquer avec RTAI via une mémoire
partagée. Un processus Linux (non temps réel) peut observer le flot de
données pour, par exemple, pouvoir les faire rejouer en simulation (en
effet, à ce moment là, le sondes CAN n'étaient pas encore
fonctionnelles).</p>

<p>Le programme de conduite s'exécute sur les deux noeuds. Il lit les
données fournies par les capteurs (direction des roues, vitesse des
roues, ...).  Il calcule la régulation et puis envoie le résultat aux
différents actuateurs gérant les quatre roues du CyCab (traction et
direction). La communication se fait soit par sortie série SPI, soit
par lecture analogique ou optique.</p>

SECTION(Travail effectué,travail)

SUBSECTION(ICON_EYES[]Principe,principe)

<p>Le but du stage est de modifier un programme de conduite manuelle
   d'un CyCab pour obtenir un programme de conduite autonomme afin de
   faire du suivi longitudinal de CyCab. Le joystick est alors
   ITALIQUE(déconecté) de l'application. On utilise à la place une
   caméra bas coût.</p>

<p>Les figures suivantes expliquent le principe du suivi longitudinal
   entre deux CyCab. Nous souhaitons stabiliser le CyCab suiveur
   autour d'une distance STRONG(d) fixée à l'avance par rapport au
   CyCab de tête et quelque soit la vitesse de ce dernier. Vu que le
   seul capteur que nous possédons est une caméra, la vitesse du CyCab
   de tête est à priori inconnue. Nous la voyons comme une
   perturbation à rejeter.</p>

<p>Comme il n'est pas facile d'estimer la distance STRONG(d) à partir
   d'une image, nous allons plutôt utiliser la hauteur STRONG(h) du
   CyCab sur l'image, comme observation. En effet, il est plus aisé de
   compter le nombre de pixel sur une image plutôt que de calculer la
   distance correspondante. On peut approximer la hauteur du Cycab
   comme valant proportionnellement à l'inverse de la distance.</p>

TABLEAU(3,CAPTION(cycab/suivi.jpg), CAPTION(cycab/petit.jpg),CAPTION(cycab/grand.jpg))
CENTER(Cliquez sur les images pour les agrandir.)

<p>Le rapport rentrera plus en détail sur l'algorithme utilisé. Pour
   résumer en voici ses principaux axes :</p>

 LISTE(Il utilise un filtre de Sobel pour déterminer les contours du
   CyCab.,

   On utilise deux couleurs (rouge et bleu) pour mieux distinguer les
   contours entre eux.,

   Au démarrage de l'application, on place les CyCabs à la distance
   voulue et l'utilisateur sélectionne deux contours intéressants
   définissant STRONG(h barre) la hauteur de consigne.,

   Un filtre de Kalman permet de prévoir la position des contours
   sélectionnés sur l'image suivante.,

   L'erreur de hauteur STRONG(h) entre les contours observés et la
   hauteur de consigne STRONG(h barre) donne une consigne de vitesse
   au CyCab suiveur.,

   Cette consigne de vitesse correspond à la plage de valeur
   analogique utilisée pour le joystick dans l'application de conduite
   manuelle. Une consigne de vitesse max. correspond à un humain qui
   déplacerait le joystick à son niveau max.,

   La conduite manuelle n'est pas particulièrement
   agréable. L'accélération est beaucoup trop brusque et trop forte
   lorsqu'on touche à peine le joystick et que le CyCab a une vitesse
   faible (démarrage). Au final[,] la conduite avance par à coup car
   elle surprend le conducteur. Ces accélérations font mal au dos du
   conducteur car ce dernier est pas mal solicité.)


TABLEAU(2,CAPTION(cycab/exp1.jpg),CAPTION(cycab/exp1_1.jpg),CAPTION(cycab/exp2.jpg),CAPTION(cycab/exp2_2.jpg))
CENTER(Suivi des contours grâce à Kalman.)

SUBSECTION(ICON_READ[]Résumé,resume)
<p>Du à des problèmes de casse des cartes électroniques, je n'ai pu
  tester mon suivi que les deux derniers jours de mon stage ;0( Pour un
  premier test, les résultats obtenus ont été plus
  qu'honorables. Malheureusement des problèmes restent à corriger :</p>

LISTE(Le traitement de l'image reste assez lourd et est géré que par
      le CPU. Je n'ai pas pu le faire traiter par la carte graphique
      (utilisation d'OpenGL et des pixel shader) vu que le premier PC
      du CyCab n'avait pas de carte graphique., La conduite
      automatique est dangereuse car le filtre de Kalman peut perdre
      l'observation des raies à cause d'un élément parasite de
      l'environnement. Un nouveau modèle plus robuste de déplacement
      des contours a été écrit mais n'a pu être testé (manque de
      temps)., Ce programme est encore à l'état de prototype car la
      chaîne de génération automatique du code à partir de SCICOS n'a
      pas encore été mise en place[,] mais peut facilement être mise en place.)

<p>J'ai quand même pu explorer les domaines suivants :</p>
LISTE(STRONG(La rétro-ingénierie :)
     LISTE(En espionnant les états du CyCab.,
          En traduisant l'application de conduite manuelle SynDEx vers Scicos et où j'ai été
          confronté à des problèmes des erreurs entre les signaux observés et simulés dus à des
          problèmes d'arrondis.,
          En traduisant des morceaux de code assembleur en langage Scilab/Scicos.))

LISTE(STRONG(L'électronique :)
      LISTE(En dichotomisant les noeuds MPC afin d'isoler le problème des pannes des cartes.,
            En faisant de la maintenance électronique (pannes à détecter[,] fils à ressouder ... ),
            En espionnant la circulation des données temps réel sur un bus CAN.,
            En choisissant et remplaçant les cartes du PC embarqué.))

LISTE(STRONG(Le traitement d'images :)
      LISTE(En récupérant les images d'une caméra FireWire.,
            En lisant des documents sur le traitement de l'image.,
            En appliquant des filtres de traitement d'images simples comme Sobel[[,]] Laplace ...
            En faisant une IHM pour visualiser/débuger le traitement de l'image servant à l'estimation de distance entre les véhicules.))

LISTE(STRONG(L'automatique :)
      LISTE(En déterminant le régulateur de suivi de véhicules.,
            En appliquant le filtrage de Kalman au suivi de contours.))

LISTE(STRONG(La programmation :)
      LISTE(En découvrant le Linux temps réel RTAI (installation, configuration et l'utilisation).,
            En approfondissant ma connaissance du noyau et des modules Linux.,
            En découvrant la bibliothèque Xlib.,
            En apprenant à me servir des logiciels Scilab[,] Scicos et SynDEx.))


SUBSECTION(Pages suivntes,tdm)

LISTE(MYLINK(stages_presentation,INRIA Rocquencourt),
MYLINK(stages_travail1,Mon premier stage),
MYLINK(stages_download,Download))

divert(DIVERT_FOOTER_CODE)

END_BODY(stages_travail1,Stage 1,stages_download,Téléchargement)
