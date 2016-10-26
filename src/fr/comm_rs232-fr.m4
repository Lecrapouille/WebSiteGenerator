dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Port série sous *nix)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_TUTO)

divert(DIVERT_NAVIGATION_CODE)

ICON_BUILD STRONG(Page en cours de rédaction. Les phrases sont
intélligibles ! C'est normal[,] je viens juste d'écrire le plan.)

divert(DIVERT_BODY_CODE)

SECTION(Port série sous Linux,serie)
SUBSECTION(Qu'est ce que la liaison série asynchrone ?,dd)

<p>Un ordinateur, un terminal, une imprimante est un élément
   susceptible d'échanger des données avec un réseau mais il ne permet
   pas de se connecter directement à la ligne de transmission. On
   utilise le terme DTE (Data Terminal Equipment) pour parler de ces
   éléments. Deux DTE ne peuvent a priori pas communiquer entre
   eux. Ils doivent passer par un DCE (Data Communications Equipment)
   pour la transformation des signaux. Un équipement DCE bien connu
   est le modem qui permet à deux ordinateurs de communiquer à
   distance entre eux via une ligne téléphonique.</p>

<p>Dans ce document, par abus de langage, on enploiera les termes :</p>

LISTE(D'ordinateur (PC, Mac, ...) pour parler de terminal et donc
      DTE., De modem pour parler de l'équipement de communication et
      donc DCE. Plus tard dans ce document[,] on remplacera le terme
      de modem par microntrôleur dsPIC vu que dans le projet
      MYLINK(helico_intro,H4H) on desire faire communiquer un PC avec
      un dsPIC.)

<p>La liaison série a été concue pour permettre l'interfaçage entre un
   équipement terminal de données (DTE : Data Terminal Equipment) et
   un équipement de communication de données (DCE : Data
   Communications Equipment) employant des échanges de données en
   série, à savoir bit après bit (par oposition avec le port parallèle
   qui émet un mot à la fois, à savoir un ensemble de bits). Il existe
   différentes normes pour véhiculer l'information : la plus simple
   (et celle que l'on va parler ici) est la norme RS-232 : elle est
   présente sur les PC personnels (mais tend de plus en plus à être
   remplacée par le bus USB).</p>

SUBSECTION(Connectique)

<p>Nous nous intéresserons uniquement aux connecteurs 9 broches
   appelés DB9 qui sont encore utilisés sur les PC. Il existe des
   connecteurs males et femmelles. Les connecteurs utilisés surles PC
   sont du genre male. Voici des photos des connecteurs ainsi que les
   numéros des broches qui changent selon le genre.</p>

TABLEAU(4,PICTURE(comm/DB9F.jpg,DB9 Femmelle),
PICTURE(comm/con_db9F.jpg,DB9 Femmelle),
PICTURE(comm/DB9M.jpg,DB9 Male),
PICTURE(comm/con_db9m.jpg,DB9 Male))

<p>Voici les numéro des brôches correspondant aux images précédentes
   ainsi que leur acronyme, nom anglais et français et si c'est une
   entrée ou une sortie. Nous définirons plus tard le rôle de chaque
   broche.</p>

MYTABLE(5,80,Numéro broche,E/S,Acronyme,Nom,Traduction,
1,entrée,DCD,Data Carrier Detect,Détection de porteuse,
2,entrée,RxD,Receive Data,Réception de données,
3,sortie,TxD,Transmit Data,Emission de données,
4,sortie,DTR,Data Terminal Ready,Terminal de données prêt,
5,X,GND,GrouND,Masse,
6,entrée,DSR,Data Set Ready,Poste de données prêt,
7,sortie,RTS,Request to Send,Demande d'émission,
8,entrée,CTS,Clear To Send,Prêt à émettre,
9,entrée,RI,Ring Indicator,Indicateur de liaison)

SUBSECTION(Brochage le plus simple entre un ordinateur et un modem)

<!-- <p>Il existe deux modes d'échange de données pour le port série : le
   mode synchrone et le mode asynchrone. Nous nous intéresserons au
   deuxième mode.</p>

<p>Le mode synchrone nécéssite, en plus des deux lignes pour
   communiquer, l'utilisation d'un signal de synchronisation entre
   l'émétteur et le récepteur qui leur permettent de savoir le début
   et la fin d'un octet. Ce mode a l'inconvénient d'utiliser un fil
   supplémentaire.</p>

<p>Le mode asynchrone permet de se passer de ce signal supplèmentaire
   de synchronisation. Emetteur et récepteur doivent alors communiquer
   avec la même vitesse et se synchroniser avec un bit de start et de
   stop. Le mode asynchrone n'ayant pas besoin de ligne d'horloge, il
   reste alors deux lignes pour communiquer, chacune étant dédicacée à
   un sens de transfert ce qui permet d'envoyer et recevoir des
   données en même temps mais on doit alors connaitre la vitesse à
   l'avance la vitesse de transmission des données. On parlera de
   alors liaison full-duplex. La liaison half-duplex impose la
   réception ou la transmission d'une donnée à la fois. Voir le cours
   sur les PIC16F877 de BIGONOFF pour plus de détail sur les
   différents modes de transmission.</p>-->

<p>La figure suivante montre la connexion la plus simple pour émettre
   et recevoir des données.</p>

CENTER(STRONG(<p RxD  -> TxD</p>
<p>(ordi) TxD  <-  RxD (modem)</p>
<p>GND <-> GND</p>))</p>

<p>Le problème majeur est que les ordinateurs et les modems sont des
   composants hétérogenes de part leur vitesse de traitement des
   données ainsi que la taille du tampon de mémoire qui permet de
   stocker provisoirement les données avant leur traitement. Aucun des
   deux protagonistes ne peut vérifier si son correspondant est pret à
   émettre ou à recevoir des données, s'il est sous tension ou si son
   buffer n'est pas saturé (par exemple si l'ordinateur émet plus de
   données que ne peut accepter le modem).</p>

<p>C'est pour cela qu'il existe différents contrôles de flux aussi
   appelés protocole d'accord ou encore handshaking (poignée de
   main). Il en existe trois. Nous y viendrons plus tard.</p>

LISTE(Contrôle matériel utilise les broches DTR/DSR et/ou RTS/CTS.,
      Controle logiciel aussi appelé Xon/Xoff à cause des octets
      spéciaux qui sont envoyés., et XXX.)

SUBSECTION(Protocole de communication entre deux ordinateurs via leur modem)
<!-- ordi1 <==> modem1 <==> modem2 <==> ordi2 -->

CENTER(Copier Figure 11)

<p>La figure, montre un ordinateur (O1) en communication avec un autre
   ordinateur (O2) via leur modem (M1 et M2). Voici la description de
   leur protocole d'échange.</p>

<p>Lorsque l'oridateur O1 désire envoyer des données à O2, il envoie
   une demande d'émission à son modem M1 avec la broche RTS (Request
   To Send). Lorsque M1 détecte ce signal, il émet une porteuse
   non-modulée à M2. Cette porteuse est reçue et détectée par le modem
   M2 qui le signale à l'ordinateur O2 grâce à la broche DCD (Data
   Carrier Detect). Le modem M1 envoie à O1 un signal 'prêt à émettre'
   via la broche CTS (Clear To Send). L'ordinateur la percois et
   envoie à son modem les données sur la ligne d'émission (TxD). Le
   modem M1 module alors le signal de données sur la porteuse. La
   porteuse modulée est reçue et démodulée par le modem M2 pour être
   transmise à l'ordinateur O2 via la ligne de réception (RxD).</p>

<p>D'autres signaux sont échangés entre l'ordinateur et son modem, il s'agit
   du signal DTR (Data Terminal Ready) lorsque l'ordinateur est prêt et
   du signal DSR (Data Set Ready) lorsque le modem est prêt.</p>

SUBSECTION(Définissions des broches)

<p>Nous comprenons maintenant pourquoi malgré le fait que les
   communications soient de type asynchrone et full duplex, les
   connecteurs DB9 ont 9 broches.</p>

<p>Nous pouvons maintenant donner l'utilité de toutes les broches du
  DB9. Pour cela, on se placera du côté de l'ordinateur.</p>

<p>RxD et TxD sont les deux signaux Gnd

<p>DCD: (ou CD) détection de porteuse ou Data Carrier Detect. Le
   modem indique à l'ordinateur qu'une liaison avec un autre modem est
   établie (ou dit autrement qu'il y a un lien de connection entre les 2 modems). Le
   signal est alors à l'état haut. Il n'est pas utilisé directement
   pour le flux de contrôle principalement comme une indication.</p>

<p>RTS et CTS: L'utilisation d'origine est : ITALIQUE(I Request To
   Send to you) Je demande à vous envoyer. L'ordinateur demande à
   son modem s'il peut envoyer des données à l'autre ordinateur. CTS:
   le modem est pret a recevoir les donnees de l'ordinateur pour les
   envoyer a l'autre modem. ceci ne prot`ege le flux que dans une
   direction : de l'ordinateur (ou du terminal) vers le modem (is,
   that the DTE can always handle incomming information faster than
   the DCE In the past, this was true.).</p>

DTR et DSR: Joue le meme role que RTS/CTS
DTR: l'ordinateur indique au modem qu'il est pret. The DTE uses the DTR signal
to signal that it is ready to accept information,

DSR: le modem indique a l'ordi qu'il est pret.

RI: le modem veut initier avec l'ordinateur.

Copier figure 10.


SUBSECTION(Controle de flux (ou comment proteger le modem de l'ordinateur))

<p>Certains pensent que le contrôle de flux matériel est fait par le
   matériel mais (sauf si vous utilisez une carte série intelligente
   avec plusieurs ports série) c'est en réalité votre syst`eme
   d'exploitation qui s'en charge.</p>

<p>logiciel Xon/Xoff : surtout utilie quand on veut envoyer des
   caracteres ascii (et pas de donnees binaires) car il y a des plages
   de valeurs ou la. Si utilisation du binaire alors car il faut
   doubler les Xon/Xoff ce qui est chiant.</p>

<p>logiciel ETX/ACK ACK pour ackitement</p>

SUBSECTION(Connexion par câble null-modem)

<p>Parfois on désire faire communiquer deux ordinateurs entre eux. The
   main use of null modem cables is file transfer between two
   computers. L'idee est de faire croire que l'ordinateur 1 parle avec
   un modem B plutot qu'avec un autre ordinateur. On utilise alors un
   cable null-modem (cable croise).<p>

LINK(http://www.lammertbies.nl/comm/info/RS-232_null_modem.html)

SUBSECTION(Format des trames)


SECTION(Programmer le port série avec Linux)
SUBSECTION()
- ouverture, fermeture
- vitesse, nb bit start, nb bits stop, parite,
- mode raw, mode canonique
- controle des broches : raise drop
- ecrire, lire
- dessiner la machine a etat pour controle de flux.

SUBSECTION(Définition de notre protocole de communication entre Linux (ou Mac) et un dsPIC)

<p>Le choix de la vitesse est arbitraire.</p>
<p>Le choix du format est : 8 bits de donnes utulisation du mark/space
   parity afin de re-synchroniser les messages entre eux (Voir cours
   de Bigonoff pour plus de detail USART).  1 bit de stop. Check sum
   materiel.  Flow de control logiciel et materiel desactive (on
   prefera utiliser notre propre protocole de flot de controle) Ici :
   on utilisera les broches DTR et DSR.  Contrairement a ce qu'on a
   dit precedement on direra que ces broches servent à indiquer "Pret
   a recevoir" afin de proteger le buffer</p>

<p>D'apres des experiences antereieurs j'ai remarque : Le dsPIC jouera
   le role du modem. Contrairement a ce qu'on a dit ici nous avons un
   modem (joue par le PIC) plus reactif que le PC mais dont le buffer
   est plus petit donc a proteger contre les overflow. Pour le PC il
   faudra eviter qu'il soit noye dans le flux de donnee 'bombarde' par
   le dsPIC (si on utilise Scilab). Comme on envoie des donnees
   binaires on ne peut pas utiliser le Xon/Xoff car il faut doubler
   les Xon/Xoff ce qui est chiant.</p>

<p>Pour tester le programme du cote ordi : un cable null-modem "Null modem with full handshaking" ou "Null modem with partial handshaking"</p>

<p>du cote on utilisera un simple Max232 on utilisera toutes ces pattes (Rx/Tx,DTR/DSR)</p>

LINK(http://www.greyc.ensicaen.fr/~emagarot/pdf/CM_InfoIndus_2007.pdf)

<p>Scicos ne possède pas de moyen de communication avec l'extérieur,
   d'où son impossibilité de contrôler l'hélicoptère. Il a fallu créer
   un bloc diagramme qui puisse envoyer et écouter des données sur un
   port série.</p>

<p>Ceci est facilement réalisable, car Scilab permet de faire de
   l'édition de liens sur des fonctions C et de les lier à des blocs
   diagrammes Scicos. Pour construire un bloc Scicos, deux fichiers
   sont nécessaires, donc deux fonctions :
   LINK(tuto_scicos-LANG.html#simulation,fonction de simulation) et
   LINK(tuto_scicos-LANG.html#interface,fonction d'interface).</p>

<p>En créant la fonction de calcul et d'interface pour le port
série, Scicos devient un oscilloscope numérique 50Hz (on
peut les télécharger sur
LINK(helico_download-LANG.html,download)). Il lit les données
des capteurs de l'hélicoptère sur le port série,
les affiche sous forme de courbes, calcule la loi de commande et
envoie les consignes PWM sur le port série. La vitesse du port
série est de 19200 bauds, 8 bits de données, 1 bit de
stop et aucun flot de contrôle (ni matériel ni
logiciel).</p>

divert(DIVERT_FOOTER_CODE)


END_BODY(,)
