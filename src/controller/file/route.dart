import '../../extension.dart';
import '../entry.dart';
import '../file.dart';

class RouteFileCont extends FileCont {
  @override
  String get path => EntryCont.libPath;

  @override
  String get fileName => 'route.dart';

  @override
  String get content => '''
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:$title/global.dart';
import 'package:$title/src/view/page.dart';

class ${C}Route {
  static const Transition transition = Transition.fadeIn;
  static Duration duration = 100.ms;

  static Map<String, Widget> get pages => {
    /* Routes Area */
    /* =========== */
  };

  static List<GetPage> get getPages => pages.entries.map((page) => GetPage(
    name: page.key,
    page: () => page.value,
    transition: transition,
    transitionDuration: duration,
  )).toList();
}
''';

  void add(String name, String route) {
    String pageContent = contentAlt;

    String matched = getMatched(pageContent);
    String addText =
        '\t\t\'$route${name.toKebabCase}\': const ${name.toPascalCase}Page(),';
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

  String remove(String name) {
    String pageContent = contentAlt;

    String routeText = '\'.*\': const ${name.toPascalCase}Page\\(\\),';
    RegExp routePattern = RegExp(routeText);
    String found = routePattern.firstMatch(pageContent)?.group(0) ?? '';
    String route = RegExp('\'(.*)\'').firstMatch(found)?.group(0) ?? '';
    route = route.replaceAll('\'', '');

    String removeText = '\\n[\\s]*\'.*\': const ${name.toPascalCase}Page\\(\\),';
    Pattern removePattern = RegExp(removeText);

    pageContent = pageContent.replaceAll(removePattern, '');

    EntryCont.updateFile(path, fileName, pageContent);

    return route;
  }
}
