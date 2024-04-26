
class enemigos {
  float posX;
  int posY;
  int leftLimit;
  int rightLimit;
  boolean right, left = true, vivo=true;
  float speed1 = 2;
  enemigos(float posX, int posY, int leftLimit, int rightLimit) {
    this.posX = posX;
    this.posY = posY;
    this.leftLimit = leftLimit;
    this.rightLimit = rightLimit;
  }
  void enemigos3() {
    if (aTodaMadre) {
      if (xpos + latinox >= xpos1 + posX &&
        xpos <= xpos1 + posX + imgLeft.width &&
        ypos + latinoy >= posY &&
        ypos <= posY + imgLeft.height) {
        vivo = false;
      }
    } else {
      //Colisión
      obstaculos(xpos1 + posX, posY, tamx, tamy);
    }

    // Actualizar la posición x
    posX += speed1;

    // Verificar los límites
    if (posX >= rightLimit || posX <= leftLimit) {
      // Cambiar la imagen y la dirección de movimiento
      if (posX >= rightLimit) {
        posX = rightLimit;
        image(imgRight, xpos1 + posX, ypos);
        right = true;
        left = false;
      } else if (posX <= leftLimit) {
        posX = leftLimit;
        image(imgLeft, xpos1 + posX, ypos);
        right = false;
        left = true;
      }
      speed1 *= -1; // Cambiar la dirección de movimiento
    } else {
      //Dibujar la imagen en su posición actual
      if (left) {
        image(imgLeft, xpos1 + posX, posY);
      } else if (right) {
        image(imgRight, xpos1 + posX, posY);
      }
    }
  }
}
