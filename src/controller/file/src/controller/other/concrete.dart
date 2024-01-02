import '../../../../../extension.dart';
import '../../../../entry.dart';
import '../../../../file.dart';

class ConcreteOtherContFileCont extends FileCont {
  ConcreteOtherContFileCont(this.name);

  final String name;

  @override
  String get path => '${EntryCont.libPath}src/controller/other/';

  @override
  String get fileName => name;

  @override
  String get content => '''
import 'package:get/get.dart';
import 'package:$title/src/controller.dart';

class ${name.toPascalCase}Cont extends Cont {
  static ${name.toPascalCase}Cont get to => Get.find<${name.toPascalCase}Cont>();

  @override
  Future init() async {}
}
''';
}
