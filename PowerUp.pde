class PowerUp
{
  int x, y;
  Player player;
  float spawnChance;

  boolean isDisplayed = false;
  boolean isSpawned = false;

  PowerUp(int x, int y, Player player)
  {
    this.x = x;
    this.y = y;
    this.player = player;
  }

  void display()
  {
    if (spawnChance > 0.80)
    {
      isSpawned = true;
      spawnChance = 0;
    }

    if (isSpawned == true && totalFood < 13)
    {
      image(powerUpImage, x*gridSize, y*gridSize, gridSize, gridSize);
      isDisplayed = true;
    }
  }

  boolean collision()
  {
    if (isDisplayed == true)
      if (player.x == x && player.y == y)
      {
        return true;
      } else {
        return false;
      }
    return false;
  }

  void reset(int x, int y)
  {
    if (collision())
    {

      if (totalFood < food.length)
      {
        food[totalFood] = new Food(foodStartPos, foodStartPos, player); 
        totalFood++;
      }

      powerUpSound.play();
      isDisplayed = false;
      isSpawned = false;

      this.x = x;
      this.y = y;
    }
    totalFood = constrain(totalFood, 4, 12);
  }
}
