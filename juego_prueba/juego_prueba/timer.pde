class volumen {
  float volume;
  float sliderX;
  float sliderY;
  float sliderWidth;
  float sliderHeight;
  boolean dragging;
  volumen(float volume, float sliderX, float sliderY, float sliderWidth, float sliderHeight, boolean dragging) {
    this.volume = volume;
    this.sliderX = sliderX;
    this.sliderY = sliderY;
    this.sliderWidth = sliderWidth;
    this.sliderHeight = sliderHeight;
  }
  void volumen1() {
    // Calcular el porcentaje de volumen
    int percent = int(volume * 100);

    // Dibujar la barra de volumen
    fill(#694433); // Antes de la barra
    rect(sliderX, sliderY, volume * sliderWidth, sliderHeight);

    //volume * sliderWidth es el ancho de la barra

    fill(#FFDE00); // Después de la barra
    rect(sliderX + volume * sliderWidth, sliderY, (1 - volume) * sliderWidth, sliderHeight);

    // Dibujar el texto del porcentaje de volumen
    fill(255);
    textAlign(CENTER, CENTER);
    text(percent + "%", sliderX + sliderWidth / 2, sliderY + sliderHeight / 2);

    // Dibujar el control deslizante
    fill(255);
    rect(constrain(sliderX + volume * sliderWidth - 5, sliderX, sliderX + sliderWidth - 5), sliderY, 5, sliderHeight);

    textAlign(CENTER);
    textSize(40);
    fill(255);
    text("Music", 780, 100);
    text("Sound Efects", 800, 220);
  }
}
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
