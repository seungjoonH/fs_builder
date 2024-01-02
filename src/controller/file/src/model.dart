import '../../entry.dart';
import '../../file.dart';

class ModelFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/';

  @override
  String get fileName => 'model.dart';

  @override
  String get content => '''
export './model/dbmodel.dart';
export './model/localmodel.dart';

abstract class Model {
  late String key;
  Model();
  Model.fromJson(Map<String, dynamic> json) { fromJson(json); }
  void fromJson(Map<String, dynamic> json);
}
''';
}
