import '../help.dart';

class RemoveHelpCont extends HelpCont {
  @override
  String get command => 'rm';

  @override
  Map<String, String> get data => {
    'help': 'Help with "add" command',
    'model [name]': 'Remove a model named `[name]`',
    'page [name]': 'Remove a page named `[name]`',
    'cont [name]': 'Remove a controller named `[name]`',
  };

  @override
  List<int> get argumentRequired => [1, 2];

  @override
  bool validate(List<String> arguments, [List<String>? options]) {
    int len = arguments.length;
    if (len == 0) return false;
    if (len <= 3 && ['model', 'page', 'cont'].contains(arguments[0])) return true;
    return super.validate(arguments);
  }
}
