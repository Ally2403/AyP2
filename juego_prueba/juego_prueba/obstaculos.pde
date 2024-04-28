
class obstaculos {
  int yposobjeto1, objetox1, objetoy1;
  float xposobjeto1;
  obstaculos(float xposobjeto1, int yposobjeto1, int objetox1, int objetoy1) {
    this.xposobjeto1 = xposobjeto1;
    this.yposobjeto1 = yposobjeto1;
    this.objetox1 = objetox1;
    this.objetoy1 = objetoy1;
  }
  void obstaculos1() {
    //noFill();
    //noStroke();
    if (!invulnerable) {
      rect(xposobjeto1 + xpos1, yposobjeto1, objetox1, objetoy1);
      if (xpos + latinox >= xposobjeto1 + xpos1 &&
        xpos <= xposobjeto1 + xpos1 + objetox1 &&
        ypos + latinoy >= yposobjeto1 &&
        ypos <= yposobjeto1 + objetoy1) {
        saltar();
        if (derecha) {
          xpos = xpos - 150;
        }
        if (izquierda) {
          xpos = xpos + 150;
        }
        colision = colision - 1;
        speed=8;
        if(op == 1){
          music1.play(1, vol[1].volume);
        }else if(op == 2){
          music2.play(1, vol[1].volume);
        }else if(op == 3){
          music3.play(1, vol[1].volume);
        }else if(op == 4){
          music4.play(1, vol[1].volume);
        }else if(op == 5){
          music5.play(1, vol[1].volume);
        }
        
        fill(255, 0, 0);
        textSize(20);
        textAlign(CENTER);
        text("¡Colisión detectada!", 100, 100, 780, 100);
        invulnerable = true; // Activar la invulnerabilidad
        tiempoColision = millis(); // Actualizar el tiempo de la última colisión
      }
    }
  }
}

void obstaculos1(float xposobjeto1, int yposobjeto1, int objetox1, int objetoy1) {
  //noFill();
  //noStroke();
  if (!invulnerable) {
    rect(xposobjeto1, yposobjeto1, objetox1, objetoy1);
    if (xpos + latinox >= xposobjeto1 &&
      xpos <= xposobjeto1 + objetox1 &&
      ypos + latinoy >= yposobjeto1 &&
      ypos <= yposobjeto1 + objetoy1) {
      saltar();
      if (derecha) {
        xpos = xpos - 150;
      }
      if (izquierda) {
        xpos = xpos + 150;
      }
      colision = colision - 1;
      speed=8;
      if(op == 1){
          music1.play(1, vol[1].volume);
        }else if(op == 2){
          music2.play(1, vol[1].volume);
        }else if(op == 3){
          music3.play(1, vol[1].volume);
        }else if(op == 4){
          music4.play(1, vol[1].volume);
        }else if(op == 5){
          music5.play(1, vol[1].volume);
        }
      fill(255, 0, 0);
      textSize(20);
      textAlign(CENTER);
      text("¡Colisión detectada!", 100, 100, 780, 100);
      invulnerable = true; // Activar la invulnerabilidad
      tiempoColision = millis(); // Actualizar el tiempo de la última colisión
    }
  }
}
