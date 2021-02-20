class Food
{
  int x, y;
  Player player;

  Food(int x, int y, Player player)
  {
    this.x = x;
    this.y = y;
    this.player = player;
  }

  void display()
  {
    image(foodImage, x*gridSize, y*gridSize, gridSize, gridSize);
  }

  void moveAwayFromPlayer()
  {
    int xDistance = player.x - x;
    int yDistance = player.y - y;

    int playerDistance = (int) dist(player.x, player.y, x, y);

    //Food only moves away form player if player gets to close
    if (frameCount % 10 == 0) 
    {
      if (abs(xDistance) >= abs(yDistance) && playerDistance < 10) {
        if (xDistance < 0 )
        {
          x++;
        } else if (xDistance > 0)
        {
          x--;
        }
      } else if (abs(xDistance) < abs(yDistance) && playerDistance < 10)
      {
        if (yDistance < 0 )
        {
          y++;
        } else if (yDistance > 0)
        {
          y--;
        }
      }

      // if player is no around, food moves random
      int randomness = (int) random(101);
      if (randomness <= 25) {
        y++;
      } else if (randomness <= 50) {
        y--;
      } else if (randomness <= 75) {
        x++;
      } else {
        x--;
      }
      y = constrain(y, 0, 24);
      x = constrain(x, 0, 24);
    }
  }

  boolean collision()
  {
    if (player.x == x && player.y == y)
    {
      return true;
    } else {
      return false;
    }
  }

  void reset(int x, int y)
  {
    if (collision())
    {
      player.getHealth();
      player.playerScore++;
      goldenFood.scoreCounter++;
      pickUpFood.play();

      powerUp.spawnChance = random(1);

      for (int i = 0; i < totalEnemys; i++)
      {
        enemy[i].speedCounter++;
      }

      this.x = x;
      this.y = y;
    }
  }
}
