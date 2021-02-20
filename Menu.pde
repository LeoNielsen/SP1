class Menu
{
  boolean startMenuAktiv = true;

  void startMenu()
  {
    background(255);
    fill(0);
    stroke(0);


    PFont f = createFont("Arial", 12, true); 
    textFont(f, 48);
    textAlign(CENTER);
    text("Welcome to the bunny Game", width/2, height/2 -300);

    textFont(f, 25);
    text("The bunny is hungry! help James to catch all the carrots!", width/2, height/2-150);
    text("but be careful! the pikemen are trying to protect the carrots!", width/2, height/2-110);

    imageMode(CENTER);
    image(playerImage, width/2, height/2 +50, 100, 150);
    imageMode(CORNER);

    textFont(f, 30);
    text("Press space to start", width/2, height/2+200);

    textFont(f, 25);
    text("Press M to mute", width/2, height/2+400);
  }

  void beginGame()
  {
    if (key == ' ')
    {
      startMenuAktiv = !startMenuAktiv;
      player.isAlive = true;
    }
  }

  void mute()
  {
    if (keyCode == 'M') {
      if (jingle.isPlaying())
      {
        jingle.stop();
      } else {
        jingle.loop();
      }
    }
  }
}
