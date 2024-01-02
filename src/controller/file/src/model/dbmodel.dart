import '../../../../extension.dart';
import '../../../entry.dart';
import '../../../file.dart';

class DBModelFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/model/';

  @override
  String get fileName => 'dbmodel.dart';

  @override
  String get content => '''
import 'package:$title/src/model.dart';

/* Export Area */
export './dbmodel/user.dart';
/* =========== */

abstract class DBModel extends Model {
  DBModel.fromJson(super.json) : super.fromJson();
  DBModel.fromModel(DBModel model) { fromModel(model); }
  Map<String, dynamic> toJson();
  void fromModel(DBModel model);
}
''';

  void add(String name) {
    String pageContent = contentAlt;

    String matched = getMatched(pageContent);
    String exportPath = EntryCont.concat('./dbmodel', name.toSnakeCase, 'dart');
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
    String pageContent = contentAlt;

    String removeText =
        '\\n[\\s]*export \'.\\/dbmodel.*${name.toSnakeCase}.dart\';';
    RegExp removePattern = RegExp(removeText);

    bool matched = removePattern.firstMatch(pageContent) != null;
    if (!matched) return;

    pageContent = pageContent.replaceAll(removePattern, '');

    EntryCont.updateFile(path, fileName, pageContent);
  }
}
