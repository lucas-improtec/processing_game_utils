class Animation {
  PImage spritesheet;
  PImage inverseSpritesheet;
  PImage[] frames;
  PImage[] inverseFrames;
  int spriteCount;
  int currentFrame;
  int frameDuration;
  int lastFrameTime;
  int frame = 0;
  Player player;
  
  Animation(String path, int spriteCount, int frameDuration, Player player) {
    this.frameDuration = frameDuration;
    this.spriteCount = spriteCount;
    this.player = player;
    frames = new PImage[spriteCount];
    inverseFrames = new PImage[spriteCount];
    
    spritesheet = loadImage(path);

    var width = GetWidth();
    var height = GetHeight();

    inverseSpritesheet = FlipImage(spritesheet);

    println("----------------------");

    int h = 0;
    for (int i = 0; i < spriteCount; i++) {
      frames[i] = spritesheet.get(i * width/spriteCount, 0, width/spriteCount, height);
      println("x: " + i * width/spriteCount + ", y: " + 0 + ", width: " + width/spriteCount + ", height: " + height);
      h++;
    }
    
    println("Total: " + h);
    
    println("----------------------");
    
    int j = 0;
    for(int i = spriteCount; i > 0; i--) {
      inverseFrames[j] = inverseSpritesheet.get((i-1) * width/spriteCount, 0, width/spriteCount, height);
      println("x: " + (i-1) * width/spriteCount + ", y: " + 0 + ", width: " + width/spriteCount + ", height: " + height);
      j++;
    }
    println("Total: " + j);
    
    lastFrameTime = millis();
  }
  
  PImage FlipImage(PImage img) {
    int t = millis();
    
    PImage flipped = createImage(img.width,img.height,ARGB);//create a new image with the same dimensions
    for(int i = 0 ; i < flipped.pixels.length; i++){       //loop through each pixel
      int srcX = i % flipped.width;                        //calculate source(original) x position
      int dstX = flipped.width-srcX-1;                     //calculate destination(flipped) x position = (maximum-x-1)
      int y    = i / flipped.width;                        //calculate y coordinate
      flipped.pixels[y*flipped.width+dstX] = img.pixels[i];//write the destination(x flipped) pixel based on the current pixel  
    }
    //y*width+x is to convert from x,y to pixel array index
    flipped.updatePixels();
    println("done in " + (millis()-t) + "ms");
    return flipped;
  }

  void Draw(Direction direction) {
    int currentTime = millis();
    if(lastFrameTime + frameDuration <= currentTime) {
      frame = (frame+1) % spriteCount;
      lastFrameTime = currentTime;
    }
    imageMode(CENTER);
    if(direction == Direction.Right) {
      image(frames[frame], player.position.x, player.position.y);
    } else {
      image(inverseFrames[frame], player.position.x, player.position.y);
    }
  }
  
  int GetWidth() {
    return spritesheet.width;
  }
  
  int GetHeight() {
    return spritesheet.height;
  }
}
