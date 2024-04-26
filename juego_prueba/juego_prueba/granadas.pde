
class granada {
  float posinicialx;
  float x1 = posinicialx, y1 = yinicial, posx; // Posición de la bola
  float vx, vy; // Velocidades en x e y
  float g = 0.5; // Gravedad
  float r = 20;
  float friccion = 0.95; // Coeficiente de fricción
  boolean enMovimiento; // Variable para controlar si la bola está en movimiento
  int tiempoAnterior = millis(); // Variable para almacenar el tiempo en que se lanzó la bola anteriormente
  int tiempoEspera = int(random(1000, 4000)); // Tiempo de espera antes de lanzar la bola nuevamente

  granada(int posx, float posinicialx) {
    this.posx = posx;
    this.posinicialx = posinicialx;
  }

  void moveGranada() {
    posx = xpos1 + x1;
    image(granada, xpos1 + x1, y1, r*3, r*3);
    colisiongranada();
    if (enMovimiento) {
      x1 += vx;
      y1 += vy;
      vy += g;

      // Revisa si la bola llega al suelo
      if (y1 + r >= 900-290) {
        y1 = 900-290 - r; // Ajusta la posición para que la bola esté justo en el suelo
        vy = 0; // Detiene el movimiento vertical

        // Aplica fricción al movimiento horizontal
        vx *= friccion;

        // Si la velocidad horizontal es muy baja, detiene la bola
        if (abs(vx) < 0.1) {
          enMovimiento = false;
          // Actualiza el tiempo anterior y el tiempo de espera
          tiempoAnterior = millis();
          tiempoEspera = int(random(1000, 4000)); // Tiempo de espera aleatorio entre 1 y 5 segundos
        }
      }
    }
    // Verifica si ha pasado el tiempo de espera y lanza la bola nuevamente
    if (!enMovimiento && millis() - tiempoAnterior >= tiempoEspera) {
      lanzarBolita(posinicialx+200);
    }
  }

  // Función para lanzar la bolita
  void lanzarBolita(float posinicialx) {
    // Genera un número aleatorio que determina la dirección del lanzamiento (-1 para izquierda, 1 para derecha)
    float direccion = random(-1, 1);

    // Asigna la velocidad inicial en x en función de la dirección del lanzamiento
    vx = direccion * random(3, 8); // Velocidad aleatoria entre 3 y 8

    // Asigna la velocidad inicial en y
    vy = random(-10, -20); // Velocidad aleatoria entre -10 y -20

    // Reinicia la posición de la bola
    x1 = posinicialx;
    y1 = yinicial;

    // Reinicia la variable de control de movimiento
    enMovimiento = true;
  }

  void colisiongranada() {
    if (!invulnerable) {
      if (xpos + latinox >= posx &&
        xpos <= posx + r*3 &&
        ypos + latinoy >= y1 &&
        ypos <= y1 + r*3) {
        saltar();
        if (derecha) {
          xpos = xpos - 150;
        }
        if (izquierda) {
          xpos = xpos + 150;
        }
        colision = colision - 1;
        fill(255, 0, 0);
        textSize(20);
        textAlign(CENTER);
        text("¡Colisión detectada!", 100, 100, 780, 100);
        x1 = posinicialx;
        y1 = yinicial;

        invulnerable = true; // Activar la invulnerabilidad
        tiempoColision = millis(); // Actualizar el tiempo de la última colisión
      }
    }
  }
}
