
void aumentoVel() {
  if (sw.getElapsedTime() >= lastTime + 15000 && !speedboolean) {
    speed = speed + 3;
    speed2 = speed2 + 3;
    lastTime = sw.getElapsedTime();
    speedboolean = true;
    System.out.print(speed + " ");
  } else if (sw.getElapsedTime() < lastTime + 15000) {
    speedboolean = false;
  }
}

void aTodaMadre() {
  if (movimiento) {
    if (millis() - tiempoInicio >= 1000) {
      movimiento = false; // Detener el movimiento
      aTodaMadre = false;
    } else if (!izquierda && aTodaMadre == true && !invulnerable) {
      switch(op) {
      case 1:
        image(atodamadre1, xpos, ypos-40);
        break;
      case 2:
        image(atodamadre2, xpos, ypos-40);
        break;
      case 3:
        image(atodamadre3, xpos, ypos-40);
        break;
      case 4:
        image(atodamadre4, xpos, ypos-40);
        break;
      case 5:
        image(atodamadre5, xpos, ypos-40);
        break;
      }
      aTodaMadre = true;
      xpos1 = xpos1 - speed2;
      xpos = xpos + speed2;
    } else {
      aTodaMadre = false;
    }
  }
}

class helicoptero {
  int posinicialx, yinicial, alturamax;
  helicoptero(int posinicialx, int yinicial, int alturamax) {
    this.posinicialx = posinicialx;
    this.yinicial = yinicial;
    this.alturamax = alturamax;
  }
  void MoveHelicoptero() {
    // Actualizar la posición vertical
    yinicial = yinicial + velheli;
    // Cambiar la dirección si alcanza los límites superior o inferior
    if (yinicial > alturamax || yinicial < 0) {
      velheli = -velheli;
    }
    image(helicoptero, xpos1 + posinicialx, yinicial);
  }
}



void movemapa() {
  if (derecha) {
    xpos1 = xpos1 - speed;
  }
  if (izquierda && xpos1 != 0) {
    xpos1 = xpos1 + speed;
  }
  //hasta donde llegará el movimiento del mapa
  xpos1 = constrain(xpos1, -22400, 0);
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
  
  //dibujar plataformas
  for (i=0; i<plat.length; i++) {
    plat[i].plataformas1();
  }

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
