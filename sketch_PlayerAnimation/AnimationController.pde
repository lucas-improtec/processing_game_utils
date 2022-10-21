class AnimationController {
  HashMap<String, Animation> animations = new HashMap<String, Animation>();
  Animation currentAnimation;
  Direction direction = Direction.Right;
  
  AnimationController(HashMap<String, Animation> animations) {
    this.animations = animations;
    currentAnimation = animations.get("Idle");
  }
  
  void SwitchToAnimation(String animationName) {
    Animation desiredAnim = animations.get(animationName);
    if(currentAnimation == desiredAnim) return;
    currentAnimation = animations.get(animationName);
  }
  
  void SetDirection(Direction direction) {
    this.direction = direction;
  }
  
  void Draw() {
    currentAnimation.Draw(direction);
  }
}
