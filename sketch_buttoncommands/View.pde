abstract class BaseView {
  // Fields
  ArrayList<UI_Component> components;
  CommandManager commandManager;
  
  // Methods
  abstract void Initialize();
  abstract void Draw();
  abstract void ProcessInput();
}

class TilemapEditorView extends BaseView {
  void Initialize() {
    commandManager = new CommandManager();
    components.add(new TilePalette());
    components.forEach((component) -> component.Initialize());
  }
  
  void Draw() {
    components.forEach((component) -> component.Draw());
  }
  
  void ProcessInput() {
    components.forEach((component) -> component.ProcessInput());
  }
}
