import '../../entry.dart';
import '../../file.dart';

class DAOFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/';

  @override
  String get fileName => 'dao.dart';

  @override
  String get content => '''
import 'package:$title/src/model.dart';

export './dao/dbdao.dart';
export './dao/localdao.dart';

abstract class DAO<T extends Model> {
  Map<String, T> list = {};

  String get keyName;
  T fromJson(Map<String, dynamic> json);

  Future loadAll();
}
''';
}
