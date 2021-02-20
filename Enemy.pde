class Enemy
{
  int x, y;
  Player player;

  int speedCounter = 0;
  int enemySpeed = 10;

  Enemy(int x, int y, Player player)
  {
    this.x = x;
    this.y = y;
    this.player = player;
  }

  void display()
  {
    image(enemyImage, x*gridSize, y*gridSize, gridSize, gridSize);
  }

  void speed()
  {
    if (speedCounter > 9) {
      enemySpeed--;
      speedCounter = 0;
      if (totalEnemys < enemy.length)
      {
        enemy[totalEnemys] = new Enemy(enemyStartPos, enemyStartPos, player); 
        totalEnemys++;
      }
    }
    enemySpeed = constrain(enemySpeed, 4, 10);
    totalEnemys = constrain(totalEnemys, 4, 12);
  }

  void moveTowardsPlayer()
  {
    int xDistance = player.x - x;
    int yDistance = player.y - y;
    if (frameCount % enemySpeed == 0) //speed of enemy
    {
      //moves closer to player
      if (abs(xDistance) >= abs(yDistance)) {
        if (xDistance <= 0 )
        {
          x--;
        } else if (xDistance >= 0)
        {
          x++;
        }
      } else if (abs(xDistance) < abs(yDistance))
      {
        if (yDistance <= 0 )
        {
          y--;
        } else if (yDistance >= 0)
        {
          y++;
        }
      }

      //a bit of randomness
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

  void damage()
  {
    if (collision())
    {
      player.takeDamage();
    }
  }
}
