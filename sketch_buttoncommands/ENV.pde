static class ENV {
  static int ScreenWidth = 600;
  static int ScreenHeight = 600;
  static ApplicationState State = ApplicationState.Debug;
}

enum ApplicationState {
  Release,
  Debug
}
