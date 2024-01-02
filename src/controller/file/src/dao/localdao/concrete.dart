
import '../../../../../extension.dart';
import '../../../../entry.dart';
import '../../../../file.dart';

class ConcreteLocalDAOFileCont extends FileCont {
  ConcreteLocalDAOFileCont(this.name);

  final String name;

  @override
  String get path => '${EntryCont.libPath}src/dao/localdao/';

  @override
  String get fileName => '$name.dart';

  @override
  String get content => '''
import 'package:$title/src/dao.dart';
import 'package:$title/src/model.dart';

abstract class ${name.toPascalCase}DAO extends LocalDAO<${name.toPascalCase}> {
	@override
	String get assetPath => 'assets/json/model/${name.toSnakeCase}.json';
}
''';
}
