
import '../../../../extension.dart';
import '../../../entry.dart';
import '../../../file.dart';

class LocalDAOFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/dao/';

  @override
  String get fileName => 'localdao.dart';

  @override
  String get content => '''
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:$title/src/dao.dart';
import 'package:$title/src/model/localmodel.dart';

/* Export Area */
/* =========== */

abstract class LocalDAO<T extends LocalModel> extends DAO<T> {
  String get assetPath;

  Future<String> get jsonString async {
    return await rootBundle.loadString(assetPath);
  }

  @override
  Future loadAll() async {
    list = jsonDecode(await jsonString)
        .map<T>((json) => fromJson(json)).toList();
  }

  T? getOne(String key) => list[key];
}
''';

  void add(String name) {
    String pageContent = contentAlt;

    String matched = getMatched(pageContent);
    String exportPath = EntryCont.concat('./localdao', name.toSnakeCase, 'dart');
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
        '\\n[\\s]*export \'.\\/localdao.*${name.toSnakeCase}.dart\';';
    RegExp removePattern = RegExp(removeText);

    bool matched = removePattern.firstMatch(pageContent) != null;
    if (!matched) return;

    pageContent = pageContent.replaceAll(removePattern, '');

    EntryCont.updateFile(path, fileName, pageContent);
  }
}
