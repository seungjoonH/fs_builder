import '../entry.dart';
import '../file.dart';

class GlobalFileCont extends FileCont {
  @override
  String get path => EntryCont.libPath;

  @override
  String get fileName => 'global.dart';

  @override
  String get content => '''
export './global/extension.dart';
export './global/firebase.dart';
export './global/date_time.dart';
''';
}
