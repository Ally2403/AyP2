
int op;

PImage fondo, mapa, vida1, helicoptero, restart1, latino2, granada, pausa1, dollar, desaparecer, latino5, latino8, latino11, latino14;
PImage principal, personajes, como_jugar, credits, argentina, configuracion;
PImage mexico, venezuela, peru, start_game, letsgo;
PImage previc, previm, previa, previv, previp;
PFont font;
import gifAnimation.*;
import processing.sound.*;
//interfaz
int pantalla = 0, pantalla1 = 0;
int botonResaltado = -1;
int posicionx = 122;
int seleccionpersonaje = 1;
int tiempoInicio1;
int duracion = 2000;

//Variables personaje y fondo
int xpos = 0, ypos = 482, speed = 8, speed2 = 12, latinox, latinoy;
int xpos1 = 0, ypos1 = 0, colision = 3, i, vidax;
boolean derecha = false, abajo = false, izquierda = false, arriba = false, saltando = false, aTodaMadre = false;
boolean spaceWhileDown = false;
boolean spacePressed = false;
int lastTime; // Último tiempo en el que se aumentó la velocidad
int pausaelapsed = 0;
boolean speedboolean = false;

boolean movimiento = false; // Variable para controlar el movimiento
long tiempoInicio = 0; // Variable para almacenar el tiempo de inicio del movimiento
//boton restart
int x = 630; // Coordenada x del botón
int y = 515; // Coordenada y del botón
int w = 310; // Ancho del botón
int h = 55;  // Alto del botón
//plataformas
int platy, platx, yposplat, xposplat;
float yspeed = 0, gravity = 1;
//helicoptero
int velheli = 2;
//enemigos
int tamx, tamy;
//pausa
boolean pausa;
//vulnerabilidad de colision
boolean invulnerable = false;
int tiempoInvulnerable = 2000; // Duración de la invulnerabilidad en milisegundos
int tiempoColision = 0; // Variable para almacenar el tiempo en que ocurrió la última colisión
//billetes
int dollars = 0;
int dollarcount = 0;

int pos111;

Gif latino, latino1, imgLeft, imgRight, atodamadre1, atodamadre2, atodamadre3, atodamadre4, atodamadre5, latino3, latino4, latino6, latino7, latino9, latino10, latino12, latino13, personajec, personajem, personajea, personajev, personajep;
Timer sw;
enemigos[] ene = new enemigos[8];
billetes[] bille = new billetes[3];
granada[] gran = new granada[8];
helicoptero[] heli = new helicoptero[4];
obstaculos[] obst = new obstaculos[9];
plataformas[] plat = new plataformas[2];
volumen[] vol = new volumen[2];

SoundFile music, music1, music2, music3, music4, music5;

void setup() {
  size(1580, 900);

  //CONFIGURACIONES DE IMÁGENES Y FONDO
  fondo = loadImage("fondo juego.png");
  fondo.resize(width, height);
  mapa = loadImage("mapa.png");
  mapa.resize(24000, 900);
  vida1 = loadImage("vida.png");
  vida1.resize(50, 50);
  helicoptero = loadImage("Helicoptero.png");
  helicoptero.resize(446, 190);
  restart1 = loadImage("restart.png");
  restart1.resize(width, height);
  granada = loadImage("granada.png");
  granada.resize(100, 110);
  pausa1 = loadImage("pausa.png");
  pausa1.resize(470, 306);
  dollar = loadImage("dollar.png");
  dollar.resize(80, 70);

  principal = loadImage("/Data/pantalla_inicio.jpg");
  principal.resize(width, height);
  personajes = loadImage("/Data/Seleccion_de_jugadores.jpg");
  personajes.resize(width, height);
  mexico = loadImage("/Data/Seleccion_de_mexico.jpg");
  mexico.resize(width, height);
  argentina = loadImage("/Data/Seleccion_de_argentina.jpg");
  argentina.resize(width, height);
  venezuela = loadImage("/Data/Seleccion_de_venezuela.jpg");
  venezuela.resize(width, height);
  peru = loadImage("/Data/Seleccion_de_peru.jpg");
  peru.resize(width, height);
  start_game = loadImage("/Data/prueb.jpg");
  start_game.resize(width, height);
  personajec = new Gif(this, "Colombia.gif");
  personajec.play();
  personajem = new Gif(this, "Mexico.gif");
  personajem.play();
  personajea = new Gif(this, "Argentina-Messi.gif");
  personajea.play();
  personajev = new Gif(this, "Venezuela.gif");
  personajev.play();
  personajep = new Gif(this, "Peru.gif");
  personajep.play();
  como_jugar = loadImage("/Data/how_to_play.jpg");
  como_jugar.resize(width, height);
  credits = loadImage("/Data/Credits.jpg");
  credits.resize(width, height);
  letsgo = loadImage("/Data/Let's_go.jpg");
  letsgo.resize(width, height);
  previc = loadImage("/Data/Columbia.jpg");
  previc.resize(380, 96);
  previm = loadImage("/Data/Mechico.jpg");
  previm.resize(320, 80);
  previa = loadImage("/Data/Arjentina.jpg");
  previa.resize(380, 83);
  previv = loadImage("/Data/Venezuela11.jpg");
  previv.resize(380, 83);
  previp = loadImage("/Data/Penu.jpg");
  previp.resize(230, 75);
  configuracion = loadImage("/Data/configuracion.jpg");
  configuracion.resize(width, height);

  //CONFIGURACIONES DEL PERSONAJE

  //Colombia
  latino3 = new Gif(this, "latino7.gif");
  latino3.play();
  latino4 = new Gif(this, "latino8.gif");
  latino4.play();
  latino5 = loadImage("latino9.png");
  //Mexico
  latino = new Gif(this, "latino5.gif");
  latino.play();
  latino1 = new Gif(this, "latino4.gif");
  latino1.play();
  latino2 = loadImage("latino6.png");
  //Argentina
  latino6 = new Gif(this, "latino10.gif");
  latino6.play();
  latino7 = new Gif(this, "latino11.gif");
  latino7.play();
  latino8 = loadImage("latino12.png");
  //Venezuela
  latino9 = new Gif(this, "latino13.gif");
  latino9.play();
  latino10 = new Gif(this, "latino14.gif");
  latino10.play();
  latino11 = loadImage("latino15.png");
  //Peru
  latino12 = new Gif(this, "latino16.gif");
  latino12.play();
  latino13 = new Gif(this, "latino17.gif");
  latino13.play();
  latino14 = loadImage("latino18.png");
  latinox = latino.width;
  latinoy = latino.height;
  atodamadre1 = new Gif(this, "atodamadre1.gif");
  atodamadre1.play();
  atodamadre2 = new Gif(this, "atodamadre2.gif");
  atodamadre2.play();
  atodamadre3 = new Gif(this, "atodamadre3.gif");
  atodamadre3.play();
  atodamadre4 = new Gif(this, "atodamadre4.gif");
  atodamadre4.play();
  atodamadre5 = new Gif(this, "atodamadre5.gif");
  atodamadre5.play();

  //CONFIGURACIONES DE LA FUENTE
  font = createFont("PressStart2P.ttf", 96);
  textFont(font);

  //CONFIGURACIONES DEL TIMER
  sw = new Timer();
  sw.start();

  //CONFIGURACIONES ENEMIGOS
  imgLeft = new Gif(this, "Policia1.gif");
  imgLeft.play();
  imgRight = new Gif(this, "Policia.gif");
  imgRight.play();
  tamy = imgLeft.height;
  tamx = imgLeft.width;
  //                    posx       posy       limizquieda limderecha
  ene[0] = new enemigos(2905, 470-imgLeft.height, 2905, 3685-imgLeft.width);
  ene[1] = new enemigos(3500, 470-imgLeft.height, 3815, 4855-imgLeft.width);
  ene[2] = new enemigos(4000, 470-imgLeft.height, 5132, 6733-imgLeft.width);
  ene[3] = new enemigos(16150, 654-imgLeft.height, 16150, 18579-imgLeft.width);
  ene[4] = new enemigos(16700, 654-imgLeft.height, 16150, 18579-imgLeft.width);
  ene[5] = new enemigos(18681, 470-imgLeft.height, 18681, 20635-imgLeft.width);
  ene[6] = new enemigos(20641, 654-imgLeft.height, 20641+imgLeft.width, 21570-imgLeft.width);
  ene[7] = new enemigos(21703, 654-imgLeft.height, 21703, 23200-imgLeft.width);

  //CONFIGURACIONES DEL VOLUMEN y SONIDO
  music = new SoundFile(this, "Cancion Juego.mp3");
  music1 = new SoundFile(this, "Sonido Mexicano.mp3");
  music2 = new SoundFile(this, "Sonido Mexicano.mp3");
  music3 = new SoundFile(this, "Sonido Mexicano.mp3");
  music4 = new SoundFile(this, "Sonido Mexicano.mp3");
  music5 = new SoundFile(this, "Sonido Mexicano.mp3");
  music.loop();
  vol[0] = new volumen(0.1, 680, 100, 200, 50, false);
  music.amp(vol[0].volume);

  vol[1] = new volumen(0.1, 680, 220, 200, 50, false);
  music1.amp(vol[1].volume);
  music2.amp(vol[1].volume);
  music3.amp(vol[1].volume);
  music4.amp(vol[1].volume);
  music5.amp(vol[1].volume);

  //CONFIGURACIONES BILLETES
  //                    limizquierda  limderecha  posy
  bille[0] = new billetes(random(100, 4000), 500);
  bille[1] = new billetes(random(100, 4000), 500);
  bille[2] = new billetes(random(100, 4000), 500);

  //CONFIGURACIONES GRANADA
  //               posx+200  posinicialx yinicial
  gran[0] = new granada(1700+200, 1700, 300);
  gran[1] = new granada(1700+200, 1700, 300);
  gran[2] = new granada(17017+200, 17017, 300);
  gran[3] = new granada(17017+200, 17017, 300);
  gran[4] = new granada(21106+200, 21106, 300);
  gran[5] = new granada(21106+200, 21106, 300);
  gran[6] = new granada(22570+200, 22570, 300);
  gran[7] = new granada(22570+200, 22570, 300);

  //CONFIGURACIONES HELICOPTERO
  //                       posx  posy  alturamax
  heli[0] = new helicoptero(1700, 300, 470);
  heli[1] = new helicoptero(17017, 300, 470);
  heli[2] = new helicoptero(21106, 300, 470);
  heli[3] = new helicoptero(22570, 300, 470);

  //CONFIGURACIONES OBSTACULOS
  //                       posx  posy tamañox tamañoy
  obst[0] = new obstaculos(1200, 550, 130, 100);
  obst[1] = new obstaculos(2850, 520, 100, 130);
  obst[2] = new obstaculos(3685, 370, 130, 100);
  obst[3] = new obstaculos(4870, 550, 260, 100);
  obst[4] = new obstaculos(16017, 550, 133, 100);
  obst[5] = new obstaculos(18579, 520, 100, 130);
  obst[6] = new obstaculos(20087, 370, 132, 100);
  obst[7] = new obstaculos(20641, 550, 132, 100);
  obst[8] = new obstaculos(21570, 550, 133, 100);

  //CONFIGURACIONES PLATAFORMAS
  //                        posx  posy tamañox tamañoy
  plat[0] = new plataformas(2905, 470, 1950, 180);
  plat[1] = new plataformas(18683, 470, 1950, 180);
}

void draw () {
  background (0);
  //pantallas seleccionadas
  switch (pantalla) {
  case 0:
    image(principal, 0, 0);
    break;
  case 1:
    //colombia
    reset();
    image(personajes, 0, 0);
    image(previc, 113, 217);
    break;
  case 2:
    image(como_jugar, 0, 0);
    break;
  case 3:
    image(credits, 0, 0);
    break;
  case 4:
    image(mexico, 0, 0);
    image(previm, 117, 322);
    break;
  case 5:
    image(argentina, 0, 0);
    image(previa, 119, 408);
    break;
  case 6:
    image(venezuela, 0, 0);
    image(previv, 113, 499);
    break;
  case 7:
    image(peru, 0, 0);
    image(previp, 112, 596);
    break;
  case 8:
    switch (seleccionpersonaje) {
    case 1:
      image(letsgo, 0, 0);
      image(personajec, 980, 353);
      op = 1;
      break;
    case 2:
      image(letsgo, 0, 0);
      image(personajem, 980, 353);
      op = 2;
      break;
    case 3:
      image(letsgo, 0, 0);
      image(personajea, 1010, 353);
      op = 3;
      break;
    case 4:
      image(letsgo, 0, 0);
      image(personajev, 1025, 353);
      op = 4;
      break;
    case 5:
      image(letsgo, 0, 0);
      image(personajep, 1028, 353);
      op = 5;
      break;
    }
    break;
  case 9:
    image(configuracion, 0, 0);
    vol[0].volumen1();
    vol[1].volumen1();
    break;
  }
  //pantallas preseleccionadas
  if (botonResaltado != -1) {
    switch (botonResaltado) {
    case 1:
      pantalla1 = 1;
      break;
    case 2:
      pantalla1 = 4;
      break;
    case 3:
      pantalla1 = 5;
      break;
    case 4:
      pantalla1 = 6;
      break;
    case 5:
      pantalla1 = 7;
      break;
    case 6:
      pantalla1 = 8;
      break;
    }
    switch (pantalla1) {
    case 1:
      image(personajes, 0, 0);
      image(previc, 113, 217);
      break;
    case 4:
      image(mexico, 0, 0);
      image(previm, 117, 322);
      break;
    case 5:
      image(argentina, 0, 0);
      image(previa, 119, 408);
      break;
    case 6:
      image(venezuela, 0, 0);
      image(previv, 113, 499);
      break;
    case 7:
      image(peru, 0, 0);
      image(previp, 112, 596);
      break;
    }
  }
  if (pantalla == 8 && millis() - tiempoInicio1 >= duracion) {

    //VIDEOJUEGO//
    if (pausa == true) {
      image(fondo, 0, 0);
      image(pausa1, 555, 297);
      noFill();
      noStroke();
      rect(555, 295, 470, 150);
      rect(555, 450, 470, 150);
      //continue
      vol[0].volumen1();
      vol[1].volumen1();
    } else if (colision == 0) {
      botonrestart();
    } else {
      background(0);
      image(fondo, 0, 0);
      image(mapa, xpos1, ypos1);
      for (i=0; i<obst.length; i++) {
        obst[i].obstaculos1();
      }

      //dibujar billetes
      for (i=0; i<bille.length; i++) {
        if (bille[i].billete) {
          bille[i].billetes1();
        }
      }

      textAlign(CENTER);
      textSize(40);
      fill(255);
      text("x"+dollars, 1480, 90);
      switch(op) {
      case 1:
        if (derecha) {
          image(latino4, xpos, ypos);
        } else {
          if (izquierda) {
            image(latino3, xpos, ypos);
          } else if (!aTodaMadre) {
            image(latino5, xpos, ypos);
          }
        }
        break;
      case 2:
        if (derecha) {
          image(latino, xpos, ypos);
        } else {
          if (izquierda) {
            image(latino1, xpos, ypos);
          } else if (!aTodaMadre) {
            image(latino2, xpos, ypos);
          }
        }
        break;
      case 3:
        if (derecha) {
          image(latino7, xpos, ypos);
        } else {
          if (izquierda) {
            image(latino6, xpos, ypos);
          } else if (!aTodaMadre) {
            image(latino8, xpos, ypos);
          }
        }
        break;
      case 4:
        if (derecha) {
          image(latino10, xpos, ypos);
        } else {
          if (izquierda) {
            image(latino9, xpos, ypos);
          } else if (!aTodaMadre) {
            image(latino11, xpos, ypos);
          }
        }
        break;
      case 5:
        if (derecha) {
          image(latino13, xpos, ypos);
        } else {
          if (izquierda) {
            image(latino12, xpos, ypos);
          } else if (!aTodaMadre) {
            image(latino14, xpos, ypos);
          }
        }
        break;
      }

      aTodaMadre();
      for (i=0; i<heli.length; i++) {
        heli[i].MoveHelicoptero();
      }
      aumentoVel();
      movelatino();
      movemapa();
      time();
      vidas();
      dollar_vida();
      for (i=0; i<gran.length; i++) {
        gran[i].moveGranada();
      }

      //dibujar enemigos
      for (i=0; i<ene.length; i++) {
        if (ene[i].vivo) {
          ene[i].enemigos3();
        }
      }
      // Verifica si el personaje está invulnerable y si ha pasado suficiente tiempo desde la última colisión
      if (invulnerable && millis() - tiempoColision >= tiempoInvulnerable) {
        invulnerable = false; // Termina la invulnerabilidad después del tiempo especificado
      }
      image(dollar, 1350, 40);
      //SONIDOS DEL VIDEOJUEGO
      music1.amp(vol[1].volume);
      music2.amp(vol[1].volume);
      music3.amp(vol[1].volume);
      music4.amp(vol[1].volume);
      music5.amp(vol[1].volume);
      pos111= abs(-mouseX + xpos1);
      System.out.println("posx = "+pos111 + "--- posy = "+mouseY);
    }
  }
}
