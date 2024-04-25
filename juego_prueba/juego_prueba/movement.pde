
void aumentoVel(){
  if (sw.getElapsedTime() >= lastTime + 15000 && !speedboolean) {
    speed = speed + 2; 
    lastTime = sw.getElapsedTime(); 
    speedboolean = true;
    System.out.print(speed + " ");
  }else if(sw.getElapsedTime() < lastTime + 15000){
    speedboolean = false;
  }
}

void aTodaMadre() {
  if (!izquierda && aTodaMadre == true && !invulnerable) {
    image(atodamadre, xpos, ypos);
    aTodaMadre = true;
    xpos1 = xpos1 - speed2;
    xpos = xpos + speed2;
  } else {
    aTodaMadre = false;
  }
}

void MoveHelicoptero1() {
  MoveHelicoptero(1700);
}

void MoveHelicoptero(int posinicialx) {
  // Actualizar la posición vertical
  yinicial = yinicial + velheli;
  // Cambiar la dirección si alcanza los límites superior o inferior
  if (yinicial > alturamax || yinicial < 0) {
    velheli = -velheli;
  }
  image(helicoptero, xpos1 + posinicialx, yinicial);
}

void movemapa() {
  if (derecha) {
    xpos1 = xpos1 - speed;
  }
  if (izquierda && xpos1 != 0) {
    xpos1 = xpos1 + speed;
  }
}

void movelatino() {

  if (derecha) {
    xpos = xpos + speed;
  }
  if (izquierda) {
    xpos = xpos - speed;
  }
  if (abajo) {
    ypos = ypos + speed;
  }

  gravedad();
  plataformas1();

  xpos = constrain(xpos, 100, 700);
  ypos = constrain(ypos, 0, 900-400);
}

void nosaltar() {
  if (ypos >= 900-400) { // Si el personaje toca el suelo
    ypos = 900-400;
    yspeed = 0;
    saltando = false;
  }
}

void gravedad() {
  if (!saltando && ypos >= 900-400) {
    yspeed = 0;
    saltando = false;
  } else {
    yspeed += gravity;
  }
  ypos += yspeed;
}

void saltar() {
  yspeed = -25;
  saltando = true;
}
