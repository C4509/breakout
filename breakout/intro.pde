void intro(){
  //gif
loadGif();
//sounds
start.play();
win.rewind();
win.pause();
lose.rewind();
lose.pause();
  textSize(300);
fill(aqua);
textAlign(NORMAL);
  v = sin(a)*30 + 130;
  text("Breakout", 225,300);
  textSize(v);
 a = a + 0.1;

  text("Click to start",350,600);
}

void introClicks(){
  mode = game;
  
}
