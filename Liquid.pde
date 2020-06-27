class Liquid {

  float x, y, w, h, c;
  float d;

  Liquid(float xt, float yt, float wt, float ht, float ct, float dt) {
    
    x = xt;
    y = yt;
    w = wt;
    h = ht;
    c = ct;
    d = dt;
    
  }
  
  void render() {
    noStroke();
    fill(120, 100);
    rect(x,y,w,h);
  }
  
}
