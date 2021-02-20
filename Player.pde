class Player
{
  int x, y;
  int health;
  int playerScore = 0;
  boolean isAlive = false;

  boolean right, left, up, down;
  int playerSpeed = 1;

  Player(int x, int y)
  {
    this.x = x;
    this.y = y;
    health = 10;
  }

  void display()
  {
    image(playerImage, x*gridSize, y*gridSize, gridSize, gridSize);
  }

  void takeDamage()
  {
    health--;
  }
  void getHealth()
  {
    health++;
    constrain(health, 0, 20);
  }

  void movement()
  {
    if (frameCount % 4 == 0) {
      x += playerSpeed*(int(right) - int(left));
      y += playerSpeed*(int(down) - int(up));
    }

    x = constrain(x, 0, 24);
    y = constrain(y, 0, 24);
  }

  boolean setMove(int keyCheck, boolean iskeyPressed)
  {
    switch (keyCheck) {
    case + UP:
    case + 'W':
      return up = iskeyPressed;
    case + DOWN:
    case + 'S': 
      return down = iskeyPressed;
    case + LEFT:
    case + 'A':
      return left = iskeyPressed;
    case + RIGHT:
    case + 'D' :
      return right = iskeyPressed;

    default:
      return iskeyPressed;
    }
  }

  void dead()
  {
    if (health < 1)
    {
      isDead.play();
      isAlive = false;
    }
  }
}
