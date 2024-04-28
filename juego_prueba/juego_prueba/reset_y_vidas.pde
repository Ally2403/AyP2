void reset() {
  xpos = 0;
  ypos = 482;
  speed = 8;
  speed2 = 12;
  xpos1 = 0;
  ypos1 = 0;
  colision = 3;
  derecha = false;
  abajo = false;
  izquierda = false;
  arriba = false;
  saltando = false;
  aTodaMadre = false;
  spaceWhileDown = false;
  spacePressed = false;
  pausaelapsed = 0;
  speedboolean = false;
  movimiento = false;
  tiempoInicio = 0;
  yspeed = 0;
  gravity = 1;
  velheli = 2;
  invulnerable = false;
  tiempoInvulnerable = 2000;
  tiempoColision = 0;
  dollars = 0;
  dollarcount = 0;
  for (i=0; i<ene.length; i++) {
        ene[i].vivo = true;
  }
  sw.restart();

  lastTime=0;

}

void botonrestart() {
  image(restart1, 0, 0);
  noFill();
  noStroke();
  rect(x, y, w, h);
  //boton exit en menu restart
  rect(695, 580, 180, 57);
}

void vidas() {
  vidax = 0;
  for (i=1; i<=colision; i++) {
    vidax = vidax + 60;
    image(vida1, vidax, 40);
  }
}
