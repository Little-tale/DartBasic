// ignore_for_file: avoid_print

class Light {
  void turnOn() => print('불 켜짐');
  void turnOff() => print('불 꺼짐');
}

abstract class Command {
  void execute();
  void undo();
  void redo();
}

class LightOnCommand implements Command {
  final Light light;

  LightOnCommand(this.light);

  @override
  void execute() {
    light.turnOn();
  }

  @override
  void redo() {}

  @override
  void undo() {}
}

class LightOffCommand implements Command {
  final Light light;

  LightOffCommand(this.light);

  @override
  void execute() {
    light.turnOff();
  }

  @override
  void redo() {}

  @override
  void undo() {}
}

class RemoteControl {
  Command? _slot;

  void setCommand(Command command) {
    _slot = command;
  }

  void pressButton() {
    _slot?.execute();
  }
}

void main() {
  final light = Light();

  final lightOn = LightOnCommand(light);
  final lightOff = LightOffCommand(light);

  final remote = RemoteControl();

  remote.setCommand(lightOn);
  remote.pressButton(); // 불 켜짐

  remote.setCommand(lightOff);
  remote.pressButton(); // 불 꺼짐
}
