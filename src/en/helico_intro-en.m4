dnl -*- html -*- Syntaxic coloration for Emacs
HELICO_HTML_BEGIN

divert(DIVERT_NAVIGATION_CODE)

dnl ICON_UPDATED STRONG(Page en cours de rédaction).

LEFT_MENU(CHANGE_LANG,HELICO_SUITE,
LEFT_RUBRIC(Raccourcis,Objectif du projet,#intro,
Principe de déplacement de la plateforme,#deplac,
Contraintes du projet,#contraintes,
Avancement du projet,#historique,
Table des matières,#tdm),
BANNIERES)

divert(DIVERT_BODY_CODE)

SECTION(Project overview,intro)
SUBSECTION(Purpose)

<p>This document introduces the realisation of a four rotor heads
   model helicopter and its electromecanic test bench. This work began
   in 2006 for an EPITA school project (specialisation in real time
   systems) and it's still in progress (although several stand by
   have slow down the project).</p>

<p>Main characteristics of my helicopter are the following. It's made
   of two carbon fibers (20 cm / 8 inches) gathered together in a
   cross form and kept by aluminum sheet. Four direct current motors
   are linked to the axis by aluminum clips. On the cross made by the
   two axis, are placed an electronic card with inertial sensors
   (three gyroscopes 1-axis, one accelerometer 2-axis) to perform the
   autonomous stabilization. A vicinity captor is used to detect the
   ground down to 40 cm (16 inches).</p>

LOWPICTURE(helico/photos/h4hpattes,Helicopter frame)

<p>The realisation of this project needs several ingeenring skills:
   LINK(helico_mecanique-LANG.html,mecanical construction),
   LINK(helico_electronique-LANG.html,electronic),
   LINK(helico_logiciel-LANG.html,computer science),
   LINK(helico_asservissement-LANG.html,automaton).  Each od these
   aspects will be discussed with more details in the next parts of
   this site.</p>

<p>Similar four-rotor heads model helicopters exist and can be bought
   as Draganflyer, Engager, X-UFO, Microdrones. There are also student
   projects like the Lausanne school EPFL or by model makers like
   MIKROKOPTER or UAVPL (for more details, see
   LINK(helico_biblio-LANG.html#xufo,bibliography)).</p>

TABLEAU(3,
CAPTION(helico/xufo.jpg),
CAPTION(helico/engager.gif),
CAPTION(helico/draganflyer.jpg),
X_UFO site,
ENGAGER site,
DRAGANFLYER site)

<p>In a general way, this helicopters are radio controled. This makes
   the realisation of the radio control protocol more difficult but
   which simplifies the stabilisation process because the human
   supervisor is eable to observe the helicopter behavior and
   compensate the inertial drift. Generaly in the aim to reduce the
   yaw torque, four-rotor heads model helicopters have two motors with
   counter clock wise propellers and two motors with anti-counter
   clock wise propellers. With smaller models, it's some time
   difficult to find anti-clock wise propellers. Motors have to be
   tilted in the aim to make thrust that compensate the torque
   effect. See the JOSEJ's thread. This method is also used in our
   case.</p>

SUBSECTION(How the helicopter can move ?,deplac)

<p>See the CRACMIKE's site for more details (french site). Click on
   the 'Comment ca marche' link ('How it works' link).</p>

SUBSECTION(Contraintes du projet,contraintes)

<p>STRONG(Moving.) In a first time, the helicopter has to be stay in
   stationary fly at 16 inches under the ground (40 cm).</p>

<p>STRONG(Size and weight constraints.) The frame of the helicopter
   wants its dimension and weight the most reduce as possible. The
   length is about 8 inches long (20 cm) and weight 200 grams. We have
   decided not to use commercial acquisition cards because of their
   weight and their price. The data aquisition is done by two dsPIC
   micrcontrolers. Currently, because of its weight, the electronic
   card is not yet embbeded in the frame.</p>

<p>STRONG(Environment strength.) The helicopter is design to make
   indoor flies with a minimun of environmental perturbations.</p>

<p>STRONG(Communication with a non embedded laptop.)  The helicopter
   communicates with a non embedded laptop thanks a serial link. The
   microcontroler send inertial data to the laptop. This last
   monitroring these data, help microtrolers to perform some complexe
   floating point calculus for the frame stabilisation and send
   results to embedded microcontrolers.</p>

<p>STRONG(Energy source.) The helicopter do not carry power
   supplies. It is powered by an on-ground laptop power supply. This
   allows maximun weight and infinite autonomy but this needs wires
   that make the fly instable. Smallest motors can consume 10W, so the
   autonomy is very few and lasts in generaly few minutes.</p>

SUBSECTION(Avancement du projet,historique)

<p>STRONG(Juilly -- December 2006.) The EPITA project ended with an
   embryo of two-rotor heads helicopter (so a half helicopter that I
   call a swing) that could not lift himself (the frame was too heavy
   for the two motors). A communication protocol problem with the I2C
   link prevented the two PIC16F876A to communicate together and
   prevent by the same way, the dependent control of the four
   motors.</p>

<p>STRONG(October 2007.) After a 6-months stand by, the project
   timidly reborns. A new version of the electronic card based on
   dsPIC microcontrolers has been released. A software chain tool is
   projected to make easier future hardware and software
   developments. The chain contains software like
   MYLINK(tuto_scicos,Scilab/Scicos), MYLINK(tuto_syndex,SynDEx),
   PROTEUS et MPLAB. A library for dsPIC30F and SynDEx written in C
   language is in progress.</p>

<p>STRONG(January 2008.) The use of the software Proteus VSM has
   allowed to find and fix problems in the electronic card. The
   automatic code generation for SynDEx worked well. It's nearly
   possible to generate thanks Scicos and SynDEx schema blocks a
   distributed algorithm into the helicopter architecture. Lot of
   input/output dsPIC periphericals has to be implemented. To be
   continued ...</p>

<p>STRONG(April 2008.) Sooner, the resumption of test on the swing !
   For the moment, the dsPIC and Scicos communicate to 50 Hz. Raw
   analogic values are sent by the dsPIC to the computer. This last
   plots data. PWM seem working. To do: keep Scicos blocks up to date
   for the fly regulation. For the moment, the code generation with
   SynDEx doesn't give good results so its development is in stand by
   mode because I prefer doing a functional first version of the soft
   *hand-written* than generated.</p>

<p>STRONG(June 2008.) The project didn't progress a lot because a miss
   of time. On the electric card, the PWM signals and the motor
   control signals have better forms. A pure delay on a transistor
   commutation has been fixed (because of a lack of skills on the
   subject this problem has been minimised, failing that be totaly
   fixed). Communication protocol betwenn laptop and dsPIC has been
   partialy debuged, but a problem is still non fixed: on Linux side,
   receptions are slow down when transmission are set. The correction
   of this erroneous behavior is still in progress. An internal bug
   historic has been added. It works like a black box and all errors
   and erroneous return code of functions are stored with their
   apparition date. This is useful for debugging code after running a
   test. It works both for Unix and dsPIC.</p>

<p>STRONG(Agust 2008.) This date marks first successful tests of the
   angular regulation of the swing by laptop computation. The project
   is at the same state than in december 2006 except than all
   helicopter parts are more completed. Functional tests have been
   added (and written in PDF files) to check if the code works fine.
   Now communication protocol no longer suffers of slowing down and
   works in real time at 50 Hz (20 ms). The state machine for
   detecting malformed words is enough evolved to be added with SPI
   protocole.  A SPI module will write and will allow to two dsPIC to
   communicate in the aim to regulate the 2 axis of the
   helicopter. The first 16-bit filter has been coded. It will be used
   for motor current regulation in the dsPIC. The speed of motor
   regulation will be decrease (contrary to what it's been said): it
   will no longer be to 1 KHz but 300 Hz. This is due to the fact that
   300 Hz matches to the 20K revolution per minute of the
   propellers. This is a mechanical limitations of the motor due to
   brushes that make oscillations in the current.</p>

<p>STRONG(Beginning of September 2008.) The project growed well: the
   angular regulation of the wing is now entierly done by dsPIC
   without the laptop help. A bootloader has been added in the aim
   that user, with a serial link of a laptop, can modify gains of PID
   and coef of non linear functions of the motor behaviors, ... a
   message send during the bootload informs the dsPIC if the laptop
   has to perform (or not) computation for the fly regulation. In the
   case or it does not compute, the laptop sends consignes and plots
   inertial data.</p>

<p>STRONG(End of September 2008.) Because the angular regulation is
   totaly functional, the swing is transforming into a four-head
   rotors helicopter. Each axis will be controled by a dsPIC. The
   dsPIC has to communicate together by SPI (master - slave
   communication) for the yaw control. the frame of the helicopter is
   now attach to a wire: all of degres of liberty are
   allowed. Bootloader has to be modified to send data to slave dsPIC
   thanks the master dsPIC. The tension of motors will be changed (5V
   to 8V).</p>

<p>STRONG(April 2009.) The project has have to stand by because of
   personal problems (sentimental problems). The project is now
   starting again ;-)</p>

SUBSECTION(Table of purpose,tdm)

<p>For better access to the information, this study has been splitted
   into several html pages:</p>
LISTE(MYLINK(helico_etapes,Project specifications),
MYLINK(helico_mecanique,Frame design),
MYLINK(helico_electronique,Electronic card design),
MYLINK(helico_logiciel,Software design),
MYLINK(helico_asservissement,Autonomous control design),
MYLINK(helico_download,Downloads),
MYLINK(helico_biblio,Bibliography),
MYLINK(tuto_scicos,Introduction to Scicos software),
MYLINK(tuto_syndex,Introduction to SynDEx software),
MYLINK(comm_rs232,Introduction serial port (RS232)),
MYLINK(helico_photos,Photos et videos.))

<p>This table of contents is also available from the left menu in all
   conserned pages.</p>

divert(DIVERT_FOOTER_CODE)

END_BODY(,,helico_etapes,Etapes de la construction)
