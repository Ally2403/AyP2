
void keyPressed() {
  if (keyCode == RIGHT) {
    derecha = true;
  } else if (keyCode == LEFT) {
    izquierda = true;
  }
  if (keyCode == DOWN) {
    abajo = true;
  }
  //a toda madre
  if (keyCode == ' ') { // Espacio
    spacePressed = true;
    spaceWhileDown = abajo; // Verifica si la tecla de abajo estaba presionada al presionar Spacebar
  }
  if (key == ' ' && !saltando && abajo == false && aTodaMadre == false) {
    saltar();
  }
  if (keyCode == TAB) {
    pausa = true;
    sw.pause();
  }
}

void keyReleased () {
  if (keyCode == RIGHT) {
    derecha = false;
  } else if (keyCode == LEFT) {
    izquierda = false;
  }
  if (keyCode == DOWN) {
    abajo = false;
    if (spacePressed && spaceWhileDown) {
      aTodaMadre = true;
      if (!movimiento) {
        movimiento = true; // Iniciar el movimiento
        tiempoInicio = millis(); // Guardar el tiempo de inicio del movimiento
      }
    }
  }
  if (keyCode == ' ') { // Espacio
    spacePressed = false;
  }
}
