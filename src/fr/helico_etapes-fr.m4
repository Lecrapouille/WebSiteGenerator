dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,Introduction,#intro,
Première étape: Balançoire avec Scicos dans la boucle,#scios,
Deuxième étape : Balançoire Autonome,#auto,
Troisième et quatrième étape : Simulation et réalisation d'un Quadrirotor,#quad),
BANNIERES)


divert(DIVERT_HEADER_CODE)


divert(DIVERT_NAVIGATION_CODE)


divert(DIVERT_BODY_CODE)

SECTION(Prévision du déroulement du projet)

SUBSECTION(Introduction,intro)

<p>Le projet se décompose en plusieurs étapes, chaque étape comprenant
   plusieurs phases.  Certaines phases peuvent être menées en
   parallèle d'autres demandent la réalisation de tâches
   préalables. Une tentative de planification avec affectation des
   tâches sera réalisée pour simuler les contraintes d'un projet
   industriel. L'absence d'expérience rendant très peu précise les
   estimations de temps, ce planning ne sera qu'indicatif.</p>

CENTER(CAPTION(helico/schemas/helicoiter.jpg))

SUBSECTION(Première étape: Balançoire avec Scicos dans la
boucle,scicos)

<p>Le but de cette étape est d'obtenir un ordinateur et un embryon
   d'hélicoptère capables de communiquer entre eux. Cette étape se
   décompose en plusieurs tâches.</p>

<!-- simul Scilab 1/4 helico -->
<p>La première tâche consiste à modéliser et à simuler la dynamique
   d'un quart d'hélicoptère (que l'on appelle aussi demi
   balançoire). La figure (LINK(helico/schemas/helicoiter.jpg,cliquer
   ici)) montre la demi balançoire. La simulation et la conception de
   la commande est réalisée grâce à un logiciel de calcul numérique
   (notre choix s'est porté sur le logiciel SCILAB qui est
   l'équivalent de Matlab mais qui est libre). La commande est du type
   PID, placement de pôles ou LQG. La demi balançoire est modélisée
   comme un système linéaire mono entrée (accéléromètre ou gyroscope)
   mono sortie (moteur/hélice). Le but de cette tâche est de simuler
   la dynamique de la balançoire et sa stabilisation à
   l'horizontale.</p>

<!-- %TODO: figure demi balançoire -->

<!-- PIC  PC (RS232) Carte d'acquisition -->
<p>La deuxième tâche consiste à réaliser un circuit électronique
   permettant la communication entre ordinateur (PC standard) et un
   microcontrôleur embarqué (notre choix se porte sur des PIC du
   fabricant MICROCHIP pour des raisons de prix, de disponibilité et
   de qualité de la documentation disponible). Le microcontrôleur
   réalise les entrées-sorties et sous-traite:</p>

<ul>
<li> les calculs de la loi de commande (fonctionnement normal),</li>
<li> l'identification des paramètres le débugage de la loi de commande
à l'ordinateur (mode développement).</li>
</ul>

<p>En effet, un PC standard dispose d'une puissance de calcul et d'un
   environnement logiciel sans commune mesure avec ceux disponibles
   sur un microcontrôleur. Cette tâche permet de se doter d'outils
   analogues à ceux disponible dans les laboratoires d'électronique
   disposant de générateurs de signaux, d'oscilloscope, d'analyseur de
   spectre numériques (10 bits) dans une bande de fréquence de 0 à
   1 kHz.</p>

<p>La communication se fait soit par un port série soit par un port
   USB (qui est beaucoup plus rapide que le port série) soit par
   radiocommande (pour les consignes). Le laboratoire numérique est
   alors la boîte à outils SCICOS de Scilab qui est l'analogue de
   Simulink pour Matlab (éditeur de blocs diagrammes).</p>

<!-- Scilab dans la boucle. -->
<p>La troisième tâche consiste à construire (matériellement) la demi
   balançoire avec le microcontrôleur embarqué. Le bloc diagramme
   'dynamique' du logiciel de simulation est alors remplacé par la
   'véritable' dynamique de la balançoire acquise grâce au
   microcontrôleur embarqué. Scicos calcule le feedback en faisant des
   calculs flottants et renvoie le résultat au microcontrôleur qui
   implémente en ligne le résultat. En fin de compte le
   microcontrôleur de la balançoire fait l'acquisition des données du
   gyroscope (ou accéléromètre), les envoie à l'ordinateur. Ce dernier
   calcule la commande et renvoie le résultat au
   microcontrôleur. Celui-ci envoie par sa sortie PWM la commande au
   moteur (et donc à l'hélice). La balançoire doit se stabiliser.</p>


SUBSECTION(Deuxième étape : Balançoire Autonome,auto)

<p>Le but est de retirer l'ordinateur de la boucle et de le remplacer
   par un microcontrôleur spécialisé qui réalise la loi de commande à
   la place du PC. Cette étape se fait en plusieurs
   phases. L'ordinateur travaille en flottant et le microcontrôleur en
   entier 8 ou 16 bits, on doit vérifier que la quantification
   (erreurs d'arrondis) se fait bien et que la balançoire arrive
   encore à être stabilisée en présence de cette quantification.</p>

<!-- Simul Scilab 1/4 helico + emul dsPIC -->
<p>La première tâche consiste, alors, à concevoir un logiciel émulant
   le fonctionnant du microcontrôleur spécialisé, pour ajouter un bloc
   diagramme 'microcontrôleur' dans le logiciel de calcul
   numérique. Ce nouveau bloc diagramme remplacera l'ancien bloc
   diagramme 'contrôleur'. Il permettra de vérifier et de corriger les
   erreurs de la quantification en simulation.</p>

<!-- 1/4 helico autonome avec 2 PICs -->
<p>La deuxième tâche consiste à insérer le microcontrôleur spécialisé
   sur la balançoire. Elle possède alors 2 microcontrôleurs. Le
   premier s'occupe de la communication avec l'ordinateur et fait
   l'acquisition des données de l'accéléromètre (ou gyroscope) et continue
   à envoyer le signal au moteur. Le deuxième fait les calculs de la
   loi de commande. Il cumule les possibilités d'un microcontrôleur et
   d'un DSP on pense au dsPIC de Microchip pour rester consistant avec
   le choix du premier microcontrôleur. On peut penser à simuler le
   réseau de microcontrôleurs au moyen de logiciels tel que
   SynDEx. L'ordinateur ne fait plus de calcul mais envoie des
   consignes et continue de gérer le débugage. Il garde la possibilité
   de demander au microcontrôleur (celui qui gère la communication) la
   main pour faire les calculs ou l'acquisition de données (mais en
   régime normal c'est le microcontrôleur spécialisé qui fait les
   calculs).</p>


SUBSECTION(Troisième et quatrième étape : Simulation et réalisation
d'un Quadrirotor,quad)

<p>A cette étape, la balançoire peut marcher de façon autonome sans
   l'ordinateur, mais garde la possibilité de communiquer avec lui
   (débugage, ajout rapide de filtres, etc.). Il reste ensuite à
   itérer ces étapes en complexifiant le modèle de
   l'hélicoptère. D'où, simulation complète du quadrirotor avec Scilab
   et apprentissage de la mécanique du solide.</p>

<p>Si on dispose de suffisamment de temps, une réalisation complète du
   quadrirotor sera faite en utilisant la méthodologie mise au point
   sur la balançoire (réalisation d'une autre balançoire) et ajout de
   la régulation des 3 axes de libertés, d'abord sur le banc d'essai
   (sur une rotule) puis en vol libre.</p>

<p>Un résumé graphique des différentes étapes du projet est montré sur
   la LINK(helico/schemas/helicoiter.jpg,figure suivante).
</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_intro,Présentation du projet,helico_mecanique,Construction de la carcasse)
