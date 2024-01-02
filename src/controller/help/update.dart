import '../help.dart';

class UpdateHelpCont extends HelpCont {
  @override
  String get command => 'update';

  @override
  Map<String, String> get data => {
    'no-arg': 'Update to the latest version',
  };

  @override
  List<int> get argumentRequired => [0];
}
