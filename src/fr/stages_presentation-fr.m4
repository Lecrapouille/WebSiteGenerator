dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Stages à l'INRIA Rocquencourt, équipe AOSTE)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_CV)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Raccourcis,Présentation,#intro,Histoire de la conduite automatique,#histoire,Cyber Cabi,#cycab,Travail effectué,#travail,Résumé,#resume),
LEFT_RUBRIC(Pages suivantes,Présenation,stages_presentation-LANG.html,Stage INRIA 2,stages_travail2-LANG.html,
Stage INRIA 1,stages_travail1-LANG.html,Download,stages_download-LANG.html),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Contexte du stage)
SUBSECTION(Présentation du stage de fin de tronc commun,pres)

<p>J'ai été deux fois développeur stagiaire dans l'équipe
   EXTLINK(http://www.inria.fr/recherche/equipes/aoste.fr.html,AOSTE)
   à l'EXTLINK(http://www.inria.fr/,INRIA Rocquencourt). Le but de mon
   premier stage était de concevoir un outil d'aide à la conception
   des noyaux d'exécutif temps réel du logiciel
   EXTLINK(http://www-rocq.inria.fr/syndex/,SynDEx). Le deuxième était
   d'utiliser SynDEx, Scilab et Scicos pour créer une application de
   conduite automatique pour voiture CyCab.</p>

<p>SynDEx est un logiciel de CAO niveau système, supportant la
   méthodologie, pour le prototypage rapide et pour optimiser la mise
   en oeuvre d'applications distribuées temps réel embarquées.</p>

<p>C'est un logiciel graphique interactif qui offre les services
suivants :</p>
<ul>
  <li>spécification et vérification d'un
  algorithme d'application saisi sous la forme d'un graphe flot de
  données conditionné (ou interface avec les langages
  Synchrones tels que SIGNAL),</li>
  <li>spécification d'un graphe d'architecture multicomposant
  (processeurs et/ou composants spécialisés),</li>
  <li>heuristique pour la distribution et l'ordonnancement de l'algorithme
  d'application sur l'architecture, avec optimisation du temps de réponse,</li>
  <li>visualisation de la prédiction des performances temps réel pour le
  dimensionnement de l'architecture,</li>
  <li>génération des exécutifs distribués
  temps réel, sans interblocage et principalement statiques, avec
  mesure optionnelle des performances temps réel. Ceux-ci sont
  construits, avec un surcoût minimal, à partir d'un noyau
  d'exécutif dépendant du processeur cible.  Actuellement
  des noyaux d'exécutifs sont fournis pour : SHARC, TMS320C40, i80386, MC68332,
  i80C196 et stations de travail Unix ou Linux.  Des noyaux pour
  d'autres processeurs sont facilement portés à partir des
  noyaux existants.</li>
</ul>

<p>Puisque les exécutifs distribués sont générés automatiquement, leur
   développement et leur mise au point sont éliminés, réduisant de manière
   importante le cycle de développement.</p>

SUBSECTION(L'INRIA Rocquencourt,rocq) <p>Faisant suite à l'IRIA créé en
1967, l'INRIA est un établissement public à caractère scientifique et
technologique (EPST) placé sous la double tutelle du ministre chargé
de la Recherche et de l'Industrie.</p>

<p>Les missions qui lui ont été confiées sont :</p>
<ul>
<li>entreprendre des recherches fondamentales et appliquées,</li>
<li>réaliser des systèmes expérimentaux,</li>
<li>organiser des échanges scientifiques internationaux,</li>
<li>assurer le transfert et la diffusion des connaissances et du
savoir-faire,</li>
<li>contribuer à la valorisation des résultats de recherches,</li>
<li>contribuer, notamment par la formation, à des programmes de
coopération avec des pays en voie de développement,</li>
<li>effectuer des expertises scientifiques.</li>
</ul>

<p>Les chercheurs en mathématiques, automatique et informatique de l'INRIA
collaborent dans les cinq thèmes suivants :</p>
<ul>
<li>systèmes communicants,</li>
<li>systèmes cognitifs,</li>
<li> systèmes symboliques,</li>
<li>systèmes numériques,</li>
<li> systèmes biologiques.</li>
</ul>

SUBSECTION(Projet AOSTE Rocquencourt,aoste)
<p>Le sujet de ce stage s'inscrit dans les activités du projet
AOSTE : Modèles et Méthodes pour l'Analyse et
l'Optimisation des Systèmes Temps-Réel
Embarqués. Ce projet est bilocalisé à
Rocquencourt et Sophia Antipolis.</p>

<p>Les travaux de l'équipe concernent quatre axes de recherche :</p>
<ul>
<li>la modélisation de tels systèmes à l'aide de
la théorie des graphes et des ordres partiels,</li>
<li>l'optimisation d'implantation à l'aide :
 -- d'algorithmes d'ordonnancement temps réel dans le cas
    monoprocesseur, -- d'heuristiques de distribution et
    ordonnancement temps réel dans le cas
multicomposant (réseau de processeurs et de circuits
intégrés),</li><li>les techniques de
génération automatique de code pour processeur et pour
circuit intégré, en vue d'effectuer du
co-développement logiciel-matériel,</li>
<li>la tolérance aux pannes.</li>
</ul>

<p>Tous ces travaux sont réalisés avec l'objectif de
faire le lien entre l'automatique et l'informatique en cherchant
à supprimer la rupture entre la phase de
spécification/simulation et celle d'implantation temps
réel, ceci afin de réduire le cycle de
développement des applications distribuées temps
réel embarquées.</p>

<p>Ils ont conduit d'une part à une méthodologie
appelée AAA (Adéquation Algorithme Architecture) et
d'autre part à un logiciel de CAO niveau système pour
l'aide à l'implantation de systèmes distribués
temps réel embarqués, appelé SynDEx.</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(,,stages_travail1,Stage 1)
