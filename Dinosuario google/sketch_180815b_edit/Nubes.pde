class Nube{
  
  float posX = width;
  float posY = height - floor(random(200 ,450)); 
 
  //CAPTUS
  //float posY = height - floor(random(height ,height/2));
 
  int w = floor(random(1,8));
  
  Nube(){}
 
  void show(){
    stroke(0);
    image(nube, posX,posY);

  }
  
  
  void move(float speed) {
    posX -= speed;
  } 
}
