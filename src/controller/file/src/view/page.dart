import '../../../../extension.dart';
import '../../../entry.dart';
import '../../../file.dart';

class PageFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/view/';

  @override
  String get fileName => 'page.dart';

  @override
  String get content => '''
import 'package:flutter/material.dart';
import 'package:$title/src/controller.dart';

/* Export Area */
/* =========== */

abstract class ${C}Page extends StatefulWidget {
  const ${C}Page({super.key});

  @override
  ${C}PageState createState();
}

abstract class ${C}PageState<T extends ${C}Page> extends State<T> {
  PageCont get cont;

  @override
  void initState() {
    super.initState();
    cont.initState();
  }

  @override
  void dispose() {
    super.dispose();
    PageCont.removeContext(context);
  }

  @override
  Widget build(BuildContext context) {
    PageCont.context = context;
    PageCont.mediaQuery = MediaQuery.of(context);
    return buildPage(context);
  }

  Widget buildPage(BuildContext context);
}
''';

  void add(String name, String route) {
    String pageContent = contentAlt;

    String matched = getMatched(pageContent);
    String addText = 'export \'./page$route${name.toSnakeCase}.dart\';';
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
    String pageContent = contentAlt;

    String removeText =
        '\\n[\\s]*export \'.\\/page.*${name.toSnakeCase}.dart\';';
    Pattern removePattern = RegExp(removeText);

    pageContent = pageContent.replaceAll(removePattern, '');

    EntryCont.updateFile(path, fileName, pageContent);
  }
}
