
import '../../../../extension.dart';
import '../../../entry.dart';
import '../../../file.dart';

class DBDAOFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/dao/';

  @override
  String get fileName => 'dbdao.dart';

  @override
  String get content => '''
import 'package:$title/global.dart';
import 'package:$title/src/dao.dart';
import 'package:$title/src/model.dart';

/* Export Area */
export './dbdao/user.dart';
/* =========== */

abstract class DBDAO<T extends DBModel> extends DAO<T> {
  String get collectionPath;
  get _collection => f.collection(collectionPath);

  @override
  Future loadAll() async {
    list.clear();
    var jsonList = await _collection.get();
    for (var doc in jsonList.docs) {
      var json = doc.data();
      T obj = fromJson(json);
      list[json[keyName]] = obj;
    }
  }

  Future<T?> loadOne(String key) async {
    var json = (await _collection.doc(key).get()).data();
    if (json == null) return null;
    return fromJson(json);
  }

  Future saveOne(T one) async {
    await _collection.doc(one.key).set(one.toJson());
  }

  Future beforeRemove(T one) async {}

  Future removeOne(T one) async {
    await beforeRemove(one);
    await _collection.doc(one.key).delete();
  }

  void setOne(T one) => list[one.key] = one;
}
''';
  void add(String name) {
    String pageContent = contentAlt;

    String matched = getMatched(pageContent);
    String exportPath = EntryCont.concat('./dbdao', name.toSnakeCase, 'dart');
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
        '\\n[\\s]*export \'.\\/dbdao.*${name.toSnakeCase}.dart\';';
    RegExp removePattern = RegExp(removeText);

    bool matched = removePattern.firstMatch(pageContent) != null;
    if (!matched) return;

    pageContent = pageContent.replaceAll(removePattern, '');

    EntryCont.updateFile(path, fileName, pageContent);
  }
}
