dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

ICON_UPDATED STRONG(Page en cours de rédaction).

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,Liste du matériel,#matos,
Construction de la croix,#croix,
Construction des attaches des moteurs,#moteur,
Construction des pieds,#pieds,
Construction des pieds de la balançoire,#balanc),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Partie matérielle)
SUBSECTION(Contexte)

<p>Cette page explique comment construire la carcasse de
   l'hélicoptère. Le design a été pensé pour que l'hélicoptère soit le
   plus simple à fabriquer et qu'il soit de petite taille (taille
   d'une main soit 25 cm environ). Avec l'expérience, une journée
   suffit pour construire la croix, les pattes et les attaches des
   moteurs.</p>

<p>Cette page a été découpée selon les points suivants :</p>
LISTE(LINK(#matos,Liste du matériel à acheter),
LINK(#croix,Construction de la croix),
LINK(#moteur,Construction des attaches des moteurs),
LINK(#pieds,Construction des pieds,#pieds),
LINK(#balanc,Construction des pieds de la balançoire))

<p>La construction de la carte électronique n'est pas encore à l'étude
  car elle est actuellement non embarquée.</p>

<!--<p>Vu que l'appareil est 'fait main' il reste quelques problèmes
  de solidité (colle qui lâche). Les caractéristiques de cet hélicoptère
  s'inspire de JOSEJ. Le site XNICO et CRACMIKE décrivent
  d'autre méthodes pour construire un hélicoptère de taille et de
  poids plus important.</p>-->


SUBSECTION(Liste du matériel à acheter,matos)

<p>Voici une liste minimale et non exhaustive de composants qu'il faut
  avoir pour construire son hélicoptère. Il vous faudra aussi un
  certain nombre de résistances (et, bien que non optimal, au moins
  quatre résistances de puissance 1&Omega; et 5W), condensateurs,
  diodes de roues libres, MOSFET et transistors.</p>

<p><!-- Des outils comme : une carte à essai, un oscilloscope et un
  voltmètre sont utiles.--> Pour l'usinage des pièces, les outils
  suivants ont été utiles : un petit marteau, un étau, une petite
  scie, des ciseaux et une colle (il faut bien la choisir car elle
  peut faire des réactions chimiques avec des matériaux comme le
  polystyrène).</p>

MYTABLE(4,90,STRONG(Nom),STRONG(Quantité),STRONG(Prix unitaire
(euro)),STRONG(Remarques), Moteur électrique courant continu
à balais
MYMOTEURS_GRAUPNER,4,5,Poids: 16 g. Poussée max.: xxg en lui
fournissant 8.5V et 1.2A (avec 1 résistance 1&Omega; en
série). Equivalent au moteur
MYMOTEURS_GWS.,Hélice
à pas fixe inversé,2,?,Des hélices de cette taille
étant introuvables ...,Hélice à pas
fixe,4,2,... on est obligé d'utiliser quatre hélices
à pas fixe
EXTLINK(http://www.gws.com.tw/english/product/powersystem/edp50.htm,EP3020)
(taille: 3 pouces, pas: 2 pouces).,Gyroscope
pyézo-électrique
EXTLINK(,GWS PG03),3,25 sur Ebay,Ce qui nous intéresse ici
c'est uniquement le capteur gyro ENC-03
EXTLINK(http://www.murata.com/catalog/s42e3.pdf,datasheet). Cette
méthode est la plus économique (prix et
difficulté des soudures à réaliser) mais nécessite de
ITALIQUE(bidouiller) le gyroscope (voir LINK(helico_electro-LANG.html,ici)).,
Accéléromètre EXTLINK(http://www.analog.com/UploadedFiles/Data_Sheets/ADXL320.pdf,ADXL320),1,5,C'est le capteur le plus utile
: il indique la verticale quand l'hélicoptère a une vitesse constante. Vu la taille petite (4x4 mm) il est dur de
le souder manuellement mais il en existe déjà EXTLINK(http://www.robotshop.ca/accueil/fournisseurs/spark-fun-fr/accelerometre-adxl320-spark-fun.html,soudé).,Télémètre
EXTLINK(http://info.hobbyengineering.com/specs/SHARP-gp2y0d340_j.pdf,GP2Y0D340),1,15,Passe de l'état 0 à 1 à 40 cm d'un
obstacle.,Microcontrôleur
EXTLINK(http://ww1.microchip.com/downloads/en/DeviceDoc/39582b.pdf,PIC16F876A),2,4,Bien
pour sébuter et apprendre l'architecture PIC avec le cours de
BIGONOFF mais limité en puissance de calcul.
,Microcontrôleur dsPIC LINK(,dsPIC20F10),2,3,le dsPIC n'a que trois
sorties PWM. On peut en choisir un plus gros. Ici j'en ai choisi 2,Programmeur (ds)PIC,1,30
sur Ebay,On peut se construire son propre programmeur
JDM PIC., Câble
de rallonge pour port série (mâle/femelle point à point),1,4,Utile pour la communication
dsPIC/PC. Si on veut faire communiquer 2 PC il faut utiliser un câble
null modem (câble croisé, notamment Rx et Tx).,Tube de carbone creux
(diamètre 6 mm; longueur >
20 cm),2,?,Pour construire les deux axes de l'hélicoptère.,Plaque
d'aluminium,1,?,Pour construire l'attache qui maintiendra les 2 tubes de
carbon entre eux.,Tube rond de laiton 2 x 0.3 - 1 m,1,2,Serviront à Pour
construire les pieds qui rentreront dans les tubes de
carbone.,Cheville,4,1,Cheville que l'on met dans les murs pour mettre
une visse. Ici[,] sert à coincer les tiges de laiton dans les tubes de carbone.,
Alimentation de PC,1,60,Il n'y aura pas de batterie à cause de
leur poids. L'hélicoptère sera branché sur une alimentation
externe sortant du 12V[,] 9A max., STRONG(Total : hélicoptère 4
rotors),STRONG(1),STRONG(230 min.),
Un X-UFO coûte dans les 150 euro)

<p>STRONG(Note:) Avant l'utilisation des moteurs Micro Speed, des
   moteurs électrique à balais
   EXTLINK(http://www.netshop.nl/shop/krikkem/contents/nl/d231_01.html,Graupner
   Speed 195) (équivalent au moteur
   EXTLINK(http://www.gws.com.tw/english/product/powersystem/edp.htm,GW/EDP-05))
   étaient utilisés car ils étaient les plus petits/legers du
   marché. Leur poids est de 7 grammes pour ont une poussée de 30
   grammes maximum. Ils ont été remplacés par les microspeed car pas
   assez puissants.</p>

dnl SECTION(Construction de l'hélicoptère,helico)
SUBSECTION(Construction de la croix,croix)

<p>La structure de l'hélicoptère est constituée de deux tubes en fibre
   de carbone maintenus ensembles par deux pièces en aluminium
   façonnées à la main. L'ensemble est collé.</p>

<p>Les axes à de l'hélicoptère sont obtenus en coupant deux tubes en
  fibre de carbone de 20 cm de longueur. Ces tubes sont creux (diamètre
  6 mm) afin de pouvoir insérer les tiges de laiton qui serviront de
  pieds. Ces fibres de carbone constituent un matériau très léger mais
  qui amortit peu les vibrations. Il faut donc être attentif aux
  EXTLINK(http://fr.wikipedia.org/wiki/R%C3%A9sonance,modes propres)
  de la structure. Dans notre cas, du fait de la petite dimension de
  l'hélicoptère, ces modes propres ne sont pas gênants.</p>

<p>Les deux tubes de carbone sont attachés ensemble grâce à la plaque
  d'aluminium. Il faut découper deux carrés de longueur arbitraire
  MATHS(C) dans la plaque d'aluminium et dessiner sur chaque carré le
  LINK(helico/schemas/patron_croix.jpg,patron de la figure ci dessous
  gauche).</p>

TABLEAU(2,CAPTION(helico/schemas/attaches/patron_croix.jpg),
LOWCAPTION(helico/photos/croix),Le patron,Les 2 attaches obtenues)

<p>Sur ce patron nous avons trois formes géométriques :</p>
<ul>
  <li>Les deux petits triangles (en pointillé) qui sont des
    parties à éliminer;</li>
  <li>Les deux grands triangles qui sont des parties à coller avec
    les deux autres triangles de la deuxième plaque;</li>
  <li>Le rectangle de longueur MATHS(L) arbitraire et de largeur
    MATHS(&pi;D) (où D doit être le diamètre des
    tubes de l'hélicoptère donc, ici, 6 mm)
    va s'enrouler autour d'une des deux tiges/axes de
    l'hélicoptère.</li>
</ul>

<p>Avec l'aide d'un étau, on plie les triangles le long des arêtes du
  rectangle et on enroule les rectangles sur les tubes de
  carbone. Avec de la colle super forte on colle l'ensemble. Avec des
  pinces à linge on presse les triangles afin de bien les coller
  ensemble. On obtient la LINK(helico/photos/croix_big.jpg,figure haut
  droit). Le fait de limer la surface des triangles aide à mieux
  coller les 2 plaques entre elles.</p>
<p>Attendre un jour entier, que la colle prenne ;-(</p>



SUBSECTION(Construction des attaches des moteurs,moteur)

<p>On va reprendre le même principe que pour la croix. Avec la
  plaque d'aluminium, on coupe quatre pièces selon le patron
  dessiné en dessous.</p>

TABLEAU(2,CAPTION(helico/schemas/attaches/patron_attache.jpg),
LOWCAPTION(helico/photos/attachehelicev2),Le patron,L'attache
obtenue.)

<p>Le rectangle de longueur 1.88 cm (&pi;D) et de largeur 1 cm va
s'enrouler autour du tube en fibre de carbone. Les deux rectangles
verticaux (1 x 4cm) se retrouveront côte à côte. Ils vont permettent
d'entourer le moteur. La surface du moteur est alors entièrement
recouverte. D'où une bonne surface de fixation pour la colle. Une
partie facultative (et qui n'a pas été utilisée) est le capuchon troué
(1 x 1.5 cm) qui se rabat sur le haut du moteur.</p>


SUBSECTION(Construction des pieds,pieds)

<p>On usinera la tige de laiton pour créer les quatre pieds de
   l'hélicoptère.  Comme les deux axes de l'hélicoptère reposent l'un
   sur l'autre, on coupera deux tiges parmi les quatre légèrement plus
   longues que les autres.  La différence de longueur est le diamètre
   de l'axe de l'hélicoptère. Avec l'étau, on plie les pieds en forme
   de L (figure ci dessous gauche).</p>

<p>Si les tiges de laiton sont trop fines pour entrer dans les axes de
   l'hélicoptère, on peut s'aider en les insérant de
   LINK(helico/cheville.jpg,cheville) en plastique pour mettre des visses
   dans les murs.</p>

TABLEAU(3,LOWCAPTION(helico/photos/pieces_patte),
LOWCAPTION(helico/photos/pieces_croix),
LOWCAPTION(helico/photos/h4hpattes),
Cheville et tige de laiton,
Les différentes parties à usiner,
hélicoptère final)


SUBSECTION(Construction de la carte des capteurs,capt)

<p>Cette carte est une plaque d'essai en epoxy que l'on peut détacher
  de la croix. Elle contient, pour l'instant, un gyroscope, un
  accéléromètre et un capteur de distance IR. Il reste de la place
  pour deux gyroscopes et un AOP avec ses résistances. Pour l'instant
  on utilise les cartes complètes des gyroscopes pour plus de facilité
  au niveau électronique mais elles prennent beaucoup de place. On
  optimisera la place plus tard en récupérant uniquement le
  capteur.</p>

TABLEAU(2,LOWCAPTION(helico/photos/capteurdessus),
LOWCAPTION(helico/photos/capteurdessous),Carte des capteurs vue de
dessus,Carte des capteurs vue de dessous)

<p>Cette carte est placée au dessus la croix de l'hélicoptère. Une
   deuxième carte électronique détachable portant l'électronique de
   contrôle et de puissance (PIC, AOP, MOSFET, régulateur), plus
   lourde, sera placée en dessous. Le centre de gravité de
   l'hélicoptère sera ainsi placé en dessous de la structure alors que
   le centre de poussée des hélices, lui, est placée au dessus.
   L'hélicoptère sera stable. Les deux cartes s'emboîteront
   ensemble.</p>

<p>En l'absence de la deuxième carte électronique, les moteurs sont
   retournés et la carte des capteurs se trouve en dessous de la
   structure. Ainsi, lorsque l'hélicoptère est attaché sur le banc
   d'essai, son centre de gravité se trouve ainsi sous l'axe de
   rotation. A l'équilibre stable, les hélices sont dirigées vers le
   haut et l'hélicoptère se comporte mécaniquement comme un pendule
   standard.</p>

<p>Le chapitre sur LINK(helico_asservissement-LANG.html,la partie
   asservissement) sera plus explicite sur comment stabiliser
   l'hélicoptère. Le chapitre sur
   LINK(helico_electronique-LANG.html,la parte électronique) sera plus
   explicite sur comment utiliser les signaux des capteurs.</p>

SUBSECTION(Construction des pieds de la balançoire,balanc)

<p>Le but du banc d'essai et de limiter les degrés de liberté laissés
   aux mouvement de l'hélicoptère. Les degrés libres sont : une
   rotation que l'on appellera tangage, une translation verticale pour
   pouvoir tester une version simplifiée du vol.  Lorsque le banc
   d'essai permet le seul tangage, on parlera de balançoire pour
   l'ensemble hélicoptère-banc d'essai. Le banc d'essai a été fait
   en Lego Technique pour des raisons de simplicité. Il doit être
   suffisamment haut pour pouvoir tester le capteur de proximité
   commutant à quarante centimètre. Elle doit aussi être
   suffisamment large pour pouvoir l'utiliser avec les quatre
   moteurs.</p>

<p>Un modèle simple de rotule a été, mis en place sur la version 1 de
   la balançoire, mais n'a pas (encore) servi.</p>

TABLEAU(3,LOWCAPTION(helico/photos/balancoirev1),
LOWCAPTION(helico/photos/helico_balan1),
LOWCAPTION(helico/photos/balancoirev2),
Version 1 avec rotule,Version 1 sans rotule,Version 2)

<p>Les trous dans les briques sont assez grands pour laisser passer la
   tige de laiton (alias pieds de l'hélicoptère).  L'ajout de tiges
   horizontales LEGO sur chacun des coins de la balançoire permet de
   bloquer les pieds (placés vers le haut) de l'hélicoptère s'il
   bascule trop (version 1 bis).</p>

<p>La version 2 de la balançoire a été agrandie avec des briques DUPLO
   et mesure maintenant 40 cm de haut. Deux barres verticales de LEGO,
   lisses et parallèle entre elles, ont été ajoutées afin d'étudier la
   régulation en altitude de l'hélicoptère. Le but est de laisser
   l'hélicoptère coulisser verticalement où un élastique permet de
   limiter sa chute (mais crée des frottements).</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_etapes,Etapes de la construction,helico_electronique,Construction de la carte électronique)
