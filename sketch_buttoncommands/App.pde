abstract class BaseApp {
  ArrayList<BaseView> views;
  BaseView currentView;
  
  abstract void Initialize();
  abstract void Draw();
  abstract void SwitchCurrentView();
  abstract void QuitApp();
}

class App extends BaseApp {
  void Initialize() {
    views.add(new TilemapEditorView());
    currentView = views.get(0);
    currentView.Initialize();
  }
  
  void Draw() {
    currentView.Draw();
  }
  
  void SwitchCurrentView() {
    
  }  
}
