abstract class UIElement {
  int x1, x2, y1, y2;
  
  abstract void Setup();
  abstract void Draw();
}

abstract class UISelectableElement extends UIElement{
  public color c;
  public color defaultColour = color(0);
  public color hoverColour = color(0, 255, 255);
  public color selectedColour = color(0, 255, 0);
  public boolean isHovering;
  public boolean isSelected;
  abstract void Select();
  abstract void DeSelect();
}

class Button extends UISelectableElement {
  Command command;
  
  Button(PVector topLeftPosition, PVector botRightPosition, Command command) {
    x1 = (int)topLeftPosition.x;
    x2 = (int)botRightPosition.x;
    y1 = (int)topLeftPosition.y;
    y2 = (int)botRightPosition.y;
    c = this.defaultColour;
    this.command = command;
  }
  
  void Setup() {
    
  }
  
  void Draw() {
    rectMode(CORNERS);
    if(isHovering) c = hoverColour;
    else if(isSelected) c = selectedColour;
    else c = defaultColour;
    stroke(0);
    strokeWeight(1);
    fill(125, 125, 125);
    rect(x1, y1, x2, y2);
    stroke(c);
    noFill();
    rect(x1+1, y1+1, x2-1, y2-1);
  }
  
  void DetectHover() {
    if((mouseX > x1 && mouseX < x2) && (mouseY > y1 && mouseY < y2)) {
      isHovering = true;
    }
    else {
      isHovering = false;
    }
  }
  
  Button ClickDetected() {
    if(isHovering) {
      Select();
      return this;
    }
    else {
      return null;  
    }
  }
  
  void Select() {
    if(isSelected) return;
    isSelected = true;
  }
  
  void DeSelect() {
    if(!isSelected) return;
    isSelected = false;
  }
}
