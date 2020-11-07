//kris zhao
//breakout project
//1-1a programming 11



//library================================================================================
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer scoring, bounce, introbgm;

//font=============================================================================
PFont flower;

// game modes======================================================================
float pad1x, pad1y, pad1d;
float ballx, bally, balld;

boolean akey, dkey;

final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;


//Bricks' Variables ==============================================================
int[] x;
int[] y;
boolean[] alive;
int brickE;
int n;
int mode,timer;
PImage background;
PImage introbackground;
int Ex, Ey;
int score, lives;

//colors=================================================================================
color blue = #4F5EFC;
color purple = #B34FFC;
color yellow = #F6FC4F;
color orange = #FCA64F;
color green = #4FFC79;
color white = #FFFFFF;
color black = #000000;


void setup() {
  //background images===============================================================
  background=loadImage("background.jpg");
  introbackground=loadImage("introbackground.jpg");
  
  //sound effects======================================================================
  minim = new Minim(this);
   scoring=minim.loadFile("score.wav");
   bounce=minim.loadFile("bounce.wav");
   introbgm=minim.loadFile("introbgm.mp3");
   
 
  //bricks======================================================================
  lives=3;
  brickE=50;
  n=40;
  x= new int[n];
  y= new int[n];
  alive = new boolean[n];
  Ex=75;
  Ey=75;

  int i = 0;
  while (i<n) {
    x[i] = Ex;
    y[i] = Ey;
    alive[i] = true;
    Ex=Ex+75;
    if (Ex>width) {
      Ey=Ey+75;
      Ex=75;
    }
    i=i+1;
  }


  //everything else (fonts/balls/etc...)====================================================
  size(800, 800);
  mode = INTRO;
  flower=createFont("flower", 200);
  timer=100;
  pad1x=width/2;
  pad1y=height/1;
  pad1d=150;
  vx=3;
  vy=3;
  ballx= width/2;
  bally=height/2;
  balld=30;
}

//modes==============================================================================
void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode Error:" +mode);
  }
}
