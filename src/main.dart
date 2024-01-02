import 'controller/command.dart';

void main(List<String> args) {
  var cont = CommandCont.get(args);
  cont.execute();
}
