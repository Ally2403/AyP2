void obstaculos1(){
  obstaculos(xpos1+1200, 550, 130, 100);
  obstaculos(xpos1+2850, 520, 100, 130);
  
}

void obstaculos(float xposobjeto1, int yposobjeto1, int objetox1, int objetoy1){
  //noFill();
  //noStroke();
  if(!invulnerable){
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
      speed=7;
      fill(255, 0, 0);
      textSize(20);
      textAlign(CENTER);
      text("¡Colisión detectada!", 100, 100, 780, 100);
      invulnerable = true; // Activar la invulnerabilidad
      tiempoColision = millis(); // Actualizar el tiempo de la última colisión
    }
  }
}
