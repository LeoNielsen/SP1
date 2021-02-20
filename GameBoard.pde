class GameBoard
{

  void display()
  {
    for (int x = 0; x < grid.length; x++)
    {
      for (int y = 0; y < grid.length; y++)
      {
        stroke(50, 120, 30);
        if ((x+y) % 2 == 0)
        {
          fill(50, 150, 30);
          rect(x * gridSize, y * gridSize, gridSize, gridSize);
        } else 
        {      
          fill(50, 140, 30);
          rect(x * gridSize, y * gridSize, gridSize, gridSize);
        }
      }
    }
  }
}
