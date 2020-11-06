import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//minim
Minim minim;
AudioPlayer start, beep, boop, point, lose, win;
PFont breakout;
//gif variables
PImage[] gif;
int numPages;
int f;
//variables and arrays for bricks
int[] x;
int[] y;
boolean[] alive;
int brickd;
int n;
//mode framework variables
int mode;
final int intro = 0;
final int game = 1;
final int pause = 2;
final int gameOver = 3;
//game variables
int score = 0;
float bx, by, d, vx, vy;
float padx, pady, padd;
int lives;
//keyboard variables
boolean akey;
boolean skey;
int tempx, tempy;
//colour variables
color orange = #FF9A03;
color aqua = #03FFF9;
color purple = #B507F5; //#BA31E5;
color green = #7AFA6A;
float v;
float a;

void setup() { 
  size(1200, 900);
  mode = intro;
  minim = new Minim(this);
  start = minim.loadFile("intro.wav");
  beep = minim.loadFile("beep.wav");
  boop = minim.loadFile("boop.wav");
  point = minim.loadFile("break.wav");
  win = minim.loadFile("win.wav");
  lose = minim.loadFile("failure.wav");
  //initialize ball variables
  bx = random(15, width-15);
  by = height-200;
  d = 30;
  vx = random(-5,5);
  vy = random(-5,5);
  //initialize paddle
  padx = width/2;
  pady = height - 100;
  padd = 70;
  //initialize keys
  skey = false;
  akey = false;
  //initialize lives
  lives = 3;
  //initialize brick variables
  tempx = 100;
  tempy = 150;
  brickd = 50;
  n = 44;
  //initialize arrays
  x = new int[n]; 
  y = new int[n];
  alive = new boolean[n];
 //initialize font
  breakout = createFont("Breakout.ttf", 200);
  //initialize gif array and variables
  numPages = 37;
  gif = new PImage[numPages];
  //prepare to load gif
  int ii = 0;
  while (ii < numPages) {
    gif[ii] = loadImage("frame_"+ii+"_delay-0.04s.gif");
    ii ++;
  }
  //set brick positions
  int i = 0;
  while (i < n) {
    alive[i] = true;
    x[i] = tempx;
    y[i] = tempy;
    tempx = tempx + 100;
    if (tempx == width) {
      tempx = 100;
      tempy = tempy + 100;
    }
    i ++;
  }
    textFont(breakout);
}


void draw() {
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == pause) {
    pause();
  } else if (mode == gameOver) {
    gameOver();
  } else {
    println("Error: Mode = " + mode);
  }
} 
