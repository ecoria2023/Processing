class Cactus {
  float posX;
  int w ;
  int h ;
  int tipoCaptus; 
  //------------------------------------------------------------------------------------------------------------------------------------------------------
   Cactus( ) {
 posX = width;
  }

  //------------------------------------------------------------------------------------------------------------------------------------------------------
  //show the cactus
  void show() {
    fill(0);
    w = 40;
      h = 80;
      image(smallCactus, posX - smallCactus.width/2, height - groundHeight - smallCactus.height);
 
  }
  //------------------------------------------------------------------------------------------------------------------------------------------------------

  void move(float speed) {
    posX -= speed;
  }
  //------------------------------------------------------------------------------------------------------------------------------------------------------
 
 boolean ColisionaCon(float playerX, float playerY, float playerWidth, float playerHeight) {

    float playerLeft = playerX - playerWidth/2;
    float playerRight = playerX + playerWidth/2;
    float thisLeft = posX - w/2 ;
    float thisRight = posX + w/2;

    if ((playerLeft<= thisRight && playerRight >= thisLeft ) || (thisLeft <= playerRight && thisRight >= playerLeft)) {
      float playerDown = playerY - playerHeight/2;
      float thisUp = h;
      if (playerDown <= thisUp) {
        return true;
      }
    }
    return false;
  }
}

 
