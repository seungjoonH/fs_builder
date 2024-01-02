import '../../../../../../entry.dart';
import '../../../../../../file.dart';

class MainScaffoldFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/view/widget/scaffold/refresh/';

  @override
  String get fileName => 'main.dart';

  @override
  String get content => '''
import 'package:flutter/material.dart';
import 'package:$title/src/view.dart';

class MainScaffold extends RefreshScaffold {
  const MainScaffold({
    super.key,
    super.appBar,
    super.body,
    super.drawer,
    super.drawerScrimColor,
    super.autoPadding,
    super.bottomWidget,
    super.bottomPadding,
    super.backgroundColor,
    required super.refreshController,
    required super.onRefresh,
  });

  @override
  Widget? get bottomNavigationBar => BottomNavigationBar(
    items: const [],
  );
}
''';
}
