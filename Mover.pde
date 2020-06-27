class Mover {

  float x, y, r, t;
  float mass;
  float density;

  PVector location;
  PVector velocity;
  PVector acceleration;

  Mover(float xt, int yt, float masst, float density_) {
    x = xt;
    y = yt;
    mass = masst;
    density = density_;

    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);

    acceleration.mult(0);
  }

  void render() {
    r = 16 * mass;
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, r, r);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void checkEdges() {
    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    }

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }
  }

  boolean isInside(Liquid l) {

    if (location.x > l.x && location.x < l.x+l.w && location.y > l.y && location.y < l.y+l.h) {
      return true;
    } else {
      return false;
    }
  }
  
  void drag(Liquid l) {
    float speed = velocity.mag();
    float dragMagnitude = l.c * speed * speed;
    
    PVector drag = velocity.copy();
    drag.mult(-1);
    drag.normalize();
    
    drag.mult(dragMagnitude);
    applyForce(drag);
    
  }
  
  void isSinking(Liquid l) {
    PVector force = new PVector(0, 1);
    applyForce(force);
  }
  
  void isFloating(Liquid l) {
    t += 0.1;
    float y = 1 * sin(TWO_PI/2 * t) + 2;  
    PVector force = new PVector(0, -y);
    
    acceleration.add(force);
    
  }
  
}
