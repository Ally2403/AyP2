PImage fondo, mapa, vida1, helicoptero, restart1, latino3, granada;
PFont font;
import gifAnimation.*;
int xpos = 0, ypos = 482, speed = 7, latinox, latinoy;
int xpos1 = 0, ypos1 = 0, colision = 3, i, vidax;
//colisiones
  int xposobjeto1, yposobjeto1, objetox1, objetoy1;
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
  boolean derecha = false, abajo = false, izquierda = false, arriba = false, saltando = false;
//granada
  float posinicialx;
  float x1 = posinicialx, y1 = yinicial, posx; // Posición de la bola
  float vx, vy; // Velocidades en x e y
  float g = 0.5; // Gravedad
  float r = 20;
  float friccion = 0.95; // Coeficiente de fricción
  boolean enMovimiento; // Variable para controlar si la bola está en movimiento
  int tiempoAnterior = millis(); // Variable para almacenar el tiempo en que se lanzó la bola anteriormente
  int tiempoEspera = int(random(1000, 5000)); // Tiempo de espera antes de lanzar la bola nuevamente

Gif latino, latino1;
Timer sw;


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
  
  //CONFIGURACIONES DEL PERSONAJE
  latino = new Gif(this, "latino5.gif");
  latino.play();
  latino1 = new Gif(this, "latino4.gif");
  latino1.play();
  latinox = latino.width;
  latinoy = latino.height;
  
  //CONFIGURACIONES DE LA FUENTE
  font = createFont("PressStart2P.ttf", 96);
  textFont(font);
  
  //CONFIGURACIONES DEL TIMER
  sw = new Timer();
  sw.start();
  
  //CONFIGURACIONES GRANADA
  lanzarBolita1();
}

void draw(){
  if(colision == 0){
    botonrestart();
  }else{
    background(0);
    image(fondo, 0, 0);
    image(mapa, xpos1, ypos1);
    obstaculos1();
    if(derecha){
      image(latino, xpos, ypos); 
    }else{
      if(izquierda){
        image(latino1, xpos, ypos); 
      }else{
         image(latino3, xpos, ypos);
      }
    }
    MoveHelicoptero1();
    movelatino();
    movemapa();
    time();
    vidas();
    moveGranada();
  }
}

void reset(){
  xpos = 0;
  ypos = 482;
  speed = 7;
  xpos1 = 0;
  ypos1 = 0; 
  colision = 3;
  yspeed = 0;
  gravity = 1;
  derecha = false;
  abajo = false;
  izquierda = false;
  arriba = false;
  saltando = false;
  sw.restart();
}

void lanzarBolita1(){
  lanzarBolita(1500);
}

void MoveHelicoptero1(){
  MoveHelicoptero(1500);
}

void moveGranada(){ 
  posx = xpos1 + x1;
  image(granada, xpos1 + x1, y1, r*3, r*3);
  colisiongranada();
  if (enMovimiento) {
    x1 += vx;
    y1 += vy;
    vy += g;
    
    // Revisa si la bola llega al suelo
    if (y1 + r >= 900-290) {
      y1 = 900-290 - r; // Ajusta la posición para que la bola esté justo en el suelo
      vy = 0; // Detiene el movimiento vertical
      
      // Aplica fricción al movimiento horizontal
      vx *= friccion;
      
      // Si la velocidad horizontal es muy baja, detiene la bola
      if (abs(vx) < 0.1) {
        enMovimiento = false;
        // Actualiza el tiempo anterior y el tiempo de espera
        tiempoAnterior = millis();
        tiempoEspera = int(random(1000, 4000)); // Tiempo de espera aleatorio entre 1 y 5 segundos
      }
    }
  }
  // Verifica si ha pasado el tiempo de espera y lanza la bola nuevamente
  if (!enMovimiento && millis() - tiempoAnterior >= tiempoEspera) {
    lanzarBolita1();
  }
}

// Función para lanzar la bolita
void lanzarBolita(int posinicialx) {
  // Genera un número aleatorio que determina la dirección del lanzamiento (-1 para izquierda, 1 para derecha)
  float direccion = random(-1, 1);
  
  // Asigna la velocidad inicial en x en función de la dirección del lanzamiento
  vx = direccion * random(3, 8); // Velocidad aleatoria entre 3 y 8
  
  // Asigna la velocidad inicial en y
  vy = random(-10, -20); // Velocidad aleatoria entre -10 y -20
  
  // Reinicia la posición de la bola
  x1 = posinicialx;
  y1 = yinicial;
  
  // Reinicia la variable de control de movimiento
  enMovimiento = true;
  
}

void colisiongranada(){
  if(xpos + latinox >= posx &&
   xpos <= posx + r*3 &&
   ypos + latinoy >= y1 &&
   ypos <= y1 + r*3){
     saltar();
     if(derecha){
      xpos = xpos - 150;      
     }
     if(izquierda){
      xpos = xpos + 150;
     }
     colision = colision - 1;
     fill(255, 0, 0);
     textSize(20);
     textAlign(CENTER);
     text("¡Colisión detectada!", 100, 100, 780, 100);
     x1 = posinicialx;
     y1 = yinicial;
     }
}

void MoveHelicoptero(int posinicialx){
  // Actualizar la posición vertical
  yinicial = yinicial + velheli;
  // Cambiar la dirección si alcanza los límites superior o inferior
  if(yinicial > alturamax || yinicial < 0){
    velheli = -velheli;
  }
  image(helicoptero, xpos1 + posinicialx, yinicial);
}

void plataformas1(){
  plataformas(xpos1 + 2905, 470, 1950, 180);
  //plataformas(xpos1 + 2680, 470, 250, 10);
}

void plataformas(int xposplat, int yposplat, int platx, int platy){
  rect(xposplat, yposplat, platx, platy);
  if(ypos >= yposplat - latinoy && xpos + latinox >= xposplat && xpos <= xposplat + platx){
      ypos = yposplat - latinoy;
      yspeed = 0;
      saltando = false; 
  }else{ // Si el personaje toca el suelo
    nosaltar();
  }
}

void obstaculos1(){
  obstaculos(xpos1+1200, 550, 130, 100);
  obstaculos(xpos1+2850, 520, 100, 130);
  
}

void obstaculos(int xposobjeto1, int yposobjeto1, int objetox1, int objetoy1){
  //noFill();
  //noStroke();
  rect(xposobjeto1, yposobjeto1, objetox1, objetoy1);
  if(xpos + latinox >= xposobjeto1 &&
  xpos <= xposobjeto1 + objetox1 &&
  ypos + latinoy >= yposobjeto1 &&
  ypos <= yposobjeto1 + objetoy1){
    saltar();
    if(derecha){
    xpos = xpos - 150;      
    }
    if(izquierda){
    xpos = xpos + 150;
    }
    colision = colision - 1;
    fill(255, 0, 0);
    textSize(20);
    textAlign(CENTER);
    text("¡Colisión detectada!", 100, 100, 780, 100);
    // Aquí puedes agregar acciones adicionales cuando haya colisión
  }
}

void vidas(){
  vidax = 0;
  for(i=1; i<=colision; i++){
    vidax = vidax + 60;
    image(vida1, vidax, 40);
  }
}

void movemapa(){
  if(derecha){
    xpos1 = xpos1 - speed;
  }
  if(izquierda){
    xpos1 = xpos1 + speed;
  }
}

void movelatino(){
  if (derecha){
    xpos = xpos + speed;
  }
  if(izquierda){
    xpos = xpos - speed;
  }
  if (abajo){
    ypos = ypos + speed;
  }
  gravedad();
  plataformas1();
  
  xpos = constrain(xpos, 100, 700);
  ypos = constrain(ypos, 0, 900-400);
}

void nosaltar(){
  if (ypos >= 900-400) { // Si el personaje toca el suelo
    ypos = 900-400;
    yspeed = 0;
    saltando = false;
  }
}

void gravedad(){
  if (!saltando && ypos >= 900-400){
    yspeed = 0;
    saltando = false; 
  } else {
    yspeed += gravity;
  }
  ypos += yspeed;
}

void saltar(){
  yspeed = -21;
  saltando = true;
}

void botonrestart(){
  image(restart1, 0, 0);
  noFill();
  noStroke();
  rect(x, y, w, h);
}

class Timer {
  int startTime = 0, stopTime = 0;
  boolean running = false; 
  void start() {
    startTime = millis();
    running = true;
  }
  void stop() {
    stopTime = millis();
    running = false;
  }
  void restart() {
    startTime = millis();
    stopTime = 0;
    running = true;
  }
  int getElapsedTime() {
    int elapsed;
    if (running) {
      elapsed = (millis() - startTime);
    }
    else {
      elapsed = (stopTime - startTime);
    }
    return elapsed;
  }
  int milisecond() {
    return (getElapsedTime() / 10) % 100;
  }
  int second() {
    return (getElapsedTime() / 1000) % 60;
  }
  int minute() {
    return (getElapsedTime() / (1000*60)) % 60;
  }
}

void time(){
  textAlign(CENTER);
  textSize(40);
  fill(255);
  //NF CONVIERTE NÚMEROS A STRING AÑADIENDO 0 A LA IZQUIERDA, POR ESO SE PONE COMO PARÁMETRO 2 PARA QUE SOLO MUESTRE 2 DÍGITOS
  text(nf(sw.minute(), 2)+":"+nf(sw.second(), 2)+":"+nf(sw.milisecond(), 2), 780, 100);
}

void mouseClicked(){
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h && colision == 0) {
    reset();
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
  if(key == ' ' && !saltando){
    saltar();
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
  }
}
