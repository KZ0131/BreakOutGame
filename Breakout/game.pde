float vx, vy;
//theme music============================================================
void game() {
  if (!introbgm.isPlaying()) {
    introbgm.rewind();
    introbgm.play();
  }
  background.resize(800, 800);
  image(background, 0, 0);

  //barriers    ====================================================================
  if (pad1x < 70) {
    pad1x = 70;
  }

  if (pad1x > 730) {
    pad1x = 730;
  }
  
  //timer==============================================================
  timer = timer - 1;
  if (timer < 0) {
    bally = bally + vy;
    ballx = ballx + vx;
  }
  
  
 //lives/scores===================================================================
  fill(white);
  textSize(50);
  text("Health=" +lives, 300, 500);
  text("Scores=" +score, 300, 550);
 //paddle==========================================================================
  strokeWeight(0);
  fill(purple);
  circle(pad1x, pad1y, pad1d);
 //ball===========================================================
  strokeWeight(1);
  fill(white);
  circle(ballx, bally, balld);
 //Lose Health==========================================================
  if (bally > 800) {
    timer = 100;
    bally = 400;
    ballx = 400;
    lives = lives - 1;
    
  }
  if (lives == 0) {
    mode = GAMEOVER;
  }
 //move=================================================================
  if (akey == true) pad1x = pad1x - 5;
  if (dkey == true) pad1x = pad1x + 5;
  if (bally <= 0 + balld / 2) {
    vy = vy * - 1;
  }
  //bouncing=====================================================================
  if (dist(pad1x, pad1y, ballx, bally) <= pad1d / 2 + balld / 2 ) {
    bounce.rewind();
    bounce.play();
    vy=(bally - pad1y) / 22;
    vx=(ballx - pad1x) / 22;
  }
  if (ballx < balld / 2 || ballx > width - balld / 2) {
    bounce.rewind();
    bounce.play();
    balld = balld * 1;
    vx = vx * -1;
  }
  //Bricks========================================================================================
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      Bricks(i);
    } 
    i++;
  }
}

void gameClicks () {
  if (dist(mouseX, mouseY, 0, 0) < 800) {
    mode = PAUSE;
    textSize(200);
    text("PAUSE", 150, 450);
  }
}

void Bricks(int i) {
  
  stroke(0);
  strokeWeight(2);
  
  if (y[i] == 75)  fill(orange);
  
  if (y[i] == 150) fill(blue);
  
  if (y[i] == 225) fill(yellow);
  
  if (y[i] == 300) fill(green);
  
  circle(x[i], y[i], brickE);
  
  if (dist(x[i], y[i], ballx, bally) <= brickE / 2 + balld / 2) {
   
    vx=(ballx - x[i]) / 8;
    vy=(bally - y[i]) / 8;
    alive[i] = false;
    scoring.rewind();
    scoring.play();
    score = score+1;
  
    if (score == n) mode = GAMEOVER;
  }
}
