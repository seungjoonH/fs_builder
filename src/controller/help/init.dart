import '../help.dart';

class InitHelpCont extends HelpCont {
  @override
  String get command => 'init';

  @override
  Map<String, String> get data => {
        'no-arg': 'Initialize the structure',
        'help': 'Show help of the command "init"',
        '[name]': 'Initialize the file named `[name]`',
      };

  @override
  Map<String, String> get optData => {
    '-u --update': 'Initialize the content of existing files',
    '-f --force': 'Initialize the content of existing files and delete all new files',
  };

  @override
  List<int> get argumentRequired => [0, 1];

  @override
  List<int> get optionRequired => [0, 1];
}
