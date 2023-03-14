class Piso{
  float posX = width;
  int posY =  height -floor(random(groundHeight - 30,groundHeight +10));
  
  //NUBES
  //float posY = height - floor(random(300 ,400));
  
  //CAPTUS
  //float posY = height - floor(random(height ,height/2));
 
  int w = floor(random(1,8));
  
  Piso(){}
 
  void show(){
    stroke(0);
    strokeWeight(1);
    line(posX,posY, posX + w, posY);

  }
  
  
  void move(float speed) {
    posX -= speed;
  } 
}
