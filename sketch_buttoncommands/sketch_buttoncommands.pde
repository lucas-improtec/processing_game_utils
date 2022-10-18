CommandManager commandManager;
ArrayList<UIComponents> components;

void setup() {
  size(600, 600);
  commandManager = new CommandManager();
  components = new ArrayList<UIComponents>();
  components.add(new Tilebar());
  for(int i = 0; i < components.size(); i++) {
    components.get(i).Setup();
  }
}

void draw() {
  //tilebar.DrawTilebarDebugGUI();
  for(int i = 0; i < components.size(); i++) {
    components.get(i).Draw();
  }
}

void mousePressed() {
  for(int i = 0; i < components.size(); i++) {
    components.get(i).ProcessInput();
  }
}
