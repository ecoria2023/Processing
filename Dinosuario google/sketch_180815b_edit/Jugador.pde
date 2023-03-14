class Player {
  float fitness;
   
  boolean replay = false;
 
 
  //-------------------------------------
  float posX = 0;
  float posY = 0;
  float velY = 0;
  float gravity =1.2;
  int contRun = -5;
  int size = 20;
  int cont=0;
  int tamImagenX;
  int tamImagenY;
  int score;
  boolean seAgacha;
  boolean duck;
  //---------------------------------------- 
  //constructor

  Player( ) {
    
   //Cambiar el resize al t-rex
   tamImagenX=75;
   tamImagenY=75;
   
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------------------
 
  void show() {
    
      Puntaje();
    dinoRun1.resize(tamImagenX,tamImagenY);
    dinoRun2.resize(tamImagenX,tamImagenY);
    dinoJump.resize(tamImagenX,tamImagenY);
    dinoDuck.resize(tamImagenX,40);
    dinoDuck1.resize(tamImagenX,40);
    

    
   if (duck==true) 
    {
      
      if (contRun < 0)   
      {image(dinoDuck, playerXpos - dinoDuck.width/2, height - groundHeight - (posY + dinoDuck.height));}
      
      else 
      {image(dinoDuck1, playerXpos - dinoDuck1.width/2, height - groundHeight - (posY + dinoDuck1.height));}
   } 
    
   else
      
      if (posY ==0) 
      {
        if (contRun < 0) 
        {image(dinoRun1, playerXpos - dinoRun1.width/2, height - groundHeight - (posY + dinoRun1.height));}
        
        else 
        {image(dinoRun2, playerXpos - dinoRun2.width/2, height - groundHeight - (posY + dinoRun2.height));}
      } 
  
  else 
       {image(dinoJump, playerXpos - dinoJump.width/2, height - groundHeight - (posY + dinoJump.height));}
    
    contRun++;
    
    if (contRun > 5) 
    {contRun = -5;}
    
  }
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
 


  //---------------------------------------------------------------------------------------------------------------------------------------------------------
 
  void move() 
  {
    
   posY += velY;
    
   if (posY >0) 
      {velY -= gravity;}   
   
   else 
      {velY = 0;
       posY = 0; }
     
       //Aca colision
     for (int i = 0; i< montonCactus.size(); i++) 
       {     
        if (montonCactus.get(i).ColisionaCon(playerXpos, posY +dinoRun1.height/2, dinoRun1.width*0.5, dinoRun1.height)) {
             Perdio();
            }   
       }        
           
  }
  
 


  //---------------------------------------------------------------------------------------------------------------------------------------------------------
 
  void esta(boolean Saltando) 
  {
     if(keyPressed){ 
      
       if(key=='c' || key=='C'){ 
      if (posY ==0) 
        {
          if (Saltando){
          gravity = 1;
          velY = 20;}
        
          else {
          gravity = 0.7;
          velY = 16;}
        }
        }
        
        }
}

  //---------------------------------------------------------------------------------------------------------------------------------------------------------

  void duck(boolean estaDuckeando) {
    duck=estaDuckeando;
     //if(posY != 0 && isDucking)
     //{
     //if(key=='a' || key=='A')
     //  {
     //  gravity=3;
     //  }
      
     //}
     
     if(keyPressed)
     {
     if(key=='Z' || key=='z')
       {
       duck=true;
        
       }
     }
     else{duck=false;  }
     
   
  }
  
 

  //---------------------------------------------------------------------------------------------------------------------------------------------------------

  void update() {
 
    move();
  }
  //----------------------------------------------------------------------------------------------------------------------------------------------------------
   void Perdio()
   {
    stop();
    textSize(32);
    fill(155);
    text("Oops!",width/2,height/2);
   }
   
  void Puntaje()
  {
  score=score+1;
  textSize(17);
  fill(155);
  text("RECORRIDO : "+score,width-170,height-10);
   
  }
 
 
}
