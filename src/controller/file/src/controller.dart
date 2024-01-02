import '../../../extension.dart';
import '../../entry.dart';
import '../../file.dart';

class ControllerFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/';

  @override
  String get fileName => 'controller.dart';

  @override
  String get content => '''
import 'package:get/get.dart';

export './controller/dbmodel.dart';
export './controller/other.dart';
export './controller/get.dart';
export './controller/page.dart';

abstract class Cont extends GetxController {
  Future init();
}
''';
}
