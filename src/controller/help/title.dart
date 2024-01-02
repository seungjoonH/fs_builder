import '../help.dart';

class TitleHelpCont extends HelpCont {
  @override
  String get command => 'title';

  @override
  Map<String, String> get data => {
        'no-arg': 'Find the project title',
        'help': 'Show help of the command "title"',
        '[name]': 'Set project title as `[name]`',
      };

  @override
  List<int> get argumentRequired => [0, 1];
}
