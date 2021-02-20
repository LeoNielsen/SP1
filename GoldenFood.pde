class GoldenFood
{
  int x, y;
  Player player;

  int scoreCounter = 0;

  GoldenFood(int x, int y, Player player)
  {
    this.x = x;
    this.y = y;
    this.player = player;
  }

  void display()
  {

    if (scoreCounter > 9)
    {
      image(goldenFoodImage, x*gridSize, y*gridSize, gridSize, gridSize);
    }
  }

  boolean collision()
  {
    if (scoreCounter > 9) {
      if (player.x == x && player.y == y)
      {
        return true;
      }
    } else {
      return false;
    }
    return false;
  }

  void reset(int x, int y)
  {
    if (collision())
    {
      player.getHealth();
      player.playerScore += 10;
      scoreCounter = 0;     
      pickUpGoldenFood.play();

      this.x = x;
      this.y = y;
    }
  }
}
