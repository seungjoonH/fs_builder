import '../help.dart';

class EmptyHelpCont extends HelpCont {
  @override
  String get command => '';

  @override
  Map<String, String> get data => {
    'help': 'Show help of the command',
    'title': 'Find or Set project title',
    'init': 'Initialize the structure',
    'add': 'Add a new "model", "controller" or "page"',
    'rm': 'Remove a "model", "controller" or "page"',
    'clear': 'Clear the "lib/" directory',
    'version': 'Show the current version',
    'update': 'Update to the latest version',
  };
}
