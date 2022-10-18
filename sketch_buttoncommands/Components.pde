abstract class UIComponents {
  int padding_left, padding_right, padding_top, padding_bot;
  abstract int GetX1();
  abstract int GetX2();
  abstract int GetY1();
  abstract int GetY2();
  abstract void Setup();
  abstract void Draw();
  abstract void ProcessInput();
}

class Tilebar extends UIComponents {
  ArrayList<Button> buttons;
  int padding_left = 100;
  int padding_top = 495;
  int padding_right = 100; // was 500
  int padding_bot = 5; // was 595
  int max_rows = 2;
  int max_collumns = 8;
  
  int GetX1() {
    return padding_left;
  }
  
  int GetX2() {
    return ENV.ScreenWidth - padding_right;
  }
  
  int GetY1() {
    return padding_top;
  }
  
  int GetY2() {
    return ENV.ScreenHeight - padding_bot;
  }
  
  int GetWidth() {
    return GetX2() - GetX1();
  }
  
  int GetHeight() {
    return GetY2() - GetY1();
  }
  
  void CreateToolbarButtons() {
    buttons = new ArrayList<Button>();
    var button_width = GetWidth()/8;
    var button_height = GetHeight()/2;
    var height_count = 0;
    var button_count = 0;
    for(int i = 0; i < max_rows * max_collumns; i++) {
      var i_x1 = GetX1() + (button_width * button_count);
      var i_y1 = GetY1() + (button_height * height_count);
      if(i_x1 == GetX2()) {
        height_count++;
        button_count = 0;
        i_x1 = GetX1() + (button_width * button_count);
        i_y1 = GetY1() + (button_height * height_count);
      }
      //rect(i_x1, i_y1, button_width, button_height);
      buttons.add(new Button(new PVector(i_x1, i_y1), new PVector(i_x1 + button_width, i_y1 + button_height), new TestCommand(str(i))));
      //text(i, i_x1+20, i_y1+20);
      button_count++;
    }
    if(ENV.State == ApplicationState.Debug) println("Total buttons created = " + buttons.size());
  }
  
  void Setup() {
    CreateToolbarButtons();
  }
  
  void DrawTilebarDebugGUI() {
    stroke(255, 0, 0);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(GetX1(), GetY1(), GetX2(), GetY2());
  }
  
  void Draw() {
    for(int i = 0; i < buttons.size(); i++) {
      buttons.get(i).DetectHover();
      buttons.get(i).Draw();
    }
  }
  
  void ProcessInput() {
    for(int i = 0; i < buttons.size(); i++) {
      Button b = buttons.get(i).ClickDetected();
      if(b != null) {
        for(int j = 0; j < buttons.size(); j++) {
          Button curButton = buttons.get(j);
          if(curButton != b) curButton.DeSelect(); 
        }
        commandManager.AddCommand(buttons.get(i).command);
      }
    }
  }
}
