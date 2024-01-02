import '../../../../extension.dart';
import '../../../entry.dart';
import '../../../file.dart';

class PageContFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/controller/';

  @override
  String get fileName => 'page.dart';

  @override
  String get content => '''
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:$title/src/controller.dart';
import 'package:$title/src/model.dart';

/* Export Area */
/* =========== */

abstract class PageCont extends Cont {
  // context 관련
  static final List<BuildContext> _contexts = [];
  static List<BuildContext> get contexts => _contexts;
  static set context(BuildContext cont) {
    if (_contexts.contains(cont)) return;
    _contexts.add(cont);
  }
  static BuildContext get context => _contexts.last;
  static removeContext(context) => _contexts.remove(context);

  // mediaQuery 관련
  static late MediaQueryData mediaQuery;
  static Size get size => mediaQuery.size;
  static Orientation get orientation => mediaQuery.orientation;

  static bool get isPortrait => orientation == Orientation.portrait;
  static bool get isLandscape => orientation == Orientation.landscape;

  String get loadKey;

  final refreshCont = RefreshController();

  @override
  Future init() async {
    if (LoadingCont.start(loadKey, 180)) {
      await load();
      await afterRoute();
      LoadingCont.end();
    }
  }

  Future onRefresh() async {
    if (LoadingCont.start()) {
      await load();
      await afterRoute();
      LoadingCont.end();
    }
  }

  void initState({bool reload = false}) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      return reload ? await onRefresh() : await init();
    });
  }

  Future load();
  Future afterRoute() async {}

  ${C}User get logged => AuthCont.to.logged!;
  String get appBarTitle => LangCont.tr('appbar-\$loadKey');
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
