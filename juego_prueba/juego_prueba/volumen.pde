void volumen(){
  // Calcular el porcentaje de volumen
  int percent = int(volume * 100);
  
  // Dibujar la barra de volumen
  fill(#694433); // Antes de la barra (rojo)
  rect(sliderX, sliderY, volume * sliderWidth, sliderHeight);
  
  //volume * sliderWidth es el ancho de la barra
  
  fill(#FFDE00); // Después de la barra (verde)
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
  text("Volume", 780, 150);
}
