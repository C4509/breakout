void pause(){
    background(#6AA2FA);
  textSize(500);
  fill(aqua);
    v = sin(a)*30 + 150;
text("PAUSE",200,400);

  textSize(v);
 a = a + 0.05;

  text("Click to Resume",250,600);


}

void pauseClicks(){
  mode = game;
  
}
