import '../help.dart';

class AddHelpCont extends HelpCont {
  @override
  String get command => 'add';

  @override
  Map<String, String> get data => {
    'help': 'Help with "add" command',
    'model [name] <option>': 'Add a model named `[name]`',
    'page [name] (route)': 'Add a page named `[name]`',
    'cont [name] <option>': 'Add a controller named `[name]`',
  };

  @override
  Map<String, String> get optData => {
    '-d --db': 'Set the type of model as DBModel',
    '': 'or Set the type of the controller as DBModelCont',
    '-l --local': 'Set the type of model as LocalModel',
    '-o --other': 'Set the type of controller as OtherCont',
  };

  @override
  List<int> get argumentRequired => [1, 2, 3];

  @override
  List<int> get optionRequired => [0, 1];

  @override
  bool validate(List<String> arguments, [List<String>? options]) {
    int len = arguments.length;
    if (len == 0) return false;
    if (len <= 3 && ['model', 'dao', 'page', 'cont'].contains(arguments[0])) return true;
    return super.validate(arguments);
  }
}
