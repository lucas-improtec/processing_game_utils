final class CommandManager {
  ArrayList<Command> commands = new ArrayList<Command>();
  
  void AddCommand(Command command) {
    command.Execute();
    commands.add(command);
  }
  
  void Undo() {
    int index = commands.size() - 1;
    commands.get(index).UnExecute();
    commands.remove(index);
  }
}
