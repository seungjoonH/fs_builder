import '../../entry.dart';
import '../../file.dart';

class ViewFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/';

  @override
  String get fileName => 'view.dart';

  @override
  String get content => '''
export './view/page.dart';
export './view/widget.dart';
''';
}
