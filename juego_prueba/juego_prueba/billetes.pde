
class billetes {
  float dollarPositionsX, dollarPositionsY;
  boolean billete = true;
  billetes(float dollarPositionsX, int dollarPositionsY) {
    this.dollarPositionsY =  dollarPositionsY;
    this.dollarPositionsX =  dollarPositionsX;
  }
  void billetes1() {
    image(dollar, xpos1 + dollarPositionsX, dollarPositionsY);
    if (xpos >= xpos1 + dollarPositionsX - 50 && xpos <= xpos1 + dollarPositionsX + 90 && ypos == dollarPositionsY) {
      if (keyCode == UP) {
        System.out.print("hola");
        dollarPositionsX = -100; // Mover el cuadrado fuera de la pantalla
        dollars++; // Incrementar el contador
        dollarcount++;
        billete = false;
      }
    }
  }
}

void dollar_vida() {
  if (dollarcount == 10) {
    dollarcount = 0;
    colision = colision + 1;
  }
}
