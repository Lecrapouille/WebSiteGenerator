dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

dnl ICON_UPDATED STRONG(Page en cours de rédaction).

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,Objectif du projet,#intro,
Principe de déplacement de la plateforme,#deplac,
Contraintes du projet,#contraintes,
Avancement du projet,#historique,
Table des matières,#tdm),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Présentation du projet,intro)
SUBSECTION(Objectif)
<p>Ce document présente la réalisation d'un modèle réduit
   d'hélicoptère à quatre rotors et son banc d'essai
   électromécanique. Ce travail a débuté en 2006 dans le cadre d'un
   projet de fin d'étude de l'EPITA en spécialisation temps réel
  (GISTR) est toujours en cours de réalisation (aprés une longue pause
   d'au moins 6 mois) .</p>

<p>Les caractéristiques principales de mon hélicoptère sont les
   suivantes. Il est constitué d'une croix de 20 cm de long en fibre
   de carbone assemblée au moyen d'une pièce en aluminium façonnée à
   la main<!-- dans une plaque de ce métal-->. Quatre moteurs
   électriques à courant continu avec collecteur sont attachés sur la
   croix de fibre de carbone par des attaches en aluminium (façonnées,
   elles aussi, à la main). <!-- Dans chacun des tubes creux en
   carbone sont insérées des pattes en laiton sur lesquelles peut
   reposer l'hélicoptère--> Sur la croix est attachée une carte
   électronique contenant les capteurs inertiels servant à la
   stabilisation de l'appareil : trois gyroscopes un axe, un
   accéléromètre deux axes, un capteur de proximité out ou rien
   commutant à une quarantaine de centimètre d'un obstacle.</p>

LOWPICTURE(helico/photos/h4hpattes,Carcasse de l'hélicoptère)

<!-- <p>L'électronique de puissance, l'électronique de commande et la
   source d'énergie ne sont pas, pour l'instant,
   embarquées. L'alimentation électrique est assurée par une
   alimentation de PC standard 12V, suivie d'un régulateur, qu'il a
   fallu réaliser, fournissant du 5V et du 8.5V avec une intensité
   maximale de 5A. L'électronique de puissance consiste en quatre
   MOSFET commandés par des entrées PWM. L'électronique de commande
   consiste en deux microcontrôleurs PIC 16F876 de MICROCHIP reliés
   entre eux par un bus I2 C connectés à un PC standard par un bus
   série. Ces deux microcontrôleurs font l'acquisition des données et
   envoient au MOSFET les commandes PWM calculées par le PC. La
   stabilisation est calculée par le PC avec des logiciels de hauts
   niveaux SCILAB-SCICOS qui sont les analogues libres du couple
   Matlab-Simulink. Pour tester la stabilisation de l'appareil, un
   banc d'essai, réalisé en Lego, permet de maintenir et de limiter
   les mouvements de l'hélicoptère en lui laissant un nombre limité de
   degrés de liberté.</p> -->

<p>La construction de l'hélicoptère fait appel à plusieurs spécialités
   de l'ingénierie à savoir :
   LINK(helico_mecanique-LANG.html,construction mécanique),
   LINK(helico_electronique-LANG.html,électronique),
   LINK(helico_logiciel-LANG.html,informatique),
   LINK(helico_asservissement-LANG.html,automatique). Chacun de ces
   aspects sera discuté plus en détail dans la suite de ce
   document.</p>

<p>Des helicoptères similaires sont commercialisés sous les noms de
   Draganflyer, Engager, X-UFO, Microdrones. Il existe également des
   projets réalisés par des étudiants dans le cadre de leurs études
   (comme l'école de Lausanne) ou par des modelistes comme le
   MIKROKOPTER ou l'UAVPL (voir la
   LINK(helico_biblio-LANG.html#xufo,bibliographie)).</p>

TABLEAU(3,
CAPTION(helico/xufo.jpg),
CAPTION(helico/engager.gif),
CAPTION(helico/draganflyer.jpg),
Le site du X_UFO,
Le site du ENGAGER,
Le site du DRAGANFLYER)

<p>En général ces hélicoptères sont radio-commandés ce qui ajoute la
  difficulté de la réalisation de la radio commande mais qui simplifie
  la stabilisation puisque l'opérateur est capable d'observer et de
  compenser les dérives des gyroscopes. En général ces hélicoptères
  possèdent deux moteurs tournant dans un sens et deux autres tournant
  dans l'autre afin de stabiliser le lacet du à la rotation des
  moteurs. Parfois, sur des modèles de petites tailles, pour éviter
  l'inversion du sens de rotation des moteurs, qui implique
  l'utilisation d'hélices propulsives difficiles à trouver, les
  moteurs sont inclinés de façon à créer une poussée compensant le
  lacet.  Voir le JOSEJ. Nous adopterons ce point de vue faute d'avoir
  pu trouver des hélices propulsives de petites tailles adaptées aux
  moteurs choisis.</p>

SUBSECTION(Principe de déplacement de la plateforme,deplac)
<p>Allez voir CRACMIKE. Puis cliquez sur 'Comment ca marche'.</p>

SUBSECTION(Contraintes du projet,contraintes)

<p>STRONG(Déplacement.) Dans un premier temps, la plate-forme devra
  rester stationnaire à 40 cm du sol.</p>

<p>STRONG(Contraintes de dimension et de poids de l'hélicoptère.) La
   plate-forme se veut être de dimension et de poids les plus réduits
   possible (envergure inférieure a 20 cm, poids en dessous des 200
   g). On a choisi de ne pas utiliser de cartes d'acquisitions du
   commerce à cause de leur poids et de leur prix. L'acquisition des
   données est réalisée par deux microcontrôleur dsPIC. Actuelement, à
   cause de son poids, la carte électronique n'est pas prevue d'être
   embarquée sur la plate-forme.</p>

<p>STRONG(Robustesse à son environnement.) L'appareil est prévu pour
   fonctionner en intérieur, avec un minimum de perturbation
   atmosphérique.</p>

<p>STRONG(Communication avec un ordinateur non embarqué.)
   L'hélicoptère communique avec un ordinateur non embarqué au moyen
   d'un port série. Le microcontrôleur envoie les données de la
   centrale inertielle à l'ordinateur. Ce dernier fait les calculs
   flottants de stabilisation et les communique au microcontrôleur
   embarqué.</p>

<p>STRONG(Source d'énergie.) L'hélicoptère ne dispose pas de batterie,
   il est alimenté par une source d'énergie au sol au moyen de fils
   électriques. Ce qui permet une économie de poids importante et une
   autonomie infinie, mais qui implique l'existence des fils reliant
   l'hélicoptère au sol, pouvant le déstabiliser. L'embarquement de la
   source d'énergie électrique pose en effet un gros problème, car les
   plus petits moteurs consommant de l'ordre de 10W chacun l'autonomie
   est souvent très réduite. Certains modèles du commerce peuvent
   avoir une autonomie de quelques minutes seulement.</p>

SUBSECTION(Avancement du projet,historique)

<p>STRONG(Juillet -- Décembre 2006.) Le projet de fin d'études EPITA
   s'est terminé avec un embryon d'hélicoptère à deux rotors qui ne
   pouvait pas se soulever (carcasse trop lourde pour les 2
   moteurs). Un problème dans la communication I2C entre les deux PIC
   16F876A empêchait l'utilisation des quatre moteurs.</p>

<p>STRONG(Octobre 2007.) Après un longue pause. Cette date marque la
   timide reprise du projet. Une nouvelle version de la carte
   électronique à base de dsPIC a été réalisée. Une chaîne de logiciel
   est entrain de se mettre en place pour permettre un développement
   plus aisé du firmwire et du hardware de l'hélicoptère. On peut
   citer les logiciels MYLINK(tuto_scicos,Scilab/Scicos),
   MYLINK(tuto_syndex,SynDEx), PROTEUS et MPLAB. Une bibliothèque en
   langage C pour dsPIC30F avec SynDEx est en cours d'écriture.</p>

<p>STRONG(Janvier 2008.) L'utilisation du logiciel Proteus a permis de
  trouver des problèmes dans la conception dans la carte
  électronique. La génération automatique de code a bien avancée :
  grâce à SynDEx et à la bibliothèque en langage C pour dsPIC30F, il
  est presque possible à partir de Scicos de générer automatiquement
  un calcul distribué sur l'architecture de l'hélicoptère.  Il reste
  cependant à développer pas mal de code pour gérer les périphériques
  du dsPIC. A suivre donc ;o)</p>

<p>STRONG(Avril 2008.) Bientôt la reprise des tests sur balancoire !
  Pour l'instant le dsPIC et Scicos communiquent à 50Hz. Les valeurs
  analogiques brutes sont envoyées par le dsPIC et l'ordinateur les
  affiche. Les PWM semblent aussi marcher. A suivre : remettre à jour
  les blocs diagrammes Scicos de la régulation. Pour l'instant la
  génération de code avec SynDEx ne donnera pas de bons résultats. Son
  developpement est suspendu en attendant la sortie d'une premiere version
  fonctionnelle (codé à la main) du soft.</p>

  <!-- : de par son fonctionnement, SynDEx génère un code dont les
  threads de communication et de calculs sont synchronisées et
  s'attendent. Il y a donc un problème gênants sur la vitesse du
  traitement des données qui sera limitée par la vitesse du port série
  (même si ce dernier est uniquement utilisé pour rafraîchir les
  consignes de pilotage et donc n'est en principe pas bloquant).-->

<p>STRONG(Juin 2008.) Le projet n'a pas trop avancé par manque de
   temps. Les signaux PWM de l'interface de puissance sont plus
   propres : ils sont moins déformés et donc les moteurs semblent
   tourner plus fort. Un problème de retard pur sur la vitesse de
   commutation d'un transistor a été minimisé (à défaut d'être
   supprimé par manque de connaissance sur ce sujet). Ceci peut
   minimiser un comportement non linéaire entre le rapport cyclique du
   PWM et le courant induit du moteur qui a été détecté lors de la
   première version du prototype. Le protocole de communication entre
   l'ordinateur et les dsPIC a été en partie débogué. Un problème
   majeur (côté Linux ?) reste non résolu : les réceptions sont
   ralenties lorsque les transmissions sont activées. Ce comportement
   est en cours de débugage. Un gestionnaire d'historique des bugs du
   système a été ajouté : toutes les erreurs et les codes de retours
   des fonctions les plus importantes sont stockés ainsi que la date
   d'apparition. Ceci est bien utile pour le déboguage (par exemple
   aprés un break point). Il fonctionne à la fois pour le dsPIC et
   Linux.</p>

<p>STRONG(Début août 2008.) Cette date marque les premiers essais
   concluants de la régulation de l'hélicoptère en mode balançoire
   grâce au PC (note: on est donc au même point d'avancement qu'en
   décembre 2006 sauf que les différentes parties sont plus
   abouties). Avant cela, le soft de l'hélicoptère souffrait encore de
   nombreux bugs. Vu qu'il n'existait pas de tests rigoureux sur le
   code, il a donc été décidé de mettre en place et une bonne fois
   pour toute des procédures de test unitaires (et tracées par des
   documents PDF) afin d'aider à prouver le bon fonctionnement du soft
   et de détecter des problèmes de régression du code. Par conséquent,
   le problème de ralentissement de l'automate de communication (voir
   Juin 2008) a été corrigé. Son code a été simplifié et n'entraine
   plus de retard dans les échanges de messages. Les communications
   entre PC et dsPIC sont temps réelles à 20 ms (50 Hz). L'automate
   est suffisament générique pour intégrer des protocoles comme le SPI
   sans modifier une seule ligne de code. Le module SPI pour dsPIC est
   en cours de d'écriture. Il va permettre de faire communiquer les
   deux axes de la plate-forme. Le premier filtre numérique sur 16
   bits a été écrit pour le dsPIC. Les premiers tests sont
   concluants. D'ici la fin du mois d'août la boucle de régulation du
   courant dans les moteurs va être intégrée dans les dsPIC.  Enfin,
   contrairement à ce qu'il a été espéré la boucle de régulation du
   courant dans les moteurs ne se fera plus à 1 KHz mais à 300
   Hz. Cette ITALIQUE(régression) est due aux balais du moteur à
   courant continu qui font apparaitre des oscillations de 300
   Hz qui correspondent à la rotation du moteur 20 Ktours/min.</p>

<p>STRONG(Début Septembre 2008.) Bon avancement du projet : la
   régulation de l'angle de la balançoire ainsi que les courants des
   moteurs est maintenant faite par le dsPIC sans l'aide du PC. Un
   bootloader a été ajouté afin que l'utilisateur puisse, depuis le
   PC, envoyer les gains des différents régulateurs PID ainsi que
   d'autres paramètres. Ceci permet de ne pas à avoir à reprogrammer
   et flasher le dsPIC à chaque modification. Le bootloader fournit
   une option pour choisir si le PC intervient ou pas dans l'un des
   calculs de régulation (courant moteur, assiette, ...) ou s'il doit
   uniquement envoyer les consignes d'angles et de puissance du
   moteur.</p>

<p>STRONG(Mi Septembre 2008.) La régulation autonome de la balançoire
  étant fonctionnelle, la balançoire s'est vue greffée un deuxième axe
  contrôlé par un deuxième dsPIC (en mode esclave). Nous avons donc
  (enfin !), une plate-forme à quatre rotors. La carcasse est
  maintenant suspendue à un fil au lieu d'être attachée par des
  briques en LEGO. Le bootloader a été modifié afin de faire
  communiquer le dsPIC esclave avec PC via le dsPIC maître (qui gère
  les communications SPI et UART). Le régulateur va être mis à jour
  afin de réguler les deux axes et le lacet. La carcasse pourra se
  soulever après changement de la tension des moteurs (qui passera de 5V
  à 8V).</p>

SUBSECTION(Table des matières,tdm)

<p>Pour plus de facilité, l'étude détaillée de la construction de cet hélicopère a été
  répartie sur plusieurs pages html:</p>
LISTE(MYLINK(helico_etapes,Etapes de la construction),
MYLINK(helico_mecanique,Construction de la carcasse),
MYLINK(helico_electronique,Construction de la carte électronique),
MYLINK(helico_logiciel,Partie logicielle),dnl Génération automatique de code),
MYLINK(helico_asservissement,Asservissement de l'hélicoptère),
MYLINK(helico_download,Téléchargement),
MYLINK(helico_biblio,Bibliographie),
MYLINK(tuto_scicos,Présentation du logiciel de modélisation et de simulation Scilab/Scicos),
MYLINK(tuto_syndex,Présentation du logiciel de SynDEx),
MYLINK(comm_rs232,Introduction au port série (RS232)),
MYLINK(helico_photos,Photos et vidéos.))

<p>Cette table des matières est également accessible depuis le menu
  gauche (couleur bleue). Les liens en bas de page permettent
  d'accéder à la page suivante ainsi qu'à la page précédente.</p>

dnl <p>Certaines de ces pages se réfèrent à certains logiciels, protocoles ou notions
dnl présentés sur ce site :</p>

dnl LISTE(MYLINK(tuto_scicos,Le logiciel Scilab/Scicos),
dnl MYLINK(tuto_syndex,Le logiciel SynDEx), MYLINK(comm_rs232,Le protocole
dnl RS232).)

divert(DIVERT_FOOTER_CODE)

END_BODY(,,helico_etapes,Etapes de la construction)
