dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

ICON_BUILD STRONG(Page en cours de rédaction).

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Partie logicielle : Communication inter composant de la plate-forme)
SUBSECTION(Rappel du cahier des charges)

<p>Le cahier des charges propose que notre plate-forme volante puisse
   communiquer avec un PC non embarqué. Ceci pour permettre le
   déboguage, la communication des consignes de vol, le data logging,
   la prise en main d'un calcul trop complexe par l'ordinateur. La
   carte électronique de la plate-forme volante contient deux
   microcontrôleurs qui doivent pouvoir communiquer entre eux. Nous
   utiliserons, le protocole UART (norme RS-232 ou port série) pour la
   communication entre le PC et le dsPIC maître car il est plus simple
   à mettre en place que l'USB. Le dsPIC maître communique avec le
   dsPIC esclave par SPI. Ces choix ont été faits car le SPI étant
   plus rapide que l'I2C et que les dsPIC 30F2010 n'ont pas de bus CAN
   ni d'USB.</p>

SUBSECTION(Pourquoi utiliser un protocole de communication ?)
<p>Nous avons vu LINK(comm_rs232-LANG.html,ici) (désolé ! Cette page
   n'est pas encore écrite) comment écrire un programme C, s'exécutant
   sur un système Unix, capable d'envoyer et recevoir un paquet
   d'octet sur le port série. Question : cela suffit il pour que le PC
   puisse communiquer avec notre plate-forme ? La réponse est oui (il
   suffit de voir les nombreux projets sur le web) mais cela n'est pas
   idéal pour notre projet. On va expliquer, dans ce document,
   pourquoi et voir comment améliorer la robustesse des échange de
   données.</p>


<p>Les deux dsPIC et le PC peuvent communiquer ensemble par envoi et
   réception successif d'un paquet d'octet. Cela fonctionne
   parfaitement sauf le jour où des perturbations extérieures viennent
   parasiter et corrompre les données envoyées. L'exemple le plus
   flagrant pour ce projet est la présence des moteurs qui vont
   perturber la masse et provoquant des chutes de tension (j'ai été
   confronté à ce problème sur le premier prototype). Nos composants
   communicants doivent comprendre les messages qu'ils reçoivent et
   pouvoir détecter puis supprimer un message erroné (perte ou ajout
   d'un ou plusieurs octet, modification de la valeur d'un octet) et
   pouvoir se resynchroniser sur le début de la trame suivante après
   suppression d'un message défectueux. Comme nous n'avons pas de puce
   électronique capable de détecter toute seule ces problèmes (je
   pense à l'USB et au CAN), nous serons obligé de mettre en place un
   automate logiciel.</p>

<p>L'automate utilisé pour ce projet s'inspire du document suivant
   LAB11 qui explique la mise en place d'un petit automate capable de
   comprendre un protocole BSC simplifié (pour Binary Synchronous
   Communication inventé par IBM). Nous allons, ici, expliquer le
   fonctionnement de notre automate <!-- que l'on va appelé BSC bien
   que nous utiliserons--> qui sera asynchrone contrairement au BSC.</p>

<p>Notre automate utilise 3 des 7 couches du modèle
   EXTLINK(http://www.frameip.com/osi/,OSI) : physique, liaison,
   applicative. Voici leur définition générale :</p>

LISTE(STRONG(Physique) : cette couche se contente d'envoyer une suite
      brute de bit. Le codage des bits dépend des caractéristiques
      physiques du média employé (électrique[,] onde[,] lumière[,]
      IR[,] son[,] ...). Par exemple[,] la valeur 1 peut être codée
      lorsque la tension électrique vaut +5V ou -12V[,] de même le 1
      peut être défini comme étant la présence d'un son et le 0 comme
      l'absence de son. Pour notre application nous utiliserons la
      norme RS232 entre le PC et le dsPIC Maître. Nous utiliserons le
      SPI entre les deux dsPIC. Ce sont des communications sérielle à
      savoir que les bits sont envoyés les uns après les autres (par
      opposition au port parallèle). Il se peut que dans un futur
      proche nous utiliserons l'I2C et les radios fréquences.,

      STRONG(Liaison) : Si on branche les bons câbles entre les deux
      dsPIC ils sont capables[,] grâce à leur couche physique[,] de
      s'envoyer des suites de bits (que l'on appellera trame). <!-- Les
      données ainsi envoyées n'ont aucune signification
      particulière.--> Le rôle de la couche liaison est de détecter les
      erreurs sur la couches physique. Elle doit pour cela être
      capable de comprendre où une trame débute et où elle se termine
      parmi la suite d'octets (bien que la frontière des trames n'est
      pas toujours évidente). Enfin[,] cette couche peut envoyer des
      acquittements positifs ou négatifs en cas de détection de trames
      erronées ou correctes ou en cas de détection de débordement des
      mémoire tampons stockant les trames.,

      STRONG(Applicative) : Cette couche fait le contact entre l'utilisateur
      et les services des couches en dessous.)

<p>Ce document explique l'automate de la couche liaison utilisé pour
   ce projet. J'informe le lecteur que je ne suis ni spécialiste des
   couches OSI ni du protocole BSC. Ce document a pour unique but de
   faire découvrir au lecteur la méthode que j'ai employée pour ce
   projet plutôt que donner un cours exhaustif et précis sur les
   protocoles de communication.</p>

SUBSECTION(Apercu rapide du protocole BSC)
<p>Le protocole BSC, tel que décrit dans le document ci dessus, permet
   d'envoyer des messages ascii. Il utilise des octets d'informations
   (que l'on va appelé tags) de début et fin de texte pour délimiter
   les frontières des trames. A cela s'ajoute une somme de contrôle
   (checksum en anglais) afin de garantir l'intégrité du message
   contenu dans la trame.</p>

<p>Voici comment est constituée une trame la plus simple :</p>
LISTE(STRONG(STX) : Start of Text. Tag informant le début du message
      ou de la trame.,

      STRONG(Message) : une suite de code ascii constituant le
      message. La taille du message est arbitraire.,

      STRONG(ETX) : End of Text. Tag informant la fin du message.,

      STRONG(CHK) : Checksum. La somme de contrôle du message.)

<p>Il existe plusieurs type de calcul de checksum. Le plus simple (et
   celle que l'on utilise) consiste à appliquer l'opérande xor (ou
   exclusif) sur chaque octet du message. Malgré cela, l'intégrité
   totale n'est pas préservée par exemple 42 xor 42 donne le même
   résultat que 3 xor 3 xor 3 = 0. Il a l'avantage de pas coûter cher
   en temps de calcul. Une autre forme de contrôle est d'ajouter un
   bit de parité sur chaque octet. La encore aucune garantie de
   détecter un message corrompu à 100%.</p>

<p>Il faut signaler que le protocole BSC sert à envoyer des messages
   purement ascii (par opposition aux messages binaires). En effet les
   octets non ascii sont utilisés pour les tags des trames car ils
   pourraient entrer en conflit (par exemple un octet du message
   pourrait avoir la valeur STX ou ETX).</p>

<p>Si on veut néanmoins envoyer des messages binaires, à chaque fois
   que l'on rencontre un octet du message qui correspond à un tag il
   suffit de le doubler dans le message (de la même manière que les
   doubles \ pour les systèmes Unix).</p>

<p>Note : des informations supplémentaires peuvent être ajoutés à la
   trame (et avant le début du message) comme par exemple
   l'identifiant du destinataire et de l'envoyeur. Cela est utile pour
   les couches au dessus de notre couche liaison (les quatre couches
   que l'on a passées sous silence). Une trame est prélevée dés que le
   destinataire et l'envoyeur correspondent, sinon elle est rejetée ou
   bien est redirigée sur le réseau.</p>

SECTION(Apercu rapide de notre protocole)
SUBSECTION(Apercu d'une trame)
<p>Notre protocole s'inspire de ce que nous avons vu du protocole
   BSC. On veut utiliser les tags informatifs et envoyer des messages
   binaires, et ce, sans doubler les octets du message correspondant
   aux tags. Nous allons aussi essayer de minimiser au maximum la
   taille des trames car la vitesse des médias de communication sont
   très lente et un message long a plus de chance d'être corrompu. En
   effet si le débit du port série vaut 9600 bauds (9600 bits par
   secondes) ça nous donne environ 1 octet envoyé ou reçu à chaque
   milliseconde. Ceci est très lent à comparer aux 25K instructions
   par millisecondes du dsPIC.</p>

<p>Comme les convertisseurs analogiques du dsPIC fournissent des mots
   de 10 voir 12 bits qui doivent au final être stockés dans des mots
   de 16 bits, cela nous donne quatre bits utiles pour coder une
   information sur la trame. En éclatant un mot de 16 bits en deux
   mots de 8 bits (plus grand commun multiple entre les mots envoyés
   par la couche physique du port série et du SPI) nous avons 2 bits
   d'informations pour chaque octet à envoyer. Ils seront placés dans
   le MSB (Most Significant Bits). Voici une trame octet par octet de
   notre protocole.</p>

LISTE(Tag STX + longueur du message. Avec STX valant 01 en binaire.,

      Message avec des mots de 16 bits découpés en mots de 8
      bits. Nous avons donc : MSB + octet2 et LSB + octet1 avec MSB et
      LSB valant respectivement 00 et 11 en binaire. La longueur du
      message est connue car donnée dans l'octet d'en tête.,

      Tag ETX + Checksum. Avec ETX vallant 10 en binaire.)

<p>Donc tous nos octets sont étiquetés. Il n'y a pas de confusion
   possible. Il nous reste plus qu'à voir comment mettre en place
   l'automate de reconnaissance des trames. Par exemple le message
   ITALIQUE(Hello World !!) sera codé par la suite d'octet : 0x5c 0x01
   0xc8 0x01 0xe5 0x01 0xec 0x01 0xec 0x01 0xef 0x00 0xe0 0x01 0xd7
   0x01 0xef 0x01 0xf2 0x01 0xec 0x01 0xe4 0x00 0xe0 0x00 0xe1 0x00
   0xa1 0x1c. Il est également possible de supprimer tous les octet
   MSB dont la valeur vaut 0.</p>

SUBSECTION(Automate de reconnaissance d'une trame bien formée)
<p>STRONG(En cours de rédaction.)</p>
<p>Mêmes moyens que ceux employés par les automates syntaxiques pour
   les compilateurs (voir ).</p>

SUBSECTION(Résultats)
<p>L'avantage d'avoir décomposer notre communication par couche est
   que le code est plus générique. Les avantages sont les suivants
   :</p>

LISTE(STRONG(Validation) Si on valide la couche liaison sur une
      architecture X alors on est garanti qu'elle va fonctionner pour
      une architecture Y car le code est indépendant de l'architecture
      choisie (il est donc portable).,

      STRONG(Générique) La couche liaison se compile indépendamment du
      contrôleur de la couche physique. Dans notre cas la couche
      liaison appelle les fonctions ITALIQUE(open)[,] ITALIQUE(close)[,]
      ITALIQUE(read_1_byte)[,] ITALIQUE(write_1_byte) de la couche
      physique associée. Il suffit donc pour chaque architecture et
      pour chaque couche de coder ces 4 fonctions. Elles seront
      appelées par l'automate de la couche liaison. Par exemple UART
      pour le dsPIC[,] UART pour Linux[,] UART pour Windows[,] SPI pour
      dsPIC.,

      STRONG() Si on change la couche physique la validation de
      l'automate n'est pas à refaire.)

<p>Dans un future proche on remplacera la liaison RS232 par des radios
   fréquences (via une radio commande pour aéromodélisme).</p>

<p>Voici une capture d'écran d'un oscilloscope d'une communication sur
  le port série avec notre protocole (115200 bauds). De couleur verte
  : les trames de 10 octets envoyées par le dsPIC (période : 50
  Hz). En jaune les acquittements positifs ou négatifs à leur réception
  par le PC.</p>

  PICTURE(helico/schemas/10oct_50Hz_115200bds.jpg,Espionnage des trames.)

divert(-1)
<p> C'est pour cela que l'on va mettre en place un système de
   communication inspiré du protocole BSC (pour Binary Synchronous
   Communication). Ce protocole repose sur deux ITALIQUE(couches) :
   une couche physique et une couche xxx. Les modules du dsPIC UART
   et SPI permettent de véhiculer un octet à la fois (en série) :
   c'est la couche physique.  Cette couche pourrait suffire à elle
   même, dans le sens où elle est suffisante pour transmettre et
   transmettre des messages de plusieurs octets. Le problème est qu'il
   est difficile de savoir si le message reçu est erroné ou pas et de
   savoir où débute le message et où il se termine (le message peut
   avoir perdu ou gagné un octet en cours de route à cause d'une
   perturbation). C'est pour cela que l'on rajoute une deuxième couche
   logique : un automate permettant de vérifier la validité du
   message. Seul les messages correctement constitues seront acceptes.</p>

<p>Nous allons voir ici, comment mettre en place le protocole
   BSC. Cette étude s'inspire fortement du document LAB11.</p>

<p>Ce que l'on va appeler par la suite un message est une suite
   d'octet dont :</p>

LISTE(le premier octet est l'octet indiquant le début de trame. Il est nommé STX (pour Start of Text),

      il est suivi par une suite d'octet constituant le message proprement
      dit. La taille du message est arbitraire.,

      l'avant dernier octet est l'octet indiquant la fin de la
      trame. Il est nommé ETX (pour End of Text),

      un checksum[,] à savoir un contrôle de validité du message.)

<p>Mettre image</p>

<p>Après réception du message, le destinataire envoie un message
   constitué d'un unique octet permettant d'indiquer à l'émetteur si
   le message reçu est correct ou non. C'est un acquittement au
   message reçu. Il peut être soit positif (ACK) soit négatif (NACK).</p>

<p>Communication dsPIC ==> PC : 14 octets envoyés (dont 10 octets de
  données et 4 d'entêté, checksum) sur le port série, tous les 50 Hz à
  la vitesse de 115200 bauds. Le PC envoie un octet d'acquittement.</p>
<p> Note: 1 carreau == 10 ms.</p>

divert(0)



divert(-1)
SECTION(Génération automatique de code distribué)

SUBSECTION(Etude du programme prototype 1 basé sur PIC)

<p>Lors du développement du programme embarqué sur les PIC 16F876A
  pour le prototype 1 de l'plate-forme, j'ai défini l'ordre dans
  lequel devait de se faire la communication entre les
  microcontrôleurs et l'ordinateur. Dans ce diagramme suivant, les
  numéros encerclés définissent cet ordre. Ceci a du être fait
  manuellement.</p>

PICTURE(helico/schemas/comm.jpg,Chronogramme des communications)

<p>ENUM(Le PIC maître et le PIC esclave lisent les valeurs
   (analogiques et numériques) des capteurs (accéléromètre[,]
   gyroscopes[,] altimètre).,

  Scilab envoie au PIC maître les consignes des signaux PWM des
  quatre moteurs.,

  <!-- Le PIC maître reçoit une interruption.-->Les consignes
  PWM sont traduites en signal PWM pour les moteurs 1 et
  2. Parallèlement[,] le PIC maître envoie au PIC esclave
  les consignes PWM des moteurs 3 et 4 grâce au module
  I2C.,

  Le PIC esclave répond au PIC maître en lui envoyant les résultats
  des lecture de ses capteurs.,

  Pendant que le PIC maître envoie à l'ordinateur l'ensemble des
  lectures des capteurs (provenant du maître et de l'esclave)[,] le
  PIC esclave traduit les consignes PWM des moteurs 3 et 4 en signal
  PWM réel.)</p>

<p>Le PIC maître communique avec un PC non embarqué grâce au protocole
   UART (norme RS232) et avec un PIC esclave grâce au protocole
   I2C.</p>

<!--<p>Le PIC maître, configuré en mode UART (Universal Synchronous
   Asynchronous Receiver Transmitter) communique de façon asynchrone
   un avec un ordinateur via ses pattes Rx (réception) et Tx
   (transmission) branchées sur un port série. La vitesse de
   transmission est de 19200 bauds, 8 bits de données, parité paire, 1
   bit de stop et aucun contrôle de flux.  Le composant MAX232 est une
   porte NON qui convertit les signaux du port série (+12V/-12V) en
   signaux adaptés au PIC (0V/+5V). Le site de BIGONOFF explique en
   détail comment fonctionne l'ensemble et fournit un programme type à
   charger sur le microcontrôleur et un programme PC pour tester la
   communication série.</p>

<p>TODO: Comm I2C</p>-->


SUBSECTION(Chronogramme des interruptions,chrono)

<p>Les PIC permettent de lancer plusieurs opérations en parallèle. Les
   fins de calcul sont signalées par des interruptions. Les programmes
   des PIC ont été conçus pour faire tourner en parallèle deux timers,
   une conversion analogique, la génération de deux signaux PWM, la
   réception et l'émission d'un octet sur le port série et le module
   I2C. Le chronogramme des interruptions est illustré sur la figure
   suivante.</p>

PICTURE(helico/schemas/chronointerrup.jpg,interruptions du PIC)

<p>Le PIC maître contient deux buffers permettant de communiquer
avec l'ordinateur~:</p>
<ul>
<li>un premier pour la réception, que l'on appellera
  ITALIQUE(BufRec);</li>
<li>un deuxième pour l'émission, que l'on appellera
  ITALIQUE(BufEm).</li>
</ul>

<p>Chaque résultat des conversions analogiques est
sauvegardé dans ITALIQUE(BufEm). A chaque fin, une interruption
est lancée (représentée par une flèche noire sur
le chronogramme). Vu que le PIC permet une seule conversion analogique
à la fois, on doit alors changer de patte analogique à chaque
fois qu'une conversion se termine. Il faut attendre que~:</p>
<ul>
  <li>les condensateurs de la nouvelle patte se chargent;</li>
  <li>la conversion analogique se finisse.</li>
</ul>
<p>Comme ces durées dépendent de la tension et de la
chaleur du PIC, on utilise le timer 0 avec une période assez
grande pour pouvoir relancer une nouvelle lecture sans risque de
corruption de la lecture (interruption en vert sur le chrono).</p>

<p>Scilab envoie alors les consignes PWM par le port série, ce
qui crée une interruption (orange sur le chrono). Le PIC les
lie et les stocke dans ITALIQUE(BufRec). Il profite de cette
interruption pour envoyer le contenu de ITALIQUE(BufEm).</p>

<p>Les consignes PWM, stockées dans ITALIQUE(BufRec), sont les
nouvelles valeurs des comparateurs du PIC. Deux comparateurs sont
présents et fonctionnent avec le timer 2. Lorsque la
valeur du timer 2 atteint celle du comparateur ITALIQUE(x) , +5V est
généré sur la patte CCPx du PIC jusqu'au
débordement du Timer 2, qui permet de terminer un cycle d'un
signal PWM, en mettant à la masse les sorties des pattes
CCP. La vitesse de notre signal PWM est de 5 kHz avec un PIC
possédant un quartz de 20MHz.</p>

<p>Enfin, avant qu'une interruption de débordement du Timer 2
soit lancée, quatre interruptions de débordement du
Timer 0 sont lancées.</p>



SECTION(Code prototype version 2 basé sur dsPIC)

On a vu que c'etait chiant de faire a la mano :

-- quand et comment et dans quel ordre les proc communiquent

-- gerer l'ordre du code (timer, inter, ...)

On va generer ca a automatiquement

Exemple photos SynDEx, Scicos ....
divert(0)


divert(DIVERT_FOOTER_CODE)

END_BODY(helico_electronique,Construction de la carte électronique,
helico_asservissement,Asservissement de la plate-forme)
