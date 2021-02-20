class UI
{  
  void display()
  {
    PFont f = createFont("Arial", 12, true); 
    textFont(f, 22);

    textAlign(LEFT);
    fill(255);
    text("Score: " + player.playerScore, 10, 20);
    text("high Score: " + resetGame.highScore, 10, 40);
  }
}
