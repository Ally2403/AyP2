void mouseClicked() {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h && colision == 0) {
    reset();
  }
  if (mouseX > 695 && mouseX < 695 + 180 && mouseY > 580 && mouseY < 580 + 57 && colision == 0) {
    pantalla = 0;
    reset();
  }
  //cuadrado de continuar en menu de pausa;
  if (mouseX > 555 && mouseX < 555 + 470 && mouseY > 295 && mouseY < 295 + 150 && pausa == true) {
    pausa = false;
    sw.resume();
  }
  if (mouseX > 555 && mouseX < 555 + 470 && mouseY > 450 && mouseY < 450 + 150 && pausa == true) {
    pantalla = 0;
    reset();
  }
}

void mousePressed() {
  // Verificar si el mouse está sobre el control deslizante del volumen
  if (mouseX > vol[0].sliderX && mouseX < vol[0].sliderX + vol[0].sliderWidth && mouseY > vol[0].sliderY && mouseY < vol[0].sliderY + vol[0].sliderHeight) {
    vol[0].dragging = true;
  }
  if (mouseX > vol[1].sliderX && mouseX < vol[1].sliderX + vol[1].sliderWidth && mouseY > vol[1].sliderY && mouseY < vol[1].sliderY + vol[1].sliderHeight) {
    vol[1].dragging = true;
  }
  if (pantalla == 0) {
    if (mouseX > 535 && mouseX<1035 && mouseY >337 && mouseY<407) {
      pantalla = 1;
    } else if (mouseX > 510 && mouseX <1044 && mouseY >428 && mouseY<501) {
      pantalla = 2;
    } else if (mouseX > 607 && mouseX < 949 && mouseY > 518 && mouseY <585) {
      pantalla = 3;
    } else if (mouseX > 580 && mouseX < 968 && mouseY > 610 && mouseY <685){
      pantalla = 9;
    }
  }

  if (pantalla == 1 || pantalla == 4 || pantalla == 5 || pantalla == 6 || pantalla == 7) {
    if (mouseX > 50 && mouseX< 135 && mouseY > 18 && mouseY < 123) {
      pantalla = 0;
    } else if (mouseX > posicionx && mouseX<posicionx + 283 && mouseY >243 && mouseY<293) {
      pantalla = 1;
      seleccionpersonaje = 1;
    } else if (mouseX > posicionx + 3 && mouseX<posicionx + 218 && mouseY >336 && mouseY<387) {
      pantalla = 4;
      seleccionpersonaje = 2;
    } else if (mouseX > posicionx + 3 && mouseX<posicionx + 321 && mouseY >428 && mouseY<483) {
      pantalla = 5;
      seleccionpersonaje = 3;
    } else if (mouseX > posicionx + 1 && mouseX<posicionx + 321 && mouseY >521 && mouseY<571) {
      pantalla = 6;
      seleccionpersonaje = 4;
    } else if (mouseX > posicionx + 3 && mouseX<posicionx + 149 && mouseY >612 && mouseY<663) {
      pantalla = 7;
      seleccionpersonaje = 5;
    } else if (mouseX > 32 && mouseX<430 && mouseY >707 && mouseY<764) {
      pantalla = 8;
      sw.restart();
      tiempoInicio1 = millis();
    }
  } else if (pantalla == 2) {
    if (mouseX > 18 && mouseX< 104 && mouseY > 20 && mouseY < 128) {
      pantalla = 0;
    }
  } else if (pantalla == 3) {
    if (mouseX > 18 && mouseX< 104 && mouseY > 20 && mouseY < 128) {
      pantalla = 0;
    }
  } else if (pantalla == 9){
    if (mouseX > 52 && mouseX< 140 && mouseY > 8 && mouseY < 115){
      pantalla = 0;
    }
  }
}

void mouseReleased() {
  //volumen
  vol[0].dragging = false;
  vol[1].dragging = false;
}

void mouseDragged() {
  //volumen
  if (vol[0].dragging) {
    vol[0].volume = constrain((mouseX - vol[0].sliderX) / vol[0].sliderWidth, 0, 1);
    music.amp(vol[0].volume);
    //amp controla valores de 0 siendo silencio y 1 siendo max
  }
  if (vol[1].dragging) {
    vol[1].volume = constrain((mouseX - vol[1].sliderX) / vol[1].sliderWidth, 0, 1);
    music1.amp(vol[1].volume);
    //amp controla valores de 0 siendo silencio y 1 siendo max
  }
}

void mouseMoved() {
  // Verifica si el mouse está sobre algún botón y actualiza el botón resaltado
  if (pantalla == 1 || pantalla == 4 || pantalla == 5 || pantalla == 6 || pantalla == 7) {
    if (mouseX > posicionx && mouseX < posicionx + 283 && mouseY > 243 && mouseY < 293) {
      botonResaltado = 1;
    } else if (mouseX > posicionx + 3 && mouseX < posicionx + 218 && mouseY > 336 && mouseY < 387) {
      botonResaltado = 2;
    } else if (mouseX > posicionx + 3 && mouseX < posicionx + 321 && mouseY > 428 && mouseY < 483) {
      botonResaltado = 3;
    } else if (mouseX > posicionx + 1 && mouseX < posicionx + 321 && mouseY > 521 && mouseY < 571) {
      botonResaltado = 4;
    } else if (mouseX > posicionx + 3 && mouseX < posicionx + 149 && mouseY > 612 && mouseY < 663) {
      botonResaltado = 5;
    } else if (mouseX > 32 && mouseX < 430 && mouseY > 707 && mouseY < 764) {
      botonResaltado = 6;
    } else {
      botonResaltado = -1; // Si no está sobre ningún botón, ningún botón resaltado
    }
  }
}
