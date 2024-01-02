
import '../../../../../extension.dart';
import '../../../../entry.dart';
import '../../../../file.dart';

class ConcreteDBDAOFileCont extends FileCont {
  ConcreteDBDAOFileCont(this.name);

  final String name;

  @override
  String get path => '${EntryCont.libPath}src/dao/dbdao/';

  @override
  String get fileName {
    String ret = '${name.toSnakeCase}.dart';
    if (name != '${C}User') return ret;
    return ret.replaceAll('${C.toLowerCase()}_', '');
  }

  @override
  String get content => '''
import 'package:$title/src/dao.dart';
import 'package:$title/src/model.dart';

class ${name.toPascalCase}DAO extends DBDAO<${name.toPascalCase}> {
  @override
  String get collectionPath => throw UnimplementedError();

  @override
  ${name.toPascalCase} fromJson(Map<String, dynamic> json) {
    return ${name.toPascalCase}.fromJson(json);
  }

  @override
  String get keyName => throw UnimplementedError();
}
''';
}
