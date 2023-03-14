class Player {
  float fitness;
   
  boolean replay = false;
 
 
  //-------------------------------------
  float posX = 0;
  float posY = 0;
  float velY = 0;
  float gravity =1.2;
  int runCount = -5;
  int size = 20;

  
  boolean seAgacha;
  boolean duck= false;
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  //constructor

  Player( ) {
    
   
   
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  //show the dino
  void show() {
    if (duck && posY == 0) {
      if (runCount < 0) {

        image(dinoDuck, playerXpos - dinoDuck.width/2, height - groundHeight - (posY + dinoDuck.height));
      } else {

        image(dinoDuck1, playerXpos - dinoDuck1.width/2, height - groundHeight - (posY + dinoDuck1.height));
      }
    } else
      if (posY ==0) {
        if (runCount < 0) {
          image(dinoRun1, playerXpos - dinoRun1.width/2, height - groundHeight - (posY + dinoRun1.height));
        } else {
          image(dinoRun2, playerXpos - dinoRun2.width/2, height - groundHeight - (posY + dinoRun2.height));
        }
      } else {
        image(dinoJump, playerXpos - dinoJump.width/2, height - groundHeight - (posY + dinoJump.height));
      }
    runCount++;
    if (runCount > 5) {
      runCount = -5;
    }
  }
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
 


  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  //checks for collisions and if this is a replay move all the obstacles
  void move() {
    posY += velY;
    if (posY >0) {
      velY -= gravity;
    } else {
      velY = 0;
      posY = 0;
    }

     
    
  }


  //---------------------------------------------------------------------------------------------------------------------------------------------------------
//what could this do????
  void jump(boolean bigJump) 
  {
     if(keyPressed){ 
      
       if(key=='b' || key=='B'){ 
      if (posY ==0) 
        {
          if (bigJump){
          gravity = 1;
          velY = 20;}
        
          else {
          gravity = 1.2;
          velY = 16;}
        }
        }
        
        }
}

  //---------------------------------------------------------------------------------------------------------------------------------------------------------

  void ducking(boolean isDucking) {

     if(posY != 0 && isDucking && keyPressed)
     {
     if(key=='a' || key=='A')
       {
       gravity=3;
       }
      
     }
     
  duck=isDucking;
  }
  
 

  //---------------------------------------------------------------------------------------------------------------------------------------------------------

  void update() {
 
    move();
  }
  //----------------------------------------------------------------------------------------------------------------------------------------------------------
 
}