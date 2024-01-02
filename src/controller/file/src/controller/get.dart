import '../../../../extension.dart';
import '../../../entry.dart';
import '../../../file.dart';

class GetContFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/controller/';

  @override
  String get fileName => 'get.dart';

  @override
  String get content => '''
import 'package:get/get.dart';
import 'package:$title/src/controller.dart';

class GetCont {
  static void init() {
    /* Cont put Area */
    Get.put(AuthCont());
    Get.put(LangCont());
    Get.put(LoadingCont());
    Get.put(ThemeCont());
    /* ================= */
  }
}
''';

  void add(String name, String option) {
    String pageContent = contentAlt;

    String matched = getMatched(pageContent);
    late String text;

    switch (option) {
      case 'page': text = 'PageCont';
      case 'db' || 'other': text = 'Cont';
    }

    String addText = '\t\tGet.put(${name.toPascalCase}$text());';
    String replaceTo = matched;

    if (pageContent.contains(addText)) return;

    List<String> splited = replaceTo.split('\n');
    splited.insert(splited.length - 1, addText);
    pageContent = pageContent.replaceAll(matchExp, splited.join('\n'));

    EntryCont.updateFile(path, fileName, pageContent);
  }

  void remove(String name, String option) {
    String pageContent = contentAlt;
    late String text;

    switch (option) {
      case 'page': text = 'PageCont';
      case 'db' || 'other': text = 'Cont';
    }

    String removeText = '\\n[\\s]*Get.put\\(${name.toPascalCase}$text\\(\\)\\);';
    Pattern removePattern = RegExp(removeText);

    pageContent = pageContent.replaceAll(removePattern, '');

    EntryCont.updateFile(path, fileName, pageContent);
  }
}
