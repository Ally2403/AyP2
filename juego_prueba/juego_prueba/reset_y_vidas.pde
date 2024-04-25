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

void botonrestart(){
  image(restart1, 0, 0);
  noFill();
  noStroke();
  rect(x, y, w, h);
}

void vidas(){
  vidax = 0;
  for(i=1; i<=colision; i++){
    vidax = vidax + 60;
    image(vida1, vidax, 40);
  }
}
