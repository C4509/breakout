void gameOver(){
  loadGif();
   fill(aqua);
  //animate text
  v = sin(a)*30 + 130;
  textSize(v);
 a = a + 0.1;
  text("Click to restart",350,600);
  //win screen
  if(score == n*3){
    win.play();
    textSize(300);
    text("You Win!",300,300);
    //lose screen
  } else if(lives == 0||lives < 0){
    textSize(300);
    lose.play();
    text("You Lose...",250,300);

  }
     
}

void gameOverClicks(){
mode = intro;
//reset score and lives
score = 0;
lives = 3;
//reset ball and paddle positions
bx = random(15, width-15);
by = height-200;
vx = random(5);
vy = random(5);
padx = height/2;
//reset bricks
int i = 0;
while(i < n){
  alive[i] = true;
  i ++;
}
}
