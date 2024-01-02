import '../../../../../extension.dart';
import '../../../../entry.dart';
import '../../../../file.dart';

class ConcreteDBModelContFileCont extends FileCont {
  ConcreteDBModelContFileCont(this.name);

  final String name;

  @override
  String get path => '${EntryCont.libPath}src/controller/dbmodel/';

  @override
  String get fileName => '$name.dart';

  @override
  String get content => '''
import 'package:get/get.dart';
import 'package:$title/src/controller.dart';

class ${name.toPascalCase}Cont extends DBModelCont {
	static ${name.toPascalCase}Cont get to => Get.find<${name.toPascalCase}Cont>();

	@override
	${name.toPascalCase}DBDAO get dao => ${name.toPascalCase}DBDAO();
	
	@override
  void syncFrom() => setIds(main.someIds);
	
	@override
	void syncTo() => main.syncSomeIdsFrom(ids);
}
''';
}
