dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

dnl ICON_UPDATED STRONG(Page en cours de rédaction).

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,
Rappel du cahier des charges,#cdc,
Download du schéma de la carte électronique,#schema,
Explication des différents capteurs et des fonctionnalités de la carte,#expl,
L'altimètre infrarouge,#alti,
L'accéléromètre deux axes,#acc,
Les gyroscopes un axe,#gyro,
L'électronique de puissance,#puis,
Détermination de la bonne fréquence du PWM,#freq),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Partie électronique à coeur (ds)PIC,partie_electro)

SUBSECTION(Contexte)

<p>Ce document explique le fonctionnement de la carte électronique de
   l'hélicoptère. La première version utilisait un unique
   microcontrôleur PIC16F876A qui contrôlait deux moteurs. La deuxième
   version qui utilisait deux PIC16F876A pour gérer les quatre moteurs
   n'a jamais été complètement déboguée. La troisième version,
   présentée ici, est basée sur deux dsPIC30F2010 et corrige quelques
   erreurs. Cette carte est en cours de validation. Pour l'instant, on
   ne présente que les simulations obtenues grâce au logiciel
   PROTEUS.</p>

<p>Cette page est organisée de la façon suivante:</p>
LISTE(LINK(#cdc,Rappel du cahier des charges),
LINK(#schema,Schéma de la carte électronique),
LINK(#alti,Altimètre infrarouge),
LINK(#acc,Accéléromètre deux axes),
LINK(#gyro,Gyroscopes un axe),
LINK(#puis,Electronique de puissance),
LINK(#freq,Détermination de la fréquence des sorties PWM))

SUBSECTION(Rappel du cahier des charges,cdc)

<p>Au minimum, grâce à ses deux dsPIC, l'électronique de l'hélicoptère doit gérer :</p>
LISTE(Une entrée numérique pour l'observation de l'altitude de la carcasse.,

    Neuf entrées analogiques :
    LISTE(Les quatre courants circulant dans les moteurs.,

          Les trois vitesses angulaires données par les gyroscopes (roulis,
          tangage, lacet).,

          Les deux accélérations permettant l'estimation de
          la verticale par exemple lorsque le véhicule est au repos.),

  Quatre sorties PWM (Pulse Width Modulation) commandant les moteurs
  grâce à une interface de puissance.,

  Un port de communication avec l'ordinateur au sol pour le déboguage[,]
  la communication des consignes de vol[,] le data logging[,]...,

  Des sorties dites ITALIQUE(discrètes) pour afficher certaines
  informations avec des LED.)


<p>Les microcontrôleurs de MICROCHIP ont été choisis à cause de leur
  popularité, de leurs prix, de leurs disponibilités, de la
  documentation disponible
  (BIGONOFF et LINUXMAG) et de la distribution gratuite des logiciels
  (PC et Linux) pour les programmer et les déboguer (JDM).</p>

<p>Pour la première version de la carte on a choisi le PIC 16F876A
   plutôt qu'un dsPIC. En effet, étant novice dans ce domaine, ce
   choix s'imposait (quitte à devoir réécrire plus tard les programmes
   pour le dsPIC et bien qu'il faille programmer ce PIC en assembleur)
   car l'excellent cours de Bigonoff était une aide précieuse pour la
   compréhension de l'architecture des processeurs Microchip en
   commençant par les plus simples d'entre eux. En effet pour le
   dsPIC, on ne dispose que de la documentation du constructeur
   (EXTLINK(http://ww1.microchip.com/downloads/en/DeviceDoc/70046E.pdf,Family
   Reference), Programmer's Reference, datasheet, ...), qui bien que
   très riche, est beaucoup moins pédagogique que le cours de
   Bigonoff.  On a choisi le 16F876A au lieu du 16F877 pour son
   meilleur compromis puissance/poids-nombre de pattes. Le 16F877 est
   beaucoup plus lourd et comporte 40 pattes (voir plus) contre 28
   pour 16F876.</p>

LOWPICTURE(helico/photos/electronik,Electronique gérant 1 axe de l'hélicoptère.)

<p>Pour la dernière version de la carte, on utilisera deux
   dsPIC30F2010 car, en plus du très grand nombre d'entrées/sorties
   disponibles, ils disposent d'un multiplieur intégré (DSP)
   permettant de mettre en oeuvre plus facilement les contrôleurs et
   les filtres nécessaires. L'utilisation de deux petits dsPIC plutôt
   qu'un gros permettra de paralléliser l'exécution du programme
   (grâce au logiciel SYNDEX) et de s'initier aux protocoles de
   communications classiques (USART, SPI, I2C, CAN). De plus le nombre
   réduit des pattes (28) de ce processeur allège le poids de la carte
   électronique.</p>

<p>Le logiciel PROTEUS sera utilisé pour vérifier en simulation les
   filtres analogiques et l'électronique de puissance. Cependant, dans
   la version actuelle (7.2) il ne permet pas de simuler le
   fonctionnement des dsPIC (les gammes en dessous oui).</p>


<!-- <p>On notera que les dsPIC peuvent être programmés en langage C. On
   utilisera alors l'IDE MPLAB de Microchip pour Windows et le
   compilateur C30LINK qui est un gcc modifié. Comme gcc est sous
   licence GPL, il est possible de recompiler les sources de C30 pour
   l'utiliser sous Linux et Macintosh. Dans un premier temps, on fera
   confiance sur la qualité de l'assembleur généré par ce compilateur
   pour passer ensuite à l'écriture en assembleur.</p>

<p>Enfin, notons qu'il existe une librairie Microchip 16BPERIPH qui
   permet de gérer les périphériques (USART, PWM, timer, ...). Elle
   est assez peu fournie, donc on ne l'utilisera pas.</p> -->

SUBSECTION(Schéma de la carte électronique,schema)

<p>La dernière version du schéma électronique n'est pas encore
   disponible en téléchargement. Les parties de la carte validées en
   simulation sont données dans cette page. En attendant, le schéma de
   la deuxième version (à base de PIC16F) est toujours téléchargeable
   au format PDF, PNG ou EAGLE.</p>

<p>STRONG(ATTENTION : N'étant pas électronicien de formation[,] il est
   probable que ces schémas ne soient pas optimaux voir peuvent
   contenir des bugs aberrants ! Ils ne sont donnés qu'à titre
   indicatif.)</p>

TABLEAU(3,LINK(helico/schemas/h4h_schematic.pdf,Schéma au format PDF),
LINK(helico/schemas/h4h_schematic.png,Schéma au format PNG),
LINK(helico/schemas/h4h_schematic.sch,Schéma au format SCH),
ICON_PDF,ICON_TGZ,ICON_TGZ,400Ko,200Ko,250Ko)


SECTION(Explication des différents capteurs et des fonctionnalités de la carte,expl)
SUBSECTION(L'altimètre infrarouge,alti)

<p>L'altimètre infrarouge
   EXTLINK(http://info.hobbyengineering.com/specs/SHARP-gp2y0d340_j.pdf,GP2Y0D340)
   est le plus simple et le moins cher des capteurs de distance infra rouge. Il commute
   de 0 à 1 en présence d'un obstacle à moins de 40 cm. Il se
   branche sur une patte numérique du PIC. Après un test très rapide,
   la distance de commutation semble dépendre de la couleur de
   l'obstacle. Le capteur est dirigé vers le haut de l'hélicoptère (et
   non vers le bas) afin qu'un utilisateur puisse contrôler l'altitude
   de la plate-forme en présentant au dessus une cible à suivre à une distance
   voulue.</p>

PICTURE(helico/schemas/GP2Y0D340.jpg,Le capteur GP2Y0D340.)

SUBSECTION(L'accéléromètre deux axes,acc)

<p>Un accéléromètre deux axes
  EXTLINK(http://www.analog.com/UploadedFiles/Data_Sheets/ADXL320.pdf,ADXL320)
  placé horizontalement au centre de gravité (supposé immobile) de
  l'hélicoptère, permet de détecter la verticale. C'est le capteur le
  plus important dans la phase d'essai où le centre de gravité de
  l'hélicoptère sur son banc d'essai est maintenu immobile (cas de la
  balançoire). Un unique accéléromètre 5G de AnalogDevice est alors
  suffisant pour stabiliser l'hélicoptère.  Malheureusement, les
  accéléromètres bons marchés sont disponibles dans des boîtiers
  petites tailles (4 mm x 4 mm) et sont donc très difficiles à souder à la
  main sur une carte époxy standard (le ITALIQUE(truc) consiste à
  faire un gros pâté de soudure sur l'accéléromètre et les fils, puis
  d'éliminer progressivement l'excès de soudure avec la pane du fer à
  souder).</p>

LOWPICTURE(helico/photos/accelero,Zoom sur une soudure faite à la main.)


<p>Le traitement des données de l'accéléromètre se décompose en deux étapes : -
  Recentrage et normalisation du signal, - Filtrage anti-repliement de
  spectre.</p>

<p>STRONG(Etape 1 : Recentrage et normalisation du signal.)
   L'accéléromètre choisi donne un signal utile compris entre +1.3V (à
   l'horizontale) et +1.7V (à 90 degrés) qui doit donc être recentré
   et normalisé entre 0V et +5V afin d'obtenir une précision maximale
   après la conversion analogique numérique sur le dsPIC. Pour cela,
   on doit déterminer G et r solution du système linéaire suivant
   :</p> LISTE(G(1.3 - r) = 0, G(1.7 - r) = 5,)

<p>où G est le gain et r la tension de référence. On trouve G = 12.5
   et r = 1.3. On utilisera un AOP en montage soustracteur. On en
   déduit G = R5 / R1 (= R4 / R2) et Vref = r. Vacc étant la sortie de
   l'accéléromètre.</p>

TABLE(2,LOWPICTURE(helico/schemas/filtre_aop/accelero_aop1,AOP en
montage
soustracteur.),LOWPICTURE(helico/schemas/filtre_aop/accelero_plot1,Simulation
sous Proteus.))

<p>L'AOP utilisé est un LM324. Afin de faire un montage simple ayant
  une alimentation 5V unique, l'AOP LM324 sera alimenté en 0/+5V
  (alimentation non symétrique) il sature alors à 4V. On réduit alors
  le gain G à 10 au lieu de 12.5 afin d'éviter la saturation à 4V (ce
  qui était le cas avec les anciennes versions des cartes). Vref vaut
  toujours 1.3V.</p>

<p>STRONG(Etape 2 : Filtre des signaux d'attitude.) La fréquence
   de coupure des signaux d'attitude de l'hélicoptère est fixé à 25
   Hz. Ce choix est lié aux limitations de la vitesse d'acquisition de
   l'ordinateur au sol d'une part. D'autre part
   cette fréquence est de l'ordre de grandeur de celle utilisée en radio-commande
   pour le modélisme.
   Ces signaux devront donc être échantillonnés
   à au moins 50 Hz pour ne pas perdre de l'information. Nous
   échantillonnerons en fait tous les signaux à 1 kHz pour pouvoir
   réguler suffisamment rapidement le courant passant dans le moteur.
   Rappelons qu'un signal échantillonné à 5O Hz doit être filtré
   au préalable à 25 Hz afin d'éviter l'apparition de signaux
   parasites (repliement de spectre).
   Nous utilisons un filtre analogique d'ordre 2 à 25 Hz.
   Le signal acquis à 1 kHz sera filtré à l'ordre 2 à 25 Hz à
   l'intérieur du dsPIC. Finalement les signaux d'attitude seront
   filtrés à l'ordre 4 à 25 Hz.</p>

TABLE(2,LOWPICTURE(helico/schemas/filtre_aop/accelero_aop2,Filtre
passe-bas d'ordre
deux.),LOWPICTURE(helico/schemas/filtre_aop/accelero_bode,Diagramme de
Bode du gain sous Proteus.))

<p>Sur le schéma de gauche, nous retrouvons l'AOP en montage
  soustracteur (avec R1, R2, R4 et R5). Nous lui avons ajouté R3 et R6
  sous forme de pont diviseur de tension pour que Vref soit à 1.3V.
  Notons que nous utilisons cet AOP aussi pour filtrer à l'ordre 2 le signal
  grâce aux condensateurs C1, C2 et C3.</p>

<p>Comme l'accéléromètre a une résistance interne de 32K&Omega;
   (voir le datasheet) (R1,C1) réalise filtre passe-bas du
   premier ordre. C2 et C3 dans la définition du gain de
   l'amplificateur réalise un filtre passe bas d'ordre 1. Au total on
   dispose d'un filtre d'ordre. La courbe du gain du diagramme
   de Bode est donnée dans la figure de droite (le déphasage n'est pas
   tracé).</p>

<p>Vérifions que le diagramme de Bode est correct. Pour une fréquence
   de 100 Hz, le gain est presque de 20 dB (18.8 db pour être exact,
   soit un facteur multiplicateur de 10, ce qui correspond à ce qu'on
   au choix indiqué à étape 1). Le gain de coupure moins 3 db vaut
   15.8 et a pour fréquence de 20 Hz. La pente entre 20 Hz et 120 Hz
   vaut -20 db/decade. Apres la pente sera de -40 db/decade (car
   filtre du deuxième ordre). Ce filtre n'est pas optimal car on
   pourrait obtenir, au moins théoriquement, plus rapidement la pente
   de -40 db/decade. Il a l'avantage d'être simple à comprendre. On
   s'en contentera dans un premier temps.</p>

<!-- <p>Pour résumer, voici des exemples de signaux d'entrée et de sortie de l'amplificateur :</p>

LISTE(LINK(helico/schemas/filtre_aop/accelero_plot1_big.jpg,à 1 Hz),
LINK(helico/schemas/filtre_aop/accelero_plot100.jpg,à 100 Hz),
LINK(helico/schemas/filtre_aop/accelero_plot500.jpg,à 500 Hz))

<p>Donc plus la fréquence du signal d'entrée (de l'accéléromètre) est
   élevée plus le signal de sortie est atténué. Entre 1Hz et 25Hz
   les signaux ont à peu près le gain souhaité de 10. A 500Hz ils
   sont bien amortis.</p> -->

<!-- SUBSECTION(Etude de l'influence entre AOP idéal et AOP réel,filtr)

<p>Avec LINK(helico/schemas/filtre_aop/accelero_aop2_big.jpg,notre
   circuit) nous avons réussi à fusionner un montage soustracteur, un
   filtre passe-bas du deuxième ordre et un pont diviseur de tension
   avec un seul AOP. La coupure à 25 Hz n'est pas très franche : on
   aurait pu essayer de trouver couper plus franchement à 25Hz
   avec un filtre passe-bas du second ordre comme le filtre de
   Rauch. Bien qu'en théorie ces filtres devraient été meilleurs l'
   implémentation avec un AOP réel donné fait perdre une grand partie
   de leurs qualités.</p>

PICTURE(helico/schemas/filtre_aop/filtre_2nd_ordre_rauch.jpg,Filtre de
Rauch passe-bas du deuxième ordre)

<p>La théorie nous dit que la fonction de transfert STRONG(T) du
  filtre de Rauch est : STRONG(-1 / (1 + 2mj w/w0 + (jw/w0)^2)) où
  la fréquence de coupure est STRONG(w0 = 1 / sqrt(R C1 C2)) et le coefficient d'amortissement
  vaut STRONG(m = 3/2 sqrt(C1 / C2)). La façon plus ou moins franche de couper
  avec ue pente de 40 db/decade dépend du coefficient d'amortissement
  STRONG(m). Pour STRONG(m < 0.7) la coupure devient franche.
Le diagramme de Bode du montage est donnée ci dessous :</p>

TABLEAU(2,LOWPICTURE(helico/schemas/filtre_aop/bode_rauch_ideal,Diagramme
de Bode avec un AOP idéal.),
LOWPICTURE(helico/schemas/filtre_aop/bode_rauch_lm324,Diagramme de
Bode avec un LM324.))

<p>A gauche, nous avons obtenu  le diagramme de Bode
   du gain avec un AOP idéal. En ajustant les valeurs des résistances et des
   capacité pour obtenir STRONG(m) inférieur à 0.7, on a obtenu
   une coupure nette. A droite, le  même schéma mais réalisé un AOP
   LM324 fait apparaître une coupure beaucoup moins nette proche
   de celle que l'on a obtenu dans notre montage. On en déduit
   qu'il n'est pas utile d'essayer d'adapter ce filtre optimal a notre
   situation gain de 10 et soustraction de la tension de
   référence.</p> -->

SUBSECTION(Les gyroscopes un axe,gyro)

<p>Les gyroscopes sont des capteurs qui mesurent la vitesse angulaire.
  Il en existe au moins deux sortes qui peuvent nous intéresser : les
  mécaniques et les piézo-électriques. Les mécaniques sont en général
  lourds donc on ne va pas en utiliser. Nous préféreront utiliser
  trois gyroscopes piézo-électriques un axe PG03 (séries ENC) de
  Murata. Pour info : en avionique, on utilise des gyros lazer.</p>

<p>A l'état actuel d'avancement du projet, ces gyroscopes
   piézo-électriques semblent avoir les inconvénients suivants :</p>

<ul>
  <li>Ils donnent un signal utile dans une bande de fréquence de
    l'ordre de l'hertz à quelques dizaines de hertz. Ils sont
    difficilement utilisables pour maintenir l'hélicoptère dans une
    position stationnaire (objectif principal de ce projet) mais seront
    utiles pour le contrôle de trajectoire impliquant des vitesses
    plus grandes.</li>
  <li>Il n'est pas clair qu'il soit possible de stabiliser la
    plate-forme avec les seuls accéléromètres, lorsque le centre de
    gravité de l'hélicoptère n'est pas maintenu fixe. Dans ce dernier
    cas, on peut penser à une stabilisation grâce aux gyroscopes
    recalés par des accéléromètres.</li>
</ul>

<p>Les capteurs
  EXTLINK(http://www.murata.com/catalog/s42e3.pdf,Gyrostar) sont
  difficiles à trouver, mais sont le coeur de gyroscopes bon marché
  utilisés en aéromodélisme comme les EXTLINK(,GWS PG03). Les PG03 sont conçus,
  par exemple, pour être branchés entre la télécommande et le
  servomoteur sur l'anti-couple d'un hélicoptère RC. Ils disposent
  donc de l'électronique pour moduler le signal de télécommande. Deux
  choix sont alors possibles :</p>
<ul>
<li>récupérer le signal analogique du Gyrostar avec la carte du PG03
  (il faut démonter le capot protégeant l'électronique),</li>
<li>utiliser directement la sortie du PG03 (à savoir la modulation de
  type PWM).</li>
</ul>
<p>Le premier choix élimine la contrainte de vitesse du signal
  télécommandé modulé à 50 Hz des PG03 mais n'utilise plus son circuit
  d'amplification. Il semble facile de dessouder le capteur de la
  carte électronique (avec un décapeur thermique) mais il est moins
  dangereux de souder un fil sur la patte Out (numéro 4) du Gyrostar
  directement sur la carte du PG03 LINK(,figure de droite). C'est la
  méthode utilisée ici. L'inconvénient est l'encombrement augmenté
  sur la carte électronique.</p>

TABLEAU(2,CAPTION(helico/photos/gyro.jpg),
CAPTION(helico/photos/gyro1.jpg))

<p>Contrairement à l'accéléromètre qui utilisait un filtre passe-bas
   du deuxième ordre. Le filtre des gyroscopes sera un filtre
   passe-bande du second ordre ordre (ordre 1 pour le filtrage basse
   fréquence, ordre pour le filtrage haute fréquence). Il s'inspire du
   filtre utilisé dans LATOUR, lui même inspiré du datasheet du
   capteur.</p>

<p>Sur le schéma de gauche, on a toujours R1 et R2 en pont diviseur de
   tension pour obtenir 2V. On a toujours C3 et C1 pour obtenir un
   filtre passe-bas. Par contre on a C3 et R3 servent au filtre
   passe-haut. Les valeurs ont été choisies par essais successifs sur
   Proteus pour que notre filtre amortisse les basses fréquences
   inférieure à 1Hz et les fréquences supérieures 25Hz.</p>

<p>Note: on aurait pu découpler par exemple R1 et R2 du reste du
   schéma grâce à un autre AOP. Ici, pour pouvoir embarquer la carte
   sur la plate-forme on préfère minimiser le nombre d'AOP pour des
   raisons de poids et de place.</p>

TABLEAU(2,LOWPICTURE(helico/schemas/filtre_aop/gyro_aop, Filtre passe
bande d'ordre 1.), LOWPICTURE(helico/schemas/filtre_aop/gyro_bode,
Diagramme de Bode du gain sous Proteus.))

<!-- <p>Pour résumer, voici des exemples de signaux d'entrée et de sortie que l'on obtient
   pour diverses fréquences :</p>

LISTE(LINK(helico/schemas/filtre_aop/gyro_1.jpg,à 1Hz),
LINK(helico/schemas/filtre_aop/gyro_10.jpg,à 10Hz),
LINK(helico/schemas/filtre_aop/gyro_100.jpg,à 100Hz),
LINK(helico/schemas/filtre_aop/gyro_1000.jpg,à 1KHz))

<p>On remarque, qu'à 10Hz, les signaux ne sont pas déphasés.</p> -->

SUBSECTION(L'électronique de puissance,puis)
<p>Cette partie alimente un moteur, agit sur sa vitesse et observe
  le courant passant dans le moteur. Elle fait intervenir des
  puissances importantes de l'ordre 2A sous 8.5V (17W)
  (par rapport au PIC qui consomme du  20mA sous 5V (0.1W). Pour
  des raisons de simplicité, cette version d'hélicoptère utilise
  uniquement des moteurs électrique DC à balais (courant direct) que
  l'on fait tourner que dans un seul sens.</p>

LOWPICTURE(helico/schemas/ctrl_moteur/ctrl_moteur,Schéma de l'électronique de puissance.)

<p>STRONG(Update:) si on branche ce montage sur la sortie d'un dsPIC
   il faut ajouter une résistance de pull-up avant R3. Cela évite de
   faire tourner les moteurs quand le dsPIC est en reset (démarrage,
   arret, programmation, ...). </p>

<p>Les composants du schéma sont :</p>
LISTE(2 résistances classiques : R1 (1K&Omega;) et R3 (1.5K&Omega;),
1 resistance de puissance : R2 (1&Omega;[,] 5W),
1 capacité : C1 (2&micro;F),
1 MOSFET N : Q1 (IRF530),
1 transistor NPN : Q2 (BC547),
1 diode de puissance 6A (roue libre),
1 moteur électrique courant continu à balais)

<p>Le principe est le suivant : un signal carré (PWM) de +5V/0V généré
  par un dsPIC est envoyé dans la base du transistor Q2 ce qui le fait
  saturer ou bloquer alternativement. Quand le dsPIC n'envoie pas de
  courant dans la base du transistor, ce dernier est bloqué et le
  courant du collecteur devient nul. Il n'y a pas de chute de tension
  dans R1 et la tension au borne de la grille du MOSFET Q1 est de
  +8V. Inversement, quand le dsPIC envoie un courant dans la base de
  Q2, alors le transistor est saturé, la tension entre le collecteur
  et l'émetteur est presque nulle. Le MOSFET est un transistor
  commandé en tension. Dés qu'il existe une tension non nulle entre sa
  grille et sa source il laisse passer un courant drain-source, ce qui
  alimente le moteur. Pour plus de renseignements voir XNICO, section
  ITALIQUE(transistors).</p>

<p>L'observation du courant du moteur se fait grâce à un AOP en
   montage soustracteur (gain de 1) qui permet d'obtenir la différence
   de potentiel aux bornes de la résistance de puissance R2 (1&Omega;,
   5W). L'inconvénient de cette méthode est la perte par effet Joule
   dans la résistance. La capacité C1 permet de filtrer le courant du
   moteur. Le choix de sa valeur est expliqué dans la section
   suivante. Le transistor Q2 permet d'isoler le dsPIC de la partie
   puissance dans laquelle des courants importants alimentant le
   moteur circulent. La diode de puissance D1 permet au courant dans
   le moteur de circuler lorsque le MOSFET est bloqué (roue
   libre).</p>

PICTURE(helico/schemas/ctrl_moteur/bobine.jpg,Nécessité de la roue libre.)

<p>La tension U aux bornes d'une bobine vaut LdI/dt. Lorsque le MOSFET
   est saturé il se comporte comme un interrupteur fermé et le courant
   I augmente pour que U atteigne Vcc. La dérivée du courant est
   positive. Quand U est non nul et que l'on coupe le MOSFET, celui-ci
   se comporte comme un interrupteur ouvert et donc la valeur de I
   passe de très grande à nulle. Sa dérivée est donc un dirac négatif
   et le courant change de sens avec une tension énorme en B avec VB
   >> VA. La diode protège le circuit car le courant va la traverser
   de B vers A.</p>

SUBSECTION(Détermination de la bonne fréquence du PWM,freq)

<p>Nous savons désormais faire tourner le moteur en envoyant un signal
   PWM dans la base de Q2. On sait aussi observer le courant du moteur
   grâce à R2. Grâce à une série d'expériences on identifiera la
   fonction (non linéaire) de transfert qui aux consignes des courant
   des divers moteurs associe l'attitude de l'hélicoptère. Cette
   fonction sera expliquée dans le chapitre consacré à
   l'MYLINK(helico_asservissement,asservissement).</p>

<p>Sachant que le quartz du dsPIC est de 6.5 MHz, qu'il utilise un
   multiplieur de fréquences par 16 et qu'il faut 4 tops d'horloge
   pour exécuter une instruction, on en déduit que la fréquence
   d'exécution d'une instruction est de 26 MHz. Sachant aussi que le
   rapport cyclique du PWM est codé sur un registre de 16 bits, on
   peut calculer la fréquence du PWM. En utilisant le maximum de
   précision (16 bits) pour coder le signal, on obtient un PWM à 400
   Hz, ce qui n'est pas rapide. A chaque bit de précision perdu du
   rapport cyclique, on double la fréquence possible du PWM. En
   utilisant 10 bits on peut monter PWM à 25 KHz. En utilisant 7 bits
   on atteint 200 KHz. Plus on augmente la fréquence du PWM mieux le
   moteur et la capacité à ses bornes filtrent le signal PWM d'entrée
   et plus le moteur se comporte comme s'il était alimenté en courant
   continu du point des de vue d'une commande à une fréquence donnée.
   Il faut faire un compromis entre rapidité du PWM qui permet un
   meilleur filtrage et donc une meilleure réalisation de la consigne
   et la précision du rapport cyclique qui détermine la précision avec
   laquelle est donnée la consigne.<p>

<p>Pour stabiliser notre hélicoptère en vol, on aimerait mettre en
   place :</p>

LISTE(Une boucle d'asservissement du courant de chaque moteur à
STRONG(500Hz) avec une consigne suivie avec une
précision de 7 bits., Une boucle d'asservissement
d'attitude de l'hélicoptère à STRONG(25 Hz) agissant sur la consigne
de la  boucle de courant.
Le signal PWM  STRONG(200 KHz) peut être généré avec 7 bits de
précisions sur le dsPIC cadencé comme indiqué ci dessus[,] )

<p>On aimerait filtrer les parasites du à la commande PWM du  moteur :</p>
LISTE(Eliminer les hautes fréquence du signal PWM en particulier le 200 KHz et
et conserver sans modification les signaux à basse fréquence contenant
l'information utile pour réaliser la boucle de courant.
Typiquement une sinusoïde à 500 Hz codée dans le signal PWM doit
rester intacte avec une précision de 7 bits.)

<p>Pour ce dernier point c'est la capacité C1 de 2 &micro;F montée en
  parallèle du moteur qui va jouer le rôle du filtre. Il reste encore
  à justifier et valider le choix de cette capacité et de la fréquence
  du PWM. Cette justification vient des simulations réalisées avec
  Proteus.</p>

<p>Ces expériences consistent à simuler le montage de puissance vu
   précédemment, avec des valeurs de capacité différentes et d'envoyer
   des signaux PWM à différentes fréquences. On regarde la courbe du
   courant provenant moteur qui en résulte. On réduit les parasites
   (engendrées par l'alimentation PWM) du courant du moteur en
   augmentant la capacité de filtrage ou en augmentant la fréquence
   PWM choisie.  Chaque fois qu'on augmente la fréquence PWM on
   diminue la précision de la consigne. Chaque fois que l'on augmente
   la valeur de la capacité les hautes fréquences PWM sont mieux
   atténuées donc la précision de suivie d'une consigne constante est
   améliorée mais le signal variable utile est aussi atténué. Pour
   conserver un signal basse fréquence (inférieur à 500 Hz) non
   déformé la fréquence PWM 200 Khz conduisant à une consigne de 7
   bits de précision suivie exactement grâce à une capacité de 2
   &micro;F sont les bons compromis.</p>

<p>Les moteurs réels utilisés pur l'hélicoptère sont des
  MYMOTEURS_GRAUPNER (ou MYMOTEURS_GWS). Voici les caractéristiques de
  ces moteurs selon le site CLAYESDUCIEL.</p>

MYTABLE(3,50,Caractéristiques du moteur,valeur,unité,
poids,15,g,
Nombre de tours par volt, 3691,tr/V,
Résistance interne du moteur, 1,&Omega;,
Courant absorbé par le moteur à vide, 0.28,A,
Pas de l'hélice utilisée, 2, pouce,
Diamètre de l'hélice utilisée, 3, pouce,
Vitesse rotation moteur, 25000, tr/min)

<!-- <p>Voici le tableau du pourcentage de fluctuation du courant en
   fonction de la fréquence du PWM et de la capacité obtenu par
   simulation sous Proteus. On voit que pour
   C1=2&micro;F et en passant de 100KHz a 200KHz, que ça ne sert à
   rien de vouloir gagner des 1/2^16 de précision sur la génération
   des créneaux alors que la fluctuation du courant est de 4%.</p>

MYTABLE(5,75,Capa\PWM,1KHz,200KHZ,100KHZ,50KHz,
2uF,LINK(helico/schemas/ctrl_moteur/capa2uf_pwm1k.jpg,plot),LINK(helico/schemas/ctrl_moteur/capa2uf_pwm200k.jpg,2%),,,
20uF,,,,,
50uF,,,,,
100uF,,,,,
1000uF,,,,)
CENTER(Etude de l'influence de la capa sur le filtrage de courant. %err)
-->

SUBSECTION(Filtre analogique sur l'observation du courant du moteur,icur)

<p>Ce circuit est en cours de modification. La fréquence de coupure
  (actuellement de 500 Hz) est mal placée. Il faut couper à 150 Hz. La
  sortie de ce circuit se branche dans l'une des entrées analogiques
  du dsPIC. Pour la régulation de la plate-forme, il faudra avoir
  un circuit par moteur, soit quatre au total.</p>

TABLEAU(3,LOWPICTURE(helico/schemas/ctrl_moteur/FiltreCrtMoteur),
LOWPICTURE(helico/schemas/ctrl_moteur/FiltMot_VitMot_20Ktrmin_1),
LOWPICTURE(helico/schemas/ctrl_moteur/FiltMot_VitMot_20Ktrmin_2))

<p>A gauche : l'interface de puissance et le filtre passe bas qui doit
  être mis à jour (fréquence de coupure à 500 Hz et gain de 1). Au
  centre : le résultat du filtre en situation réelle (en jaune
  l'entrée de l'AOP, en vert la sortie). On voit que les hautes
  fréquences sont atténuées mais il existe une oscillation basse
  fréquence à 300 Hz gênante pour la régulation du courant (zoom sur
  l'image de droite). Après recherche cette fréquence correspond à la
  vitesse de rotation du moteur (ici 20K tours/min) et donc aux
  imperfections des contacts des balais.</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_mecanique,Construction de la carcasse,
helico_logiciel,Software)
