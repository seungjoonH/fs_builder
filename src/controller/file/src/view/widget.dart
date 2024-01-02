import '../../../entry.dart';
import '../../../file.dart';

class WidgetFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/view/';

  @override
  String get fileName => 'widget.dart';

  @override
  String get content => '''
export './widget/scaffold.dart';
''';
}
