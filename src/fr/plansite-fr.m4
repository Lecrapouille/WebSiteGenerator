dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Plan du site)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_HOME)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(
LEFT_RUBRIC(Projets sur le temps réel,Projet Hélicoptère quatre
rotors,helico_intro-LANG.html,Suivi automatique de voiture
CyCab,stages-travail2-LANG.html),

LEFT_RUBRIC(Tutoriels sur le TR,Le logiciel Scilab/Scicos,tuto_scicos-LANG.html,Le logiciel SynDEx,tuto_syndex-LANG.html,
Programmation du port série,comm_rs232-LANG.html),

LEFT_RUBRIC(Projets Informatiques,Interpréteur
Forth,myforth-LANG.html,SimTaDyn,simtadyn-LANG.html,Ecstasy,ecstasy-LANG.html,SpeedWay,speedway-LANG.html),

LEFT_RUBRIC(Tutoriels,Dynamique d'une voiture,dyna-LANG.html,Les
arbres de partitionnement binaire de l'espace,bsp-LANG.html,Chargeur
de fichier ASE,ase-LANG.html),

LEFT_RUBRIC(Expérience professionnelle,CV,cv-LANG.html,Stages à
l'INRIA Rocquencourt,syndex_presentation-LANG.html),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Accés détaillé)
BOX
LISTE(
    Projets temps réel :
    LISTE(Hélicoptère quatre rotors :
        LISTE(MYLINK(helico_intro,Présentation),
	      MYLINK(helico_etapes,Etapes de la construction),
	      MYLINK(helico_mecanique,Construction de la carcasse),
	      MYLINK(helico_electronique,Construction de la carte électronique),
	      MYLINK(helico_codegene,Génération automatique de code),
	      MYLINK(helico_asservissement,Asservissement de l'hélicoptère),
	      MYLINK(helico_download,Téléchargement),
	      MYLINK(helico_biblio,Bibliographie),
              MYLINK(tuto_scicos,Présentation du logiciel de modélisation et de simulation Scilab/Scicos),
              MYLINK(tuto_syndex,Présentation du logiciel de SynDEx),
              MYLINK(comm_rs232,Introduction au port série (RS232)),
	      MYLINK(helico_obsolete,Trucs obsolètes)
        ),
        Voiture CyCab :
	LISTE(MYLINK(stages_travail2,Travail effectué),
	      MYLINK(stages_downloads,Téléchargement),
              MYLINK(tuto_dyna,Etude simple de la dynamique d'une voiture)
        ),
        Interpréteur Forth (stopé) :
	LISTE(MYLINK(myforth,Forth))
    ),
    Projets informatiques (3D) :
    LISTE(MYLINK(speedway,Projet SpeedWay),
          MYLINK(ecstasy,Projet Ecstasy),
          MYLINK(simtadyn,Projet SimTaDyn)
    ),
    Tutoriels :
    LISTE(MYLINK(tuto_dyna,Etude simple de la dynamique d'une voiture),
          MYLINK(tuto_bsp,Elimination des parties cachées dans une scène 3D),
          MYLINK(tuto_ase,Format ascii d'exportation de scène 3D de 3D Studio Max),
          MYLINK(tuto_scicos,Présentation du logiciel de modélisation et de simulation Scilab/Scicos),
          MYLINK(tuto_syndex,Présentation du logiciel de SynDEx),
          MYLINK(comm_rs232,Introduction au port série (RS232))
    ),
    Expérience professionelle :
    LISTE(Stages à l'INRIA Rocquencourt (équipe AOSTE) :
	LISTE(MYLINK(stages_presentation,Présentation),
	      MYLINK(stages_travail1,Stage 1),
              MYLINK(stages_travail2,Stage 2),
	      MYLINK(stages_downloads,Téléchargement)
        )
    ),
    MYLINK(cv,Mon C.V.)
)

divert(DIVERT_FOOTER_CODE)

END_BODY(index,Page d'acceuil,maj,Mise à jour du site)