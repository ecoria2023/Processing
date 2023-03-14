class Globo
    {

          //  ATRIBUTOS
           
 
    
          //  METOTODS
    Globo()
    {
          radio=1;
          aum=0;
          posX=random(100,width);
          posY=random(100,height);
       
    }
    
     
    
    void aumentarRadio()
    {
          //aum=(aum + 0.5)+radio;
      
          //if(aum<30){
          //ellipse( posx ,posy,radio+aum,radio+aum);
          //}
          //else{
          //aum  =  aum  *-1;
          //ellipse( posx ,posy,radio-aum,radio-aum);  
          //score=score-30;
          //}
          
    
    aum  =  aum  +  0.5;
     println(aum);
   if(aum<30)
   {   
      radio=10;
      ellipse( posX ,posY,radio+aum,radio+aum); 
          
   }
   else
   {
      
   aum  =  aum  *-1;
   ellipse( posX ,posY,radio-aum,radio-aum);
     
   if(radio==0 || aum==0){   fill(0,0,255);}
   
  
  
    }
          
    }
    
    void dibujar()
    {
         
     distn=dist(mouseX,mouseY,posX,posY);
              ellipse( posX ,posY,radio+aum,radio+aum);
          
           

    }
    
    boolean ClickCambiarPosicion()
    {
      
         posX=random(20,width-10);
         posY=random(20,height-10);
        return clickeado;
        
    }
    
    
    
   //void RandomPos()
   // {
   //   //if(aum<=1 && aum>-1){
        
   //   //posX=random(20,width-10);
   //   //   posY=random(20,height-10);
   //   //}
          
    
        
   // }
    
    
    void cambiarColor()
    {
        colorMode(HSB);
        color c1 = color(random(100,200), random(50,255), random(1,100)); 
        fill(c1);
    }
    
    void perderVida()
    {
      if(aum<0 && aum>-0.02 )
        {
        score=score-30;
        } // si esta entre estos rangos la pelota pierde vida
     else   
        {
        if(aum<0 && aum>-1){score=score-30;} 
        }  
    }    
        
    float radioGlobo()
    {
      radio=0;
      return radio;
    }   
      
    
}  //FIN CLASE
