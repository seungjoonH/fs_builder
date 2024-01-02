import '../help.dart';

class HelpHelpCont extends HelpCont {
  @override
  String get command => 'help';

  @override
  Map<String, String> get data => {
        'title': 'Help with "title" command',
        'init': 'Help with "init" command',
        'add': 'Help with "add" command',
        'rm': 'Help with "rm" command',
        'clear': 'Help with "clear" command',
        'version': 'Help with "version" command',
        'update': 'Help with "update" command',
      };

  @override
  List<int> get argumentRequired => [0, 1];
}
