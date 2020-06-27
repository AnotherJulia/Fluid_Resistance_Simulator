//Creating Fluid Resistance Simulator

Mover[] movers = new Mover[5];
Liquid liquid;

void setup() {
  size(600, 400);
  background(250);

  for (int i = 0; i < movers.length; i++) {
    float x = width/movers.length * i + width/movers.length * 0.5;

    movers[i] = new Mover(x, 50, random(1, 5), random(0.5, 2)); //x,y,r,mass
  }

  liquid = new Liquid(0, height/2, width, height/2, 0.1, 1.0); //x,y,w,h,c
}

void draw() {
  background(250);

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].render();
    movers[i].checkEdges();

    if (movers[i].isInside(liquid)) {
      movers[i].drag(liquid);  
      
      if (isSinking(movers[i], liquid)) {
        movers[i].isSinking(liquid);
      } else if (!isSinking(movers[i], liquid)) {
        movers[i].isFloating(liquid);
      } 
    } else {
      movers[i].isSinking(liquid);  
    }



    liquid.render();
  }
}

void keyPressed() {
  setup();
}

boolean isSinking(Mover m, Liquid l) {  
    if (m.density > l.d) {
      return true;
    } else if (m.density == l.d) {
      return false;
    } else if (m.density < l.d) {
      return false;
    } else {
      return false;
    }
}
