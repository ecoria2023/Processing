//FALTA AGREGAR COLISION, EL FONDO MAS GRIS, CAMBIAR LA SECUENCIA EN LA QUE SE MUESTRA LA IMAGEN DEL T-REX PARA QUE NO APAREZCA EL BORDE BLANCO, 
//FALTA CAMBIAR TODAS LAS IMAGENES DEL T-REX

/////////////////////////// 
//  ** IMAGENES **     ////
                         //
  PImage dinoRun1;       //
  PImage dinoRun2;       //
  PImage dinoJump;       //
  PImage dinoDuck;       //
  PImage dinoDuck1;      //
  PImage dinoMuere;      //
  PImage smallCactus;    //
  PImage manySmallCactus;//
  PImage bigCactus;      //
  PImage bird;           //
  PImage bird1;          //
  PImage nube;           //
///////////////////////////


//  VARIABLES PARA JUGADOR
Player p1;

int playerXpos = 120;
int groundHeight = height/2;
boolean Saltando;
boolean estaDuckeando=false;

//  VARIABLES PARA PISO 
ArrayList<Piso> piso = new ArrayList<Piso>();
int groundCounter = 0;
float speed = 5;

//  VARIABLES PARA OBSTACULO
ArrayList<Cactus> montonCactus = new ArrayList<Cactus>();
int contCaptus = 0;

//  VARIABLES PARA NUBES
ArrayList<Nube> nubes = new ArrayList<Nube>();
int contNubes = 0;
 
void setup()
{
  
  size(800,300);

  //INSTANCIA PARA JUGADOR
  
   dinoRun1 = loadImage("dinorun0000.png");
   dinoRun2 = loadImage("dinorun0001.png");
   dinoJump = loadImage("dinoJump0000.png");
   dinoDuck = loadImage("dinoduck0000.png");
   dinoDuck1 = loadImage("dinoduck0001.png");
   dinoMuere = loadImage("dinoDead0000.png");
   p1 = new Player( );
   
  //INSTANCIA PARA CAPTUS
  
   smallCactus = loadImage("cactusSmall00001.png");
 //smallCactus = loadImage("cactusSmall0000.png");
 //bigCactus = loadImage("cactusBig0000.png");
 //manySmallCactus = loadImage("cactusSmallMany0000.png");
  
  //
  nube = loadImage("nube.png");
   
}





void draw()
{
  background(#F0E8E6);
 
  p1.move(); 
  p1.show();
  p1.esta(Saltando);
  p1.duck(estaDuckeando);
  p1.update();
  updateCactuss();
  Linea();
       
  for (int i = 0; i < piso.size(); i++) {
    Piso Aux= piso.get(i);
    Aux.move(speed);
    Aux.show();
     
    if (piso.get(i).posX < -playerXpos) {
      piso.remove(i);
       
      i--;
    }
         
  }
  
  for (int i = 0; i < montonCactus.size(); i++) {
    Cactus Aux= montonCactus.get(i);
 
    Aux.move(speed);
    Aux.show();
             
  }
  
  for (int i = 0; i < nubes.size(); i++) {
    Nube Aux= nubes.get(i);
 
    Aux.move(speed);
    Aux.show();
             
  }
     
}/*FIN DRAW*/

  ///////////////////////////////////////////////////////
  //          FUNCIONES APARTE                         //
  //                                                   //
  ///////////////////////////////////////////////////////
 
 //------------------------------------------------------------------ 
 void Linea()
 {
  strokeWeight(1);
  line(0,height-66,width,height-66); 
  }

 //------------------------------------------------------------------ 
void updateCactuss() 
  {
      groundCounter ++;
      
      if (groundCounter> 20) 
      { //Se va agregando rocas en el piso
       groundCounter =0;
       piso.add(new Piso());
      }     
 
      contCaptus++;
  //CAMBIO DE CAPTUS
      if(contCaptus>=100)
      {montonCactus.add(new Cactus()); contCaptus=0;}
      
      contNubes++;
  
      if(contNubes>=100)
      {nubes.add(new Nube()); contNubes=0;}
  }

 //------------------------------------------------------------------ 
















//------------------------------------------------------------------ 
//Movimiento de captus y rocas
void moveCactuss() {
  println(speed);
  for (int i = 0; i< montonCactus.size(); i++) {
    montonCactus.get(i).move(speed);
    if (montonCactus.get(i).posX < -playerXpos) { 
      montonCactus.remove(i);
      i--;
    }
  }

   
  for (int i = 0; i < piso.size(); i++) {
    piso.get(i).move(speed);
    if (piso.get(i).posX < -playerXpos) {
      piso.remove(i);
      i--;
    }
  }
}
 
//------------------------------------------------------------------ 
 
