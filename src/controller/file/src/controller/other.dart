import '../../../../extension.dart';
import '../../../entry.dart';
import '../../../file.dart';

class OtherContFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/controller/';

  @override
  String get fileName => 'other.dart';

  @override
  String get content => '''
/* Export Area */
export './other/auth.dart';
export './other/lang.dart';
export './other/loading.dart';
export './other/theme.dart';
/* =========== */
''';
  void add(String name) {
    String pageContent = contentAlt;

    String matched = getMatched(pageContent);
    String exportPath = EntryCont.concat('./controller/other/', name.toSnakeCase, 'dart');
    String addText = 'export \'$exportPath\';';
    String replaceTo = matched;

    if (pageContent.contains(addText)) return;

    List<String> splited = replaceTo.split('\n');
    splited.insert(splited.length - 1, addText);
    String top = splited.first;
    String bottom = splited.last;
    splited = [...splited.sublist(1, splited.length - 1)..sort()];
    splited.insert(0, top);
    splited.add(bottom);
    pageContent = pageContent.replaceAll(matchExp, splited.join('\n'));

    EntryCont.updateFile(path, fileName, pageContent);
  }

  void remove(String name) {

  }
}
