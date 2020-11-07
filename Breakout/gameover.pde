void gameover() {
  
  //winner screen================================================
  if (score == n) {
    
    fill(orange);
    background(black);
    textSize(150);
    text("YOU WON!", 80, 400);
    textSize(25);
    text("click anywhere to ENJOY again", 120, 500);
  }

  //loser screen==================================================
  if (lives == 0) {
    
    fill(orange);
    background(black);
    textSize(150);
    text("FAILED!", 80, 400);
    textSize(25);
    text("click anywhere to TRY again", 120, 500);
  }
}
//reset to intro===========
void gameoverClicks() {
  if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 800) { 
    mode = INTRO;
    lives=3;
    score=0;
  }
}
