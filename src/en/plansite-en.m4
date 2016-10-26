dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Plan du site)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_HOME)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(
LEFT_RUBRIC(Embedded and real time project,
            Four rotor-heads helicopter,helico_intro-LANG.html,
            Automatic following of CyCab cars with SynDEx and Scicos software,stages-travail2-LANG.html),

LEFT_RUBRIC(Tutorials about real time,
            Scilab/Scicos software,tuto_scicos-LANG.html,
            SynDEx software,tuto_syndex-LANG.html,
            Programming the serial link,comm_rs232-LANG.html),

LEFT_RUBRIC(Computer Science Projects,Forth Interpretor,myforth-LANG.html,
            The SimTaDyn Project,simtadyn-LANG.html,
            The Ecstasy Project,ecstasy-LANG.html,
            The SpeedWay Project,speedway-LANG.html),

LEFT_RUBRIC(Tutorials,
            Study of a car dynamic,dyna-LANG.html,
            Trees for a binary space partioning of a 2D/3D scenes,bsp-LANG.html,
            3D Studio Max ASE importation,ase-LANG.html),

LEFT_RUBRIC(Personal Skills,
            My resume,cv-LANG.html,
            My two internships at INRIA (the french national institute for research in computer science and control),syndex_presentation-LANG.html),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Detailed access)
BOX
LISTE(
    Embedded and Real Time projects:
    LISTE(Four rotor-heads helicopter:
        LISTE(MYLINK(helico_intro,Purpose),
              MYLINK(helico_etapes,Construction design stages),
              MYLINK(helico_mecanique,Frame construction),
              MYLINK(helico_electronique,Electronic card construction),
              MYLINK(helico_codegene,Automatic code generation),
              MYLINK(helico_asservissement,Servo-control of the helicopter fly),
              MYLINK(helico_download,Download),
              MYLINK(helico_biblio,Bibliography),
              MYLINK(tuto_scicos,Presentation of Scilab/Scicos software),
              MYLINK(tuto_syndex,Presentation of SynDEx software),
              MYLINK(comm_rs232,Introduction to serial link programmation),
        ),
        Cars:
        LISTE(MYLINK(stages_travail2,Work made for my internship),
              MYLINK(stages_downloads,Download),
              MYLINK(tuto_dyna,Simple study of the dynamic of the car)
        ),
        Forth interpretor (stopped project):
        LISTE(MYLINK(myforth,Forth))
    ),
    Computer Science Projects (3D project):
    LISTE(MYLINK(speedway,SpeedWay Project),
          MYLINK(ecstasy,Ecstasy Project),
          MYLINK(simtadyn,SimTaDyn Project)
    ),
    Tutorials:
    LISTE(MYLINK(tuto_bsp,Discard hidden parts in a 3D scene),
          MYLINK(tuto_ase,3D Studio Max ascii exportation file))
    ),
    Professional skills:
    LISTE(My internships at the french national institute for research in computer science and control:
        LISTE(MYLINK(stages_presentation,Purpose),
              MYLINK(stages_travail1,First internship),
              MYLINK(stages_travail2,Second intership),
              MYLINK(stages_downloads,Download)
        )
    ),
    MYLINK(cv,Mon resume)
)

divert(DIVERT_FOOTER_CODE)

END_BODY(index,Page d'acceuil,maj,Mise à jour du site)
