void plataformas1(){
  plataformas(xpos1 + 2905, 470, 1950, 180);
  
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
