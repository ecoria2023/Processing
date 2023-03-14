//--LIBRERIA AUDIO ------------------o
import ddf.minim.*;
Minim gestor;
AudioSample disparoAcertado,disparoFallido;
AudioPlayer loopsound;

//--OBJETO GLOBO --------------------o
Globo globo1;
float distn;
boolean clickeado,pausar,gameOver,cambiarPos;
float radio;
float aum;
float posX,posY;
 
//--COLORES -------------------------o
int z,y;
float p;
int cont,score,vida;

//--TIEMPO -------------------------o
PFont    font;
String   time = "120";
int      t,tx;
int      interval = 120;
int      estado;
int      contEstado;
int      contMenu; 
int      contJuego;
boolean  empieza;
int xposTextoMenu;
int yposTextoMenu;

//--PANTALLA -----------------------o
PImage bg;


void setup()
{

  size(600,600);


//--INSTANCIA AUDIO -----------------o
  gestor          = new Minim(this);
  
  disparoAcertado = gestor.loadSample("music/acertado.mp3");
  loopsound       = gestor.loadFile("music/loopsound.wav");

  loopsound.setGain(0);
  disparoAcertado.setGain(0);

//loopsound.loop();

//--INSTANCIA OBJETO ----------------o 
  globo1    =    new Globo();
  clickeado =    false;

//--OTROS ---------------------------o 
  empieza=false;
 

//--VAR PANTALLA --------------------o 
  estado    =    1;
  pausar    =    false;
  gameOver  =    false; 
  cont      =    1000;
  score     =    0;
  bg        =    loadImage("sprites/bg/bg2.jpg");

//--COLORES -------------------------o
  z=0;
  y=0;
  p=255; 
  contMenu=4;
  contJuego=10;

//--TIME MENU ----------------------------o
xposTextoMenu=width/2-100;
yposTextoMenu=height/2+70;
  
  thread("contadorMenu");
  thread("contadorJuego");
}

void draw()
{
      //-- MENU INICIO ---------------------------------------------o
     if(estado==1)
     {
     
        image(bg,0,0); 
        
        textSize(20);
        text("COMIENZA EN  "+contMenu,xposTextoMenu,yposTextoMenu); 
        
        if(contMenu<=0){
        estado=2;}
     
     }
    
     //-- JUEGO INICIADO ---------------------------------------------o
     if(estado==2) 
     {
       
       textSize(12);
 
       background(255);  
       
      //-FIN DEL JUEGO-------------------------------------|
      if(contJuego<=0)
       {
        text("PUNTAJE ALCANZADO: "+score,width/2,height/2); 
        noLoop();
        gameOver=true;
          
       }
       //-FIN DEL JUEGO-------------------------------------|
       
       text("  Puntos: "+score,40,20);      // -----> SCORE EN PANTALLA  
       text(""+contJuego,width-35,20);
       textAlign(CENTER);
       
       
       globo1.aumentarRadio();
       cambiarRespawn();
       globo1.perderVida(); 
       
       //contador2();
       Colores();
   
        /*CUANDO EL CIRCULO SE ACHICA PIERDE SCORE*/
      globo1.perderVida();
      globo1.dibujar();
      
       }
     
      
     
    
        
}
 //------THREADs------------------------------------------------------------------------------------------------------------------------------
    void contadorMenu()  
      {
                
      for (int i = 0; i < 4; i++) 
          {
           contMenu=contMenu-1;
     
          try {Thread.sleep(1000);}
          catch (Exception e) {};  // delay does not work here
          }        
     }  
     
     void contadorJuego()  
      {
                
      for (int x = 0; x < 10; x++) 
          {
           contJuego=contJuego-1;
     
          try {Thread.sleep(1000);}
          catch (Exception e) {};  // delay does not work here
          }   
      
        
          
     } 
 
//------/THREAD------------------------------------------------------------------------------------------------------------------------------
   
    void cambiarRespawn()
    {  
      if(aum<=0 && aum>-1){ 
          posX=random(10,width-10);
          posY=random(10,height-10);
          } 
    }
   
   void mousePressed()
     {
     
     if( distn<aum && distn > globo1.radioGlobo() )
       {
       globo1.ClickCambiarPosicion(); 
       score=score+30;  
       //disparoAcertado.trigger();
       }
     
     else
       {
       disparoAcertado.stop();
       score=score-30;
       }
   
     }
     
    
   
   void keyPressed()
     {
     //  SI SE PRESIONA LA TECLA B SE DESACTIVA EL TIEMPO
        if(key == 'b' || key == 'B') 
          {
           
          
          }
 
     }
   
   //void contador()
   //  {
   //    if(pausar==false){ 
   //   cont=cont-1;
   //   //println(  cont); 
 
   //   fill(0);
   //   text("TIME:"+cont,width-35,20);
       
   //   }
   //    if(cont<=0)
   //   {
   //   text("ULTIMO SCORE:"+score,width/2,height/2); 
      
   //   noLoop();  
   //   gameOver=true;}
     
   //  }
    
   // void contador2()
   // {
       
        
   //  if(pausar==false)
   //  {
     
   //   t = interval-int(millis()/1000);
   //   time = nf(t , 3);
   //  }
   //  else
   //  {
   //    if(key == 'a' || key == 'A'){
          
   //        pausar=true;
   //       }
   //  }
     
   // if(t <= 0){
   //   //text("ULTIMO SCORE:"+score,width/2,height/2); 
      
   //   noLoop();  
   //   gameOver=true;
       
   //}

   //text(time, width-35,20);
    
    //}//FIN CONTADOR
    
    // void contador1()
    //{
     
    //int s = second();
    //println("segundos:",s);
    //if(s>=10){estado=2;}
    // }
     
    void Colores()
    {
               
          for(int x=0;x<=0;x++){ 
             z=z+1;
             y=y+1;
             p=p-1;
             if(z>=255){z=0;}
             if(y>=120){y=0;}
             if(p<=0){p=255;}
             
             float other;
             other=z*y/p%255-frameCount/10;
        
           
             color c = color(cont/6,y%frameCount,other);
             //color c = color(random(0,z),random(y,255),random(120,p));
             //color c = color(random(0,255),random(y,255),random(120,p));
             fill(c);
          }
    
    }
    
     
   
   
