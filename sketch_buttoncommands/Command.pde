abstract class Command {
  abstract void Execute();
  abstract void UnExecute();
}

class TestCommand extends Command {
  String message;
  String warning = ". Warning: This is a test command.";
  
  TestCommand(String message) {
    this.message = message;
  }
  
  void Execute() {
    println("Command Executed: " + message + warning);
  }
  
  void UnExecute() {
    println("Command UnExecuted: " + message);
  }
}
