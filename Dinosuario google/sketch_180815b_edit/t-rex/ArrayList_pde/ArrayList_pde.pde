ArrayList <Pelota> pelota;
void setup() {
  size(600, 600);
  pelota = new ArrayList <Pelota>();
  for (int i=0; i<0; i++) {
    pelota.add(new Pelota( random(width), random(height), 1, 1));
  }
}

class Pelota {
  int tam=50;
  float posx, posy;
  float Velx, Vely;

  Pelota(float x, float y, float Vx, float Vy) {
    posx=x;
    posy=y;
    Velx=Vx;
    Vely=Vy;
  }

  void mover() {
    posx+=Velx;
    if (posx>width || posx<0) Velx *= -1;
    posy+=Vely;
    if (posy>height || posy<0) Vely *= -1;
  }
  void mostrar() {
    ellipse(posx, posy, tam, tam);
  }
}

void draw() {
  background(1);
  for (int i=0; i<pelota.size(); i++) {
    fill(random(255), random(255), random(255));
    Pelota Aux= pelota.get(i);
    Aux.mover();
    Aux.mostrar();
  }
  println(pelota.size());
  if (mousePressed )pelota.add(new Pelota( mouseX, mouseY, random(4), random(4)));
}