Player player;
PImage background;
BoxCollider groundCollider;
 
void setup() {
  size(465, 465);
  background = loadImage("/Sprites/Background/Background.png");
  groundCollider = new BoxCollider(new PVector(465/2, 450), width, 100);
  player = new Player();
}
 
void draw() {
  //background(125);
  image(background, 0, 0);
  groundCollider.DebugDraw();
  player.Draw();
}

//void movieEvent(Movie m) {
//  m.read();
//}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      player.keyRight = true;
    } else if(keyCode == LEFT) {
      player.keyLeft = true;
    } else if(keyCode == SHIFT) {
      player.keyShift = true;
    }
  }
}

void keyReleased() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      player.keyRight = false;
    } else if(keyCode == LEFT) {
      player.keyLeft = false;
    } else if(keyCode == SHIFT) {
      player.keyShift = false;
    }
  }
}
