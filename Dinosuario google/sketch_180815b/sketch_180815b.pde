
//images
PImage dinoRun1;
PImage dinoRun2;
PImage dinoJump;
PImage dinoDuck;
PImage dinoDuck1;
PImage smallCactus;
PImage manySmallCactus;
PImage bigCactus;
PImage bird;
PImage bird1;

int playerXpos = 150;
int groundHeight = 250;
boolean a;
boolean b;
Player p1;

void setup()
{
  size(800,400);

  dinoRun1 = loadImage("dinorun0000.png");
  dinoRun2 = loadImage("dinorun0001.png");
  dinoJump = loadImage("dinoJump0000.png");
  dinoDuck = loadImage("dinoduck0000.png");
  dinoDuck1 = loadImage("dinoduck0001.png");
  
  p1 = new Player( );
}





void draw()
{
  background(255);

  p1.show();
  p1.move();
  p1.jump(a);
  p1.ducking(b);
  p1.update();
}