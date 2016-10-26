dnl -*- html -*- Coloration Syntaxique pour Emacs
divert(DIVERT_HEADER_CODE)

DEF_TITLE(Mises à jour du site)
DEF_KEYWORDS()
DEF_DESCRIPTION()
MENU_ACTIF(MENU_HOME)

divert(DIVERT_NAVIGATION_CODE)

LEFT_MENU(LEFT_RUBRIC(Raccourcis,Mise à jour,#maj,A venir,#todo),BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(MAJ du site,maj)
SUBSECTION(Octobre 2008 :)
LISTE(Tutoriel Scicos re-écrit.)

SUBSECTION(26 janvier 2007 :)
LISTE(Relecture partie électronique du projet H4H.,
MAJ du tutoriel vidéo de SynDEx.)

SUBSECTION(15 janvier 2007 :)

LISTE(Nettoyage du script M4 pour la génération automatique de fichiers HTML pour ce site.,
Modification de la mise en page : feuille de style compatible
IE[,]Firefox[,]Safari (enfin normallement).,
Ajout de photos de mon hélicoptère de meilleur qualité.,
Ajout des pages html suivantes :  MYLINK(stages_travail2,CyCab)[,]  MYLINK(comm_rs232,RS232)[,]
MYLINK(tuto_scicos,Scicos)[,]  MYLINK(tuto_syndex,SynDEx)[,]  MYLINK(helico_codegene,génération de code).,
Relecture et corrections des pages concernant la réalisation de
l'hélicoptère 4 rotors notamment la partie électronique.)

SECTION(TODO,todo)
SUBSECTION(A venir à court terme)
LISTE(Finir les tutoriels-vidéos sur SynDEx., Hélicoptère quatre rotors :
régulation/stabilisation[,] génération de code.,Continuer les
tutoriels concernant le port série[,] la génération automatique de code
et le projet H4H.)

SUBSECTION(A venir à moyen-long terme)
LISTE(Traitement de l'image avec une caméra FireWire[,] OpenGL[,] Cg
et les pixel shader (fragment program),Etudier le protocole Ecolage
(radiocommande Futaba) et USB avec PIC18F et Linux/Mac.,Réguler un
hélicoptère Graupner à partir d'un PC, une caméra FireWire et une
radiocommande Futaba.)


divert(-1)
SECTION(TODO,todo)
SUBSECTION(A venir à court terme (prévision fin décembre))

STRONG(MAJ le header et fichier éparpille photos de meilleur qualité UP footer)

LISTE(Traitement de l'image avec une caméra FireWire[,] OpenGL[,] Cg et les pixel shader (fragment program).,
Continuer les tutoriels concernant la génération automatique de code[,] SynDEx (vidéos-tutoriels)[,] USART.,
Connecter un joystick avec Scicos.)

SUBSECTION(A venir à moyen terme (pas de prévision))

LISTE(Hélicoptère quatre rotors : électronique[,] régulation/stabilisation[,] génération de code.,
Tutoriel sur le langage de macros M4.,
Correction script M4 génération de pages html (liste et header).)
divert(0)

divert(DIVERT_FOOTER_CODE)

END_BODY(plansite,Plan du site,cv,Mon CV)
