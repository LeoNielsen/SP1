import processing.sound.*;

SoundFile pickUpFood;
SoundFile pickUpGoldenFood;
SoundFile powerUpSound;
SoundFile isDead;
SoundFile jingle;

int gridSize = 40;
int[][] grid = new int[25][25];

int ranX;
int ranY;

GameBoard gameBoard = new GameBoard();
ResetGame resetGame = new ResetGame();
Menu menu = new Menu();
UI gameUI = new UI();

Player player;
int playerStartPos = 0;
PImage playerImage;

PowerUp powerUp;
PImage powerUpImage;

GoldenFood goldenFood;
PImage goldenFoodImage;

Food[] food = new Food[12];
int totalFood = 4;
int foodStartPos = 12;
PImage foodImage;


Enemy[] enemy = new Enemy[12];
int totalEnemys = 4;
int enemyStartPos = 24;
PImage enemyImage;

void setup()
{
  size(1001, 1001, FX2D);

  playerImage = loadImage("sprites/bunny1_stand.png");
  foodImage = loadImage("sprites/carrot.png");
  goldenFoodImage = loadImage("sprites/carrot_gold.png");
  enemyImage = loadImage("sprites/spikeMan_stand.png");
  powerUpImage = loadImage("sprites/powerup_carrot.png");

  pickUpFood = new SoundFile(this, "audio/PickUpFood.wav");
  pickUpGoldenFood = new SoundFile(this, "audio/PickUpGoldenFood.wav");
  powerUpSound = new SoundFile(this, "audio/powerUp.wav");
  isDead = new SoundFile(this, "audio/isDead.wav");
  jingle = new SoundFile(this, "audio/SevenNationArmy.wav");


  player = new Player(playerStartPos, playerStartPos);
  goldenFood = new GoldenFood(foodStartPos, foodStartPos, player);
  powerUp = new PowerUp((int) random(25), (int) random(25), player);
  for (int i = 0; i < totalFood; i++) {
    food[i] = new Food(foodStartPos, foodStartPos, player);
  }
  for (int i = 0; i < totalEnemys; i++) {
    enemy[i] = new Enemy(enemyStartPos, enemyStartPos, player);
  }

  jingle.loop();
}


void draw()
{
  ranX = (int) random(25);
  ranY = (int) random(25);


  // background
  gameBoard.display();

  //game elements
  if (!player.isAlive)
  {
    resetGame.gameOver();
    resetGame.restart();

    if (menu.startMenuAktiv) {

      menu.startMenu();
      menu.beginGame();
    }
  } else {

    powerUp.display();
    powerUp.collision();
    powerUp.reset(ranX, ranY);
    println(powerUp.spawnChance);

    goldenFood.display();
    goldenFood.collision();
    goldenFood.reset(ranX, ranY);

    player.display();
    player.movement();
    player.dead();

    for (int i = 0; i < totalFood; i++) {
      food[i].display();
      food[i].moveAwayFromPlayer();
      food[i].collision();
      food[i].reset(ranX, ranY);
    }
    for (int i = 0; i < totalEnemys; i++) {
      enemy[i].display();
      enemy[i].speed();
      enemy[i].moveTowardsPlayer();
      enemy[i].collision();
      enemy[i].damage();
    }




    gameUI.display();
  }
}

void keyPressed()
{
  player.setMove(keyCode, true);
}

void keyReleased()
{
  player.setMove(keyCode, false);
  menu.mute();
}
