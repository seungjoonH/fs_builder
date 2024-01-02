import '../../../../extension.dart';
import '../../../entry.dart';
import '../../../file.dart';

class DBModelContFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/controller/';

  @override
  String get fileName => 'dbmodel.dart';

  @override
  String get content => '''
import 'package:get/get.dart';
import 'package:$title/src/controller.dart';
import 'package:$title/src/dao.dart';
import 'package:$title/src/model.dart';

/* Export Area */
/* =========== */

abstract class DBModelCont extends Cont {
  late DBModel main;
  DBDAO get dao;

  final _ids = <String>[].obs;
  List<String> get ids => _ids;
  void setIds(List<String> list) => _ids.assignAll([...list]);

  final _objects = <String, DBModel>{}.obs;
  List<DBModel> get objects => [..._objects.values.toList()]..sort(compare);
  int compare(DBModel a, DBModel b) => a.key.compareTo(b.key);
  DBDAO get objDao;

  void syncFrom();
  void syncTo();

  Future load() async {
    _ids.clear();
    syncFrom();
    for (String id in _ids) {
      _objects[id] = (await dao.loadOne(id))!;
    }
  }

  Future save() async {
    syncTo();
    await dao.saveOne(main);
  }

  Future saveOne(String id) async {
    await objDao.saveOne(getOne(id));
  }

  DBModel getOne(String id) => _objects[id]!;

  Future addById(String id, {bool autoSave = true}) async {
    if (_ids.contains(id)) return;
    _ids.add(id);
    _objects[id] = (await dao.loadOne(id))!;
    if (autoSave) await save();
  }

  Future add(DBModel model, {bool autoSave = true}) async {
    if (_ids.contains(model.key)) return;
    _ids.add(model.key);
    _objects[model.key] = model;
    if (autoSave) await save();
  }

  Future remove(String id, {bool autoSave = true}) async {
    _ids.remove(id);
    _objects.remove(id);
    if (autoSave) await save();
  }

  @override
  Future init({DBModel? model}) async {
    if (model == null) return;
    main = model;
    await load();
    syncFrom();
  }
}
''';
  void add(String name) {
    String pageContent = contentAlt;

    String matched = getMatched(pageContent);
    String exportPath = EntryCont.concat('./controller/dbmodel/', name.toSnakeCase, 'dart');
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
