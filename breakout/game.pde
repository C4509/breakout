void game() {
  background(#6AA2FA);
  textSize(50);
  fill(255);
  start.rewind();
  start.pause();
  //score count
  text("Score:" + score, 100, 75);
  //lives count
  text("Lives:" + lives, 360, 75);
  text("Want to pause the game? Just click the screen.", 550, 75);
  fill(#82E5A4);
  //paddle
  circle(padx, pady, padd);
  //ball
  circle(bx, by, d);
  //control paddle with keys
  if (akey==true) {
    padx = padx - 5;
  }
  if (skey==true) {
    padx = padx + 5;
  }
  //paddle limits
  if (padx < 35) {
    padx = 35;
  }
  if (padx > width - 35) {
    padx = width - 35;
  }
  //bpunce the ball
  bx = bx + vx;
  by = by + vy;
  //ball bounce off walls
  if (bx < 15||bx > width - 15) {
    vx = vx* -1;
    beep.rewind();
    beep.play();
  }
  if (by < 15 || by > height-85) {
    vy = vy  * -1;
  }
  if (by < 15) {
    beep.rewind();
    beep.play();
  }
  //stop ball from going straight up or down
  if (vy < 0 && vy > -0.5) {
    vy = -0.5;
  }
  if (vy > 0 && vy < 0.5) {
    vy = 0.5;
  }
    if (vx < 0 && vx > -0.5) {
    vx = -0.5;
  }
  if (vx > 0 && vx < 0.5) {
    vx = 0.5;
  }

//ball limits
  if (bx < 15) {
   bx = 15;
  }
  if (bx > width - 15) {
    bx = width - 15;
  }
    if (by < 15) {
    by = 15;
  }
  if (by > height - 85) {
    by = height - 85;
     lives --;
    boop.rewind();
    boop.play();
  }

  //check if brick is alive
  int i = 0;
  while ( i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i ++;
  }





  //make ball bounce off paddle
  if (dist(padx, pady, bx, by) < d/2 + padd/2) { 
    vx = (bx - padx)/10;
    vy = (by - pady)/10;
    beep.rewind();
    beep.play();
  }
}



void gameClicks() {
  mode = pause;
}
//manage bricks
void manageBrick(int i) {
  //brick colours
  if (y[i] == 150) { 
    fill(#F55707);
  } else if (y[i] == 250) {
    fill(orange);
  } else if (y[i] == 350) {
    fill(purple);
  } else if (y[i] == 450) {
    fill(aqua);
  }
  //draw bricks
  circle(x[i], y[i], brickd);
  //break bricks
  if (dist(bx, by, x[i], y[i]) < d/2 + brickd/2) { 
    vx = (bx - x[i])/10;
    vy = (by - y[i])/10;
    alive[i] = false;
    point.rewind();
    point.play();
    score = score + 3;
  }
  if (score == n*3||lives == 0) {
    mode = gameOver;
  }
}
