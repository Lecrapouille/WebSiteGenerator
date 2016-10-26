dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Aide à l'écriture de noyaux d'exécutif pour le logiciel SynDEx)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_CV)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Raccourcis,Présentation,#intro,Histoire de la conduite automatique,#histoire,Cyber Cabi,#cycab,Travail effectué,#travail,Résumé,#resume),
LEFT_RUBRIC(Pages suivantes,Présenation,stages_presentation-LANG.html,Stage INRIA 2,stages_travail2-LANG.html,
Stage INRIA 1,stages_travail1-LANG.html,Download,stages_download-LANG.html),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Stage 1 : Résumé des activités)
SUBSECTION(Travail accompli,trav)

<p>Après ce stage, grâce à un outil que j'ai pu réaliser, appelé
   Editeur de Code, il est désormais possible d'associer un
   code source à des opérations provenant d'une application SynDEx. Un
   Editeur de Code est un simple éditeur de texte affichant le code
   source aux associé aux différentes phases d'une opération
   SynDEx.</p> <p>Le texte inséré par l'utilisateur est
   automatiquement formaté dans un langage
   EXTLINK(http://www.gnu.org/software/m4/manual/m4.html,m4) avec un
   squelette spécifique à SynDEx. La syntaxe complexe du langage
   EXTLINK(http://www.gnu.org/software/m4/manual/m4.html,m4) est alors
   cachée à l'utilisateur. Celui-ci n'a plus qu'à se soucier de
   l'implémentation de son code et la seule syntaxe reste celle du
   langage cible (C, assembleur, etc).</p>

SUBSECTION(Chronologie,chron)
<p>Mon stage s'est déroulé de la façon suivante :</p>
<ul>
  <li>Compréhension de la méthodologie AAA en lisant de la
  documentation (comme
  LINK(http://pauillac.inria.fr/cdrom/www/syndex/pub/execv4/execv4.pdf,ExecV4)),
  de maîtriser le fonctionnement de SynDEx en lisant des
  EXTLINK(http://www-rocq.inria.fr/syndex/v6/tutorial/tutorial.html,tutoriels).</li>
  <li>Conception de l'éditeur de code sous la forme d'une IHM en
  CamlTk, déboguage de l'IHM et portage sur Mac OS X.</li>
  <li>Trois semaines pour écrire un premier tutoriel concernant le
    fonctionnement de l'éditeur de code.</li>
  <li>Durant les trois premiers mois, en parallèle au stage, j'ai eu
    droit à une introduction à l'automatique et à utiliser Scicos
    l'éditeur de bloc diagrammes du logiciel Scilab. Cette initiative
    personnelle fut encouragée par mon maître de stage afin de créer
    un exemple en automatique pour montrer les capacités de
    SynDEx.</li>
  <li>Ecriture d'un deuxième tutoriel afin d'expliquer le
    fonctionnement de l'exemple. Il simule le fonctionnement d'une
    voiture suivant une autre et gardant une distance alors que la
    première peut accélérer ou ralentir. Cet exemple peut être
    téléchargé LINK(stages-downloads-LANG.html,ici)</li>
  <li>Participation à des réunions avec un des utilisateur-clients
    principaux de SynDEx : MBDA.</li>
</ul>

SUBSECTION(Appréciations par l'utilisateur
industriel MBDA de l'Editeur de Code,app)

<p>Ce travail était demandé par un des principaux utilisateur-clients
de SynDEx. Ils ont pu tester mon travail et ont apprécié les points
suivants :</p>
<ul>
  <li>Les ports d'entrées-sorties d'un opérateur ne sont plus désignés
  par leurs positions relatives mais, maintenant, par leurs noms. Ceci
  permet d'éviter de nombreux problèmes lors de la génération de code
  lorsqu'elle devait être fait à la main.</li>
  <li>Le code est beaucoup plus lisible, puisque le squelette en langage
  m4 a disparu.</li>
  <li>Tous les moyens d'édition de code sont directement intégrés dans
  l'IHM de SynDEx. Plus besoin d'éditer plusieurs fichiers textes pour
  faire la même chose.</li> </ul>

SUBSECTION(Expérience acquise,exp)
<p>Ce stage m'a permis de m'améliorer dans les points suivants :</p>
<ul>
<li>De découvrir les problèmes d'ordonnancement et de
temps réel,</li>
<li>D'avoir eu une introduction aux problèmes d'automatique.</li>
<li>De progresser dans la connaissance du langage OCaml (pour
l'anecdote : notre équipe partage le même bâtiment que les
créateurs de Caml).</li>
</ul>

divert(DIVERT_FOOTER_CODE)

END_BODY(stages_presentation,Présentation INRIA,stages_travail2,Stage 2)
