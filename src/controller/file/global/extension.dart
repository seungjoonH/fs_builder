import '../../entry.dart';
import '../../file.dart';

class ExtensionFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}global/';

  @override
  String get fileName => 'extension.dart';

  @override
  String get content => '''
export './extension/date_time.dart';
export './extension/duration.dart';
export './extension/int.dart';
''';
}
