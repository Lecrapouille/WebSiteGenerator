dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Quentin Quadrat - Ingénieur informaticien des systèmes temps réel (EPITA))
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_HOME)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(
LEFT_RUBRIC(Raccourcis,Coordonnées,#coor,Etudes et compétences,#etudes,Projets informatiques à EPITA,#proj,Expérience professionnelle,#exp,Divers,#divers)
LEFT_RUBRIC(Download,CV en français,cv/QuentinQuadrat-cv-fr.pdf,CV in English,cv/QuentinQuadrat-cv-en.pdf),
BANNIERES)

divert(DIVERT_BODY_CODE)

<!-- CENTER(HUDGE(STRONG(Je recherche un CDI dans le domaine de l'informatique pour les systèmes
temps réel embarqués (je suis disponible dès septembre 2007)))) -->

SECTION(Coordonnées,coor)
BOX
<p id="coordo">
  <img id="photocoordo" src="img/quentin.jpg" alt="Quentin QUADRAT" />
  13 rue Stéphane Mallarmé<br />
  78760 JOUARS-PONTCHARTRAIN<br />
  Tél. 01 34 89 37 02<br />
  Tél. 06 28 14 69 81<br />
  E-mail: <a href="mailto:quentin DOT quadrat @T free DOT fr">quentin DOT quadrat @T free DOT fr</a><br />
  dnl	Page web: <a href="http://quentin.quadrat.chez-alice.fr">http://quentin.quadrat.chez-alice.fr</a><br />
  Page web: LINK(http://quentin.quadrat.free.fr)<br />
  CV (format PDF): EXTLINK(cv/QuentinQuadrat-cv-en.pdf,English) ou EXTLINK(cv/QuentinQuadrat-cv-fr.pdf,Français).<br />
</p>
ENDBOX

SECTION(Etudes et compétences,etudes)
SUBSECTION(Cursus scolaire)
<ul>
<li>STRONG(2001 -- 2007) <p>Etudes effectuées à l'EXTLINK(http:/www.epita.fr,EPITA) (Ecole Pour
  l'Informatique et les Techniques Avancées) avec la spécialisation GISTR
   (informatique des systèmes temps réel).</p>
</li>
<li>STRONG(2000 -- 2001)
<p>Bac scientifique au EXTLINK(http://www.ac-versailles.fr/etabliss/lyc-viollet-le-duc/,Lycée Polyvalent Viollet-le-Duc).</p></li>
</ul>


SUBSECTION(Langues pratiquées)
<ul>
  <li><b>Anglais</b> Niveau courant (TOEIC 775).</li>
  <li><b>Espagnol</b> Niveau lycée.</li>
</ul>

SUBSECTION(Connaissances en informatique)
<ul>
  <li>STRONG(Langages) C, C++, Java, OCaml, Delphi, Ruby, Scripts Shell,
    Forth, Common Lisp.</li>
  <li>STRONG(Langages outils) Flex, Bison, Camllex, Camlyacc, PostgreSQL, GTK,
    CamlTk, OpenGL, LaTeX, HTML, M4, CVS.</li>
  <li>STRONG(O.S.) Mac Os X, Linux, Unix BSD, Windows CE, QNX.</li>
  <li>STRONG(Modélisation) UML RT, SART.</li>
  <li>STRONG(Logiciels) Scilab (Matlab), Scicos (Simulink), SynDEx,
  Emacs, Eclipse, MaxPlus2, Mplab, Eagle, 3D Studio Max.</li>
  <li>STRONG(Notions) Automatique, électronique numérique (assembleur PIC 16F877A, dsPIC 30F2010), commande de moteur électrique CC, acquisitions de données (accéléromètre, gyroscope).</li>
</ul>


SECTION(Projets à l'EPITA,proj)
SUBSECTION(Projets temps réel)
<ul>
  <li>STRONG(EXTLINK(helico_intro-LANG.html,Draganflyer)) (projet en cours) Etude
    et réalisation d'un modèle réduit
    d'hélicoptère autonome à quatre hélices.</li>
  <li>STRONG(Microprocesseur) Conception et réalisation d'un
    microprocesseur RISC en VHDL avec le logiciel MaxPlus2.
  </li>
</ul>



SUBSECTION(Programmation Unix)
<ul>
  <li>STRONG(C/Unix) Nombreux projets en C réalisant
    les fonctionalités d'outils Unix (alloueur de mémoire,
    entrées-sorties tamponnées, pattern matching)
    ou utilisant des outils Unix (processus lourds et légers, signaux, watch dog).</li>
  <li>STRONG(Bash) Interpréteur de commandes shell (Bash)
    écrit en C (1 mois, 6 personnes).</li>
</ul>



SUBSECTION(Théorie des langages : interpréteur et compilateur)
<ul>
  <li>STRONG(Tiger) Compilateur du langage Tiger à partir d'un code
    à trous écrit en C++, Flex et Bison (4 mois, 4 personnes).</li>
  <li>STRONG(Lisp) Interpréteur Common Lisp en OCaml (7 jours, 3
    personnes).</li>
  <li>STRONG(Corewar) Machine virtuelle exécutant des programmes écrits en langage assembleur.</li>
  <li>STRONG(EXTLINK(myforth-LANG.html,Forth)) Interpréteur Forth (projet personnel).</li>
</ul>



SUBSECTION(Projets mathématiques)
<ul>
  <li>STRONG(Recalage) Trouver la transformation rigide qui met en correspondance un nuage de points avec une surface.</li>
  <li>STRONG(EDP) Résolution d'une équation aux dérivées partielles par la méthode des différences finies.</li>
  <li>STRONG(Bistro) Calculatrice ayant une  précision arbitraire (15 jours, 2 personnes).</li>
</ul>



SUBSECTION(Projets libres durant le cycle préparatoire)
<ul>
  <li>STRONG(EXTLINK(simtadyn-LANG.html,SimTaDyn)) Système d'informations 
    géographiques progammable en Forth ayant les fonctionnalités d'un
    tableur (1 an, 3 personnes, cahier des charges et rapport d'activité).</li>
  <li>STRONG(EXTLINK(ecstasy-LANG.html,Ecstasy)) Simulation simplifiée de la dynamique
    d'une voiture et de la circulation automobile dans une
    ville. Affichage en 3D (1 an, 2 personnes, cahier des charges et
    rapport d'activité).</li>
<li>STRONG(EXTLINK(speedway-LANG.html,Speedway)) Jeu 3D, OpenGL, Delphi (1 an, 3 personnes, cahier des charges et rapport d'activité).</li>
</ul>


SECTION(Expérience professionnelle,exp)

SUBSECTION(Eurogiciel : Août 2007)
<!-- <p>Développement sur des bus de communication pour la centrale inertielle de l'A400M (3 mois).</p> -->

SUBSECTION(INRIA : Janvier -- Juillet 2007)
Développeur stagiaire à
l'EXTLINK(http:/www.inria.fr,INRIA). Spécification et réalisation de
la loi de commande et du traitement d'image embarquées sur des
voitures EXTLINK(http://www-lara.inria.fr/cycabf/,CyCab) pour faire du
suivi automatique de véhicules munis de caméras bon marché.
L'architecture du système d'informations embarqué comprend un Linux
RTAI, 2 processeurs MPC555, 1 bus CAN et les logiciels Scical, Scicos et SynDEx.


SUBSECTION(INRIA : Septembre -- Décembre 2005)
<p>Développeur stagiaire à l'INRIA pour créer un
outil d'aide à la conception de noyau applicatif temps réel pour le
logiciel EXTLINK(http://www-rocq.inria.fr/syndex/,SynDEx), logiciel méttant en oeuvre la méthodologie STRONG(Algorithme Architecture Adéquation) pour l'optimisation de la mise en oeuvre d'applications distribuées temps réel embarquées :</p>
<ul>
  <li>Création d'une IHM pour formater automatiquement
    le code source de l'utilisateur dans un langage m4 avec
    un squelette spécifique à SynDEx.
    Langages utilisés : OCaml, CamlTk, Camllex, Camlyacc.</li>
  <li>Rédaction de tutoriels sur SynDEx et création d'une
    application simple en automatique. Logiciels utilisés : SynDEx,
    Scilab, Scicos.</li>
</ul>



SUBSECTION(CERMICS : Juillet -- Août 2004)
<p>Développeur stagiaire au CERMICS. Interface Scilab-OpenGL dans le but d'améliorer la vitesse et les fonctionnalités 3D de EXTLINK(http://www.scilab.org/,Scilab)</p>


SECTION(Divers,divers)
BOX
<ul>
  <li>Permis de conduire.</li>
  <li>Echecs, nombreuses  compétitions jusqu'à l'âge de 15 ans (niveau
  atteint : élo 2000).</li>
  <li>Voyages linguistiques en Angleterre.</li>
</ul>

divert(DIVERT_FOOTER_CODE)

END_BODY(plansite,Plan du site,,)
