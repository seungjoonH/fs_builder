import 'help.dart';

class ErrorCont {
  static void showInputInvaild(List<String> args) {
    print('\nInput invaild:');
    print('${HelpCont.executeCommand} ${args.join(' ')}');
    print('\n');
  }
}
