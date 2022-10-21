enum PlayerState {
  Idle,
  Walking,
  Floating,
  Attacking
}

class Player {
  // Components
  AnimationController animController;
  BoxCollider collider;
  
  // States
  Direction direction;
  PlayerState playerState;
  
  // Position
  PVector position;
  
  // Inputs
  boolean keyLeft, keyRight, keyShift;
  
  // Movement
  float xSpeed;
  float walkSpeed = 1;
  float runSpeed = 2;
  
  Player() {
    position = new PVector(300, 300);
    HashMap<String, Animation> anims = new HashMap<String, Animation>();
    anims.put("Idle", new Animation("/Sprites/Samurai/Idle.png", 8, 150, this));
    anims.put("Walk", new Animation("/Sprites/Samurai/Run.png", 8, 100, this));
    anims.put("Run", new Animation("/Sprites/Samurai/Run.png", 8, 50, this));
    animController = new AnimationController(anims);
    collider = new BoxCollider(position, 30, 45);
    
    direction = Direction.Right;
    playerState = PlayerState.Idle;
  }
  
  void Draw() {
    Move();
    collider.DebugDraw();
    animController.Draw();
  }
  
  void Move() {
    if(!keyLeft && !keyRight) {
      animController.SwitchToAnimation("Idle");
      xSpeed = 0;
    } else {
      if(keyShift) {
        xSpeed = keyLeft ? -runSpeed : runSpeed;
        animController.SwitchToAnimation("Run");
      }
      else {
        xSpeed = keyLeft ? -walkSpeed : walkSpeed;
        animController.SwitchToAnimation("Walk");
      }
      Direction dir = keyLeft ? Direction.Left : Direction.Right;   
      player.animController.SetDirection(dir);
    }
    position.x += xSpeed;
  }
}
