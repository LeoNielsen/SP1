class ResetGame
{
  int highScore = 0;
  int yourScore = 0;

  void gameOver()
  {
    yourScore = player.playerScore;
    if (yourScore > highScore)
    {
      highScore = yourScore;
    }
    PFont f = createFont("Arial", 12, true); 
    textFont(f, 48);
    textAlign(CENTER);
    fill(255);
    text("GAME OVER!!!", width/2, height/2 -100);
    text("Your Score: " + yourScore, width/2, height/2-50);
    text("High Score: " + highScore, width/2, height/2);

    textFont(f, 30);
    text("Press R to restart", width/2, height/2 +150);
  }

  void restart()
  {
    if (key == 'r')
    {
      player.health = 10;
      player.playerScore = 0;
      player.x = playerStartPos;
      player.y = playerStartPos;

      totalEnemys = 4;
      goldenFood.scoreCounter = 0;

      for (int i = 0; i < totalEnemys; i++)
      {
        enemy[i].x = enemyStartPos; 
        enemy[i].y = enemyStartPos;
      }

      for (int i = 0; i < totalFood; i++) {
        food[i].x = foodStartPos;
        food[i].y = foodStartPos;
      }

      player.isAlive = true;
    }
  }
}
