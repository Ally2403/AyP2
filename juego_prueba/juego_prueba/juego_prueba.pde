PImage fondo, mapa, vida1, helicoptero, restart1, latino3, granada, pausa1, dollar, desaparecer;
PFont font;
import gifAnimation.*;
import processing.sound.*;
//Variables personaje y fondo
  int xpos = 0, ypos = 482, speed = 7, speed2 = 12, latinox, latinoy;
  int xpos1 = 0, ypos1 = 0, colision = 3, i, vidax;
  boolean derecha = false, abajo = false, izquierda = false, arriba = false, saltando = false, aTodaMadre = false;
  boolean spaceWhileDown = false;
  boolean spacePressed = false;
  int lastTime; // Último tiempo en el que se aumentó la velocidad
  int pausaelapsed = 0;
  boolean speedboolean = false;
//colisiones
  int yposobjeto1, objetox1, objetoy1;
  float xposobjeto1;
//boton restart
  int x = 630; // Coordenada x del botón
  int y = 515; // Coordenada y del botón
  int w = 310; // Ancho del botón
  int h = 55;  // Alto del botón
//plataformas
  int platy, platx, yposplat, xposplat;
//falta agregar helicoptero en el reset
  int yinicial = 600/2, velheli = 2, alturamax = 470;
  float yspeed = 0, gravity = 1;
//enemigos
  int tamx, tamy;
//pausa
  boolean pausa;
//vulnerabilidad de colision
  boolean invulnerable = false;
  int tiempoInvulnerable = 2000; // Duración de la invulnerabilidad en milisegundos
  int tiempoColision = 0; // Variable para almacenar el tiempo en que ocurrió la última colisión
//Volumen y barra deslizadora
  float volume = 0.1;
  float sliderX = 680;
  float sliderY = 200;
  float sliderWidth = 200;
  float sliderHeight = 50;
  boolean dragging = false;
//billetes
  int dollars = 0;
  

Gif latino, latino1, imgLeft, imgRight, atodamadre;
Timer sw;
enemigos[] ene = new enemigos[4];
billetes[] bille = new billetes[4];
granada[] gran = new granada[3];
SoundFile music;


void setup(){
  size(1580, 900);
  
  //CONFIGURACIONES DE IMÁGENES Y FONDO
  fondo = loadImage("fondo juego.png");
  fondo.resize(width, height);
  mapa = loadImage("mapa.png");
  mapa.resize(24000,900);
  vida1 = loadImage("vida.png");
  vida1.resize(50,50);
  helicoptero = loadImage("Helicoptero.png");
  helicoptero.resize(446,190);
  restart1 = loadImage("restart.png");
  restart1.resize(width, height);
  latino3 = loadImage("latino6.png");
  granada = loadImage("granada.png");
  granada.resize(100,110);
  pausa1 = loadImage("pausa.png");
  pausa1.resize(470, 306);
  dollar = loadImage("dollar.png");
  dollar.resize(80,70);
  desaparecer = loadImage("desaparecer.png");
  desaparecer.resize(80,70);
  
  //CONFIGURACIONES DEL PERSONAJE
  latino = new Gif(this, "latino5.gif");
  latino.play();
  latino1 = new Gif(this, "latino4.gif");
  latino1.play();
  latinox = latino.width;
  latinoy = latino.height;
  atodamadre = new Gif(this, "latino1.gif");
  atodamadre.resize(latino.width, latino.height);
  atodamadre.play();
  
  //CONFIGURACIONES DE LA FUENTE
  font = createFont("PressStart2P.ttf", 96);
  textFont(font);
  
  //CONFIGURACIONES DEL TIMER
  sw = new Timer();
  sw.start();
  
  //CONFIGURACIONES GRANADA
  gran[1] = new granada(1700+200, 1700);
  gran[2] = new granada(1700+200, 1700);
  //lanzarBolita1();
  
  //CONFIGURACIONES ENEMIGOS
  imgLeft = new Gif(this, "latino5.gif");
  imgLeft.play();
  imgRight = new Gif(this, "latino4.gif");
  imgRight.play();
  tamy = imgLeft.height;
  tamx = imgLeft.width;
  ene[1] = new enemigos(2905, 470-imgLeft.height, 2905, 4750);
  ene[2] = new enemigos(3500, 470-imgLeft.height, 3500, 4750);
  ene[3] = new enemigos(4000, 470-imgLeft.height, 4000, 4750);
  
  //CONFIGURACIONES DEL VOLUMEN
  music = new SoundFile(this, "Cancion Juego.mp3");
  music.loop();
  music.amp(volume);
  
  //CONFIGURACIONES BILLETES
  bille[1] = new billetes(500, 500);
  bille[2] = new billetes(900, 500);
  bille[3] = new billetes(1100, 500);

}

void draw(){
  if(pausa == true){
     volumen();
  }else if(colision == 0){
    botonrestart();
  }else{
    background(0);
    image(fondo, 0, 0);
    image(mapa, xpos1, ypos1);
    obstaculos1();
    //dibujar billetes
    for(i=1; i<bille.length; i++){
      if(bille[i].billete){
        bille[i].billetes1();
      }
    }
    textAlign(CENTER);
    textSize(40);
    fill(255);
    text("x"+dollars, 1480, 90);
    if(derecha){
      image(latino, xpos, ypos); 
    }else{
      if(izquierda){
        image(latino1, xpos, ypos); 
      }else{
         image(latino3, xpos, ypos);
      }
    }
    aTodaMadre();
    MoveHelicoptero1();
    aumentoVel();
    movelatino();
    movemapa();
    time();
    vidas();
    for(i=1; i<gran.length; i++){
      gran[i].moveGranada();
    }
    
    //dibujar enemigos
    for(i=1; i<ene.length; i++){
      if(ene[i].vivo){
        ene[i].enemigos3();
      }
    }
    // Verifica si el personaje está invulnerable y si ha pasado suficiente tiempo desde la última colisión
    if (invulnerable && millis() - tiempoColision >= tiempoInvulnerable) {
      invulnerable = false; // Termina la invulnerabilidad después del tiempo especificado
    }
    image(dollar,1350, 40);
  }
}

void mouseClicked(){
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h && colision == 0) {
    reset();
  }
  //cuadrado de continuar en menu de pausa;
  if (mouseX > 555 && mouseX < 555 + 470 && mouseY > 396 && mouseY < 396 + 99 && pausa == true) {
    pausa = false;
    sw.resume();
  }
}

void mousePressed() {
  // Verificar si el mouse está sobre el control deslizante del volumen
  if (mouseX > sliderX && mouseX < sliderX + sliderWidth && mouseY > sliderY && mouseY < sliderY + sliderHeight) {
    dragging = true;
  }
}

void mouseReleased() {
  //volumen
  dragging = false;
}

void mouseDragged() {
  //volumen
  if (dragging) {
    volume = constrain((mouseX - sliderX) / sliderWidth, 0, 1);
    music.amp(volume);
    //amp controla valores de 0 siendo silencio y 1 siendo max
  }
}

void keyPressed(){
  if (keyCode == RIGHT){
    derecha = true;
  }else if(keyCode == LEFT){
    izquierda = true;
  }
  if (keyCode == DOWN){
    abajo = true;
  }
  //a toda madre
  if (keyCode == ' ') { // Espacio
    spacePressed = true;
    spaceWhileDown = abajo; // Verifica si la tecla de abajo estaba presionada al presionar Spacebar
  }
  if(key == ' ' && !saltando && abajo == false){
    saltar();
  }
  if(keyCode == TAB){
    pausa = true;
    image(fondo, 0, 0);
    image(pausa1, 555, 297);
    //settings
    noFill();
    noStroke();
    rect(555, 297, 470, 99);
    //continue
    rect(555, 396, 470, 99);
    sw.pause();
    
  }
  
  
}

void keyReleased (){
  if (keyCode == RIGHT){
    derecha = false;
  }else if(keyCode == LEFT){
    izquierda = false;
  }
  if (keyCode == DOWN){
    abajo = false;
    if (spacePressed && spaceWhileDown) {
      // Haz algo cuando se suelta la tecla de abajo después de presionar Spacebar
      aTodaMadre = true;
    }
  }
  if (keyCode == ' ') { // Espacio
    spacePressed = false;
  }
}
