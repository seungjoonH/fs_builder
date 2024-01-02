import '../../../../../extension.dart';
import '../../../../entry.dart';
import '../../../../file.dart';

class ConcretePageContFileCont extends FileCont {
  ConcretePageContFileCont(this.name);

  final String name;

  @override
  String get path => '${EntryCont.libPath}src/controller/page/';

  @override
  String get fileName => name;

  @override
  String get content => '''
import 'package:get/get.dart';
import 'package:$title/src/controller.dart';

class ${name.toPascalCase}PageCont extends PageCont {
  static ${name.toPascalCase}PageCont get to => Get.find<${name.toPascalCase}PageCont>();
  
  @override
  Future load() async {}

  @override
  String get loadKey => '${name.toKebabCase}';
}
''';
}
