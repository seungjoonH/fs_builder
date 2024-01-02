import '../help.dart';

class ClearHelpCont extends HelpCont {
  @override
  String get command => 'clear';

  @override
  Map<String, String> get data => {
        'no-arg': 'Clear the lib/ directory recursively',
        'help': 'Help with "clear" command',
      };

  @override
  List<int> get argumentRequired => [0, 1];
}
