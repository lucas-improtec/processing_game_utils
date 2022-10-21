enum DrawStyle {
  Center,
  Bounds
}

class BoxCollider {
  PVector position;
  float w, h;
  color c;
  color defaultColor = color(0, 255, 0);
  color collidedColor = color(255, 0, 0);
  
  BoxCollider(PVector position, float w, float h) {
    this.position = position;
    this.w = w;
    this.h = h;
    c = defaultColor;
  }
  
  void DebugDraw() {
    rectMode(CENTER);
    fill(c);
    rect(position.x, position.y, w, h);
  }
  
  boolean CheckCollision() {
    c = collidedColor;
    return true;
  }
}
