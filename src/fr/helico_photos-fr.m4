dnl -*- html -*- Coloration Syntaxique pour Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

dnl ICON_UPDATED STRONG(Page en cours de rédaction).

LEFT_MENU(CHANGE_LANG, HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,
Vidéos du prototype version 1,videos,
Photos en vrac du prototype version 1,photos),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Vidéos du prototype version 1,videos)
BOX
<!-- Ces vidéos ont été compressées au format Divx 4~:
<ul>
  <li>Vidéo STRONG(tangage) (décembre) : comportement de
    l'hélicoptère en réponse à des
    échellons de consigne d'inclinaison.</li>
  <li> Vidéo STRONG(limitepuissance) (octobre) : avec deux
    moteurs, au maximum de leur puissance, ce n'est sont pas encore
    suffisant pour faire décoller l'hélicoptère.
  <li> Vidéo STRONG(instable) (décembre) : avec deux
    moteurs au maximum de leur puissance, des problèmes de
    stabilité surviennent.</li>
</ul>-->

TABLEAU(3,
MOVIE(helico/videos/tangage.jpg,helico/videos/tangage.avi),
MOVIE(helico/videos/puissance.jpg,helico/videos/limitepuissance.avi),
MOVIE(helico/videos/instable.jpg,helico/videos/instable.avi),
Tangage,
Limite de puissance,
Instabilité,
3 Mo -- format DIVX,
4 Mo -- format DIVX,
3 Mo -- format DIVX)
ENDBOX

SECTION(Photos en vrac du prototype version 1,photos)
BOX
TABLEAU(3,
LOWCAPTION(helico/photos/carc),
LOWCAPTION(helico/photos/helicov2),
LOWCAPTION(helico/photos/h4hpattes),

LOWCAPTION(helico/photos/carte_capt1),
LOWCAPTION(helico/photos/capteurdessus),
LOWCAPTION(helico/photos/capteurdessous),
dnl Un ami a utilisé la méthodologie EXTLINK(http://www.la-rache.com/,La RACHE) pour rédiger le cahier des charges. Malheureusement le CDC s'est vu refusé la norme ISO-1664.,La rotule qui va maintenir l'hélicoptère.,,
LOWCAPTION(helico/photos/pieces_croix),
LOWCAPTION(helico/photos/croix),
LOWCAPTION(helico/photos/attachehelicev2),
dnl Pièces de la partie matérielle, La croix, Une hélice,
LOWCAPTION(helico/photos/balancoirev1),
LOWCAPTION(helico/photos/helico_balan1),
LOWCAPTION(helico/photos/balancoirev2),
dnl Hélico sans ses pattes, Quatre pattes de l'hélico, Tige de laiton et ,
LOWCAPTION(helico/photos/balancoire3),
LOWCAPTION(helico/photos/electronik),
LOWCAPTION(helico/photos/electronik1),

dnl Plein d'autres photos sont à venir,
dnl Partie élétronique: PIC 16f876; Max232; port série; accéléromètre; aop, Partie élétronique vue de haut, Helico et accelero sur sa balancoire,

LOWCAPTION(helico/photos/h4h_sans_pattes1),

dnl Carte des capteurs,helico et sa carte à clips,Partie matérielle finale,

LOWCAPTION(helico/photos/oscillo),
CAPTION(helico/schemas/helico_main.jpg)
)

divert(DIVERT_FOOTER_CODE)

END_BODY(helico_download,Téléchargement,
helico_biblio,Bibliographie)
