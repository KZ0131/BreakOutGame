

void intro() {
  //background=======================================================
  background.resize(800, 800);
  image(introbackground,0, 0);
  
  
  //song =====================================================
  if (!introbgm.isPlaying()) {
    introbgm.rewind();
    introbgm.play();
  }
  
  
  //text / title==============================================================
  fill(orange);
  textSize(100);
  text("BreakOut",190,300);
  fill(orange);
  textSize(30);
  text("click anywhere to start!",250,500);


}


void introClicks() 
  {
 if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 800) {
    mode = GAME ;
}
}
