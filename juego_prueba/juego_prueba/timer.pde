class Timer {
  int startTime = 0, pauseTime = 0, totalPausedTime = 0;
  boolean running = false;
  boolean paused = false;

  void start() {
    if (!running) {
      startTime = millis() - totalPausedTime;
      running = true;
      paused = false;
    }
  }
  void stop() {
    running = false;
    paused = false;
  }

  void pause() {
    if (running && !paused) {
      pauseTime = millis();
      paused = true;
    }
  }

  void resume() {
    if (running && paused) {
      totalPausedTime += millis() - pauseTime;
      paused = false;
    }
  }

  void restart() {
    startTime = millis();
    totalPausedTime = 0;
    running = true;
    paused = false;
  }
  int getElapsedTime() {
    int elapsed;
    if (running) {
      if (paused) {
        elapsed = pauseTime - startTime - totalPausedTime;
      } else {
        elapsed = millis() - startTime - totalPausedTime;
      }
    } else {
      elapsed = 0;
    }
    return elapsed;
  }

  int milisecond() {
    return (getElapsedTime() / 10) % 100;
  }

  int second() {
    return (getElapsedTime() / 1000) % 60;
  }

  int minute() {
    return (getElapsedTime() / (1000 * 60)) % 60;
  }
}

void time() {
  textAlign(CENTER);
  textSize(40);
  fill(255);
  //NF CONVIERTE NÚMEROS A STRING AÑADIENDO 0 A LA IZQUIERDA, POR ESO SE PONE COMO PARÁMETRO 2 PARA QUE SOLO MUESTRE 2 DÍGITOS
  text(nf(sw.minute(), 2)+":"+nf(sw.second(), 2)+":"+nf(sw.milisecond(), 2), 780, 100);
  //cuando llegue a 100 segundos muera
  if(sw.minute() == 1 && sw.second() == 40 && sw.milisecond() <= 00){
    colision = 0;
  }
}
