dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

dnl ICON_UPDATED STRONG(Page en cours de rédaction).

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,
Les projets amateurs existants,#xufo,
Les projets commerciaux existants,#comm,
Livres sur la mécanique des hélicoptères,#bouquins,
Logiciels utilisés,#logo,
Documentation des logiciels,#doclog,
Livres et cours d'automatique,#auto,
Microcontrôleur et électronique,#elec),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Bibliographie et liens,biblio)

SUBSECTION(Les projets amateurs concernant les quadricoptères,xufo)

<p>Voici en vrac les liens qui ont retenus mon attention, concernant
  la construction de quadricoptère et autre croix volante. N'hésitez
  pas à m'envoyer un mail pour compléter cette page.</p>

<ul>
  <li>DRAP_FR XBIRD L'indispensable forum français où tous les
      passionnés de croix volante viennent se rencontrer pour
      partager leur connaissance.</li>

dnl CENTER(CAPTION(img/xbird.gif,http://forum.xbird.fr/))

  <li>DRAP_FR CRACMIKE Un excellent projet français de
      construction de plate-forme volante de grande taille. Avantages
      de ce site : les caractéristiques de l'électronique et de la
      mécanique y sont décrites. Inconvénients : le schéma
      électronique, le programme et le modèle physique de
      l'hélicoptère ne sont pas expliqués.
  </li>

  <li>DRAP_FR XNICO Un autre projet français de plate-forme
      volante (non fini). Des explications très claires y sont données
      concernant l'électronique (transistors), le dsPIC, et la
      carcasse de l'engin.</li>

  <li>DRAP_FR SPACEMAN Blog concernant la construction de
      nombreux prototypes de quadricoptère. Explications et code
      source pour dsPIC fournis.</li>

  <li>DRAP_FR SERGIO Site concernant de nombreux projets en
      aéromodélisme dont un projet quadricoptère.</li>

<li>DRAP_FR PHIL Autre projet français. Très belle carcasse et
      qui a aussi été modélisée en 3D.</li>

  <li>DRAP_DE UAVPL Projet allemand open source.</li>

  <li>DRAP_DE MIKROKOPTER Un autre projet allemand.</li>

  <li>DRAP_DE PLUSPETITSH4H Projet allemand avec des engins de
      petites tailles.</li>

  <li>DRAP_EN JOSEJ Autre hélicoptère de petite
      taille. Contrairement aux projets de l'EPFL (voir ci après),
      JoseJ utilise quatre moteurs tournant dans le même sens au lieu
      de deux dans le sens direct et deux dans les sens indirect. Il
      stabilise l'hélicoptère (force de torsion) avec un
      aileron. Citation : ITALIQUE(I had constructed other multirotor
      helis (bigger) but they have the disadvantage that I need to
      make CW and CCW propellers to correct and control the torque
      effect. This micro heli use standard and cheap motors and props
      (no CW and CCW props) and I correct the torque effect with a
      twist in the two ailerons motors, so I have yaw control).</li>

  <li>EXTLINK(http://www.rcgroups.com/forums/showthread.php?t=394375,rcgroups)
    Les soucoupes volantes existent belle et bien et pour preuve ...</li>

  <li>DRAP_FR
      EXTLINK(http://asl.epfl.ch/research/projects/VtolIndoorFlying/indoorFlying.php,ASL/EPFL)
      et EXTLINK(http://asl.epfl.ch/member.php?SCIPER=149618,ASL/EPFL) Des
      élèves et des professeurs de l'Ecole Polytechnique Fédérale de
      Lausanne (EPFL) ont aussi étudié et réalisé des plateformes
      volantes.
  </li>

  <li>DRAP_EN
    Samir Bouabdallah, Pierpaolo Murrieri, Roland Siegwart,
    LINK(http://asl.epfl.ch/aslInternalWeb/ASL/publications/uploadedFiles/325.pdf,Design and Control of an Indoor Micro Quadrotor),

    Samir Bouabdallah,
    LINK(http://asl.epfl.ch/aslInternalWeb/ASL/publications/uploadedFiles/330.pdf,PID
    vs. LQ Control Techniques Applied to an Indoor Micro Quadrator)

    Ce sont les documents les plus importants concernant la
    modélisation physique et la stabilisation d'un hélicoptère.
  </li>

  <li>DRAP_EN DRAP_FR Pierre-Olivier Latour, ITALIQUE(Computer based
      control system for a model helicopter), 2002.  André Noth,
      ITALIQUE(Synthèse et implémentation d'un contrôleur pour Micro
      Hélicoptère à 4 rotors), Février 2004, Marc Kunze,
      ITALIQUE(Hélicoptère indoor), Février 2003.

      Documents réaliser par des élèves de l'APFL (le meilleur est le
      premier de la liste). On peut les télécharger respectivement
      LATOUR, NOTH, KUNZE.</li>
</ul>

SUBSECTION(Projets commerciaux,comm)

<ul>
  <li>DRAP_EN MICRODRONE Sûrement les plus belles plates-formes volantes
      ... et les plus chères </li>

  <li>DRAP_EN X_UFO ENGAGER DRAGANFLYER D'autres versions mais à des
      prix plus abordables.</li>

 <li>DRAP_FR EXTLINK(http://ovirc.free.fr/Tribelle.php) Il est
     possible d'enlever un moteur au quadrirotor on obtient une
     tribelle ou Y-UFO.</li>

</ul>

SUBSECTION(Livres sur la mécanique des hélicoptères,bouquins)
<ul>
<li>Bible 1</li>
<li>Bible 2</li>
<li>Histoire Hélicoptère BD</li>
<li>Histoire hélicoptère</li>
</ul>

SUBSECTION(Logiciels utilisés pour la construction de mon H4H,logo)

<ul>
  <li>DRAP_EN DRAP_FR La page principale de SCILAB. C'est un logiciel
      libre pour le calcul scientifique, c'est un interpréteur de
      langage manipulant des objets mathématiques typés
      dynamiquement. Il inclut de nombreuses fonctions spécialisées
      pour le calcul numérique organisées sous forme de librairies ou
      de boites à outils qui couvrent des domaines tels que la
      simulation, l'optimisation, et le traitement du signal et du
      contrôle.
  </li>

  <li>DRAP_EN DRAP_FR La page principale de SCICOS. C'est une des
      boites à outils les plus importantes de Scilab. C'est un éditeur
      graphique de bloc diagrammes permettant de modéliser et de
      simuler des systèmes dynamiques. Il est particulièrement utilisé
      pour modéliser des systèmes où des composants
  </li>

  <li>DRAP_EN La page principale de SYNDEX. C'est un logiciel de CAO
      mettant en oeuvre la méthodologie Adéquation Algorithme
      Architecture (AAA) pour le prototypage rapide et l'optimisation
      de la mise en oeuvre d'applications distribuées temps réel
      embarquées. A partir d'un algorithme et d'une architecture
      donnés sous forme de graphe SynDEx génère une implémentation
      distribuée de l'algorithme en macro-code m4.
  </li>

  <li>DRAP_EN l'IDE MPLAB de Microchip. Tourne seulement sous Windows
      et permet de compiler des programmes pour PIC et dsPIC puis de
      les flasher et de le déboguer. Il faut installer le compilateur
      C30 pour dsPIC.</li>

  <li>DRAP_EN La page principale de PROTEUS. C'est un logiciel de
      simulation de circuit électronique (analogique et numérique). Il
      peut s'interfacer avec Mplab et simuler un microcontrôleur PIC
      sur sa carte.</li>

  <li>DRAP_EN La page principale de KTechlab :
      EXTLINK(http://ktechlab.org/)</li>

<li>DRAP_EN La page principale de Qucs :
    EXTLINK(http://qucs.sourceforge.net/screenshots.html)
    KTechlab et Qucs sont des simulateurs de circuits intégrés
    gratuits. Je ne les ai personnellement pas testés.</li>
</ul>


SUBSECTION(Documentation des logiciels,doclog)

<ul>
  <li>DRAP_EN Stephen L. Campbell, Jean-Philippe Chancelier and Ramine
      Nikoukhah, ITALIQUE(Modeling and Simulation in Scilab/Scicos),
      Springer, 2005.

      Ce livre est un tutoriel sur l'utilisation de Scilab et de
      Scicos et s'attarde sur ses outils de simulation et de
      modélisation.
  </li>

  <li>DRAP_FR \bibitem{scibook}XXX TODO

    Ce livre est un autre tutoriel sur l'utilisation de Scilab et de
    Scicos en plus simple mais il date un peu.
  </li>

  <li>DRAP_FR SAPHIR Tutoriels sur Scilab/Scicos tirés du LINUXMAG.
  </li>

  <li>DRAP_FR Thierry Grandpierre, Christophe Lavarenne, Yves Sorel,
      EXECV4, INRIA, 1998.  Ce document s'adresse aux concepteurs
      d'applications distribuées temps réel embarquées, qui désirent
      optimiser l'implantation de leurs algorithmes de commande et de
      traitement du signal et des images sur des architectures
      multiprocesseurs. Il s'adresse ensuite plus particulièrement aux
      utilisateurs du logiciel SynDEx qui supporte la méthodologie
      AAA.
  </li>

  <li>DRAP_FR Yves Sorel, ITALIQUE(Génération automatique d'exécutifs
      distribués temps réel embarqués optimisés pour SoC) Génération
      automatique d'exécutifs avec le logiciel SynDEx.
  </li>
</ul>


SUBSECTION(Livres et cours concernant l'automatique,auto)

<ul>
  <li>DRAP_FR Pierre Faure et Michel Depeyrot, ITALIQUE(Eléments
      d'automatique), Dunod, 1974. Livre sur l'automatique, complet
      mais pas le plus simple pour débuter.
  </li>

  <li>DRAP_EN ITALIQUE(Control System Design). Karl Johan &Aring;ström est un
      personnage important dans l'univers de l'automatique. Ses cours
      sont téléchargeables sur son site
      EXTLINK(http://www.control.lth.se/~kja/) Ils sont complets et
      très biens pour débuter dans l'automatique.
  </li>
</ul>

SUBSECTION(Microcontrôleur et électronique,elec)

<ul>
  <li>DRAP_FR EXTLINK(http://www.abcelectronique.com/bigonoff/) Le site de
      Bigonoff contenant tous les cours INDISPENSABLES ET GRATUITS
      pour maîtriser la programmation assembleur des PIC de Microchip
      (16F84, 16F876, 16F877, 16F87x(A), 18Fxx8). Merci Bigonoff pour
      cette aide précieuse !
  </li>
</ul>

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_photos,Photos et vidéos,,)
