import '../help.dart';

class VersionHelpCont extends HelpCont {
  @override
  String get command => 'version';

  @override
  Map<String, String> get data => {
        'no-arg': 'Show current version',
        'help': 'Show help of the command "version"',
      };

  @override
  List<int> get argumentRequired => [0, 1];
}
