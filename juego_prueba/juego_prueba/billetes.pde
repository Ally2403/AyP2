
class billetes {
  int dollarPositionsX, dollarPositionsY;
  boolean billete = true;
  billetes(int dollarPositionsX, int dollarPositionsY) {
    this.dollarPositionsX =  dollarPositionsX;
    this.dollarPositionsY =  dollarPositionsY;
  }
  void billetes1() {
    image(dollar, xpos1 + dollarPositionsX, dollarPositionsY);
    if (xpos >= xpos1 + dollarPositionsX - 50 && xpos <= xpos1 + dollarPositionsX + 90 && ypos == dollarPositionsY) {
      if (keyCode == UP) {
        System.out.print("hola");
        dollarPositionsX = -100; // Mover el cuadrado fuera de la pantalla
        dollars++; // Incrementar el contador
        billete = false;
      }
    }
  }
}
