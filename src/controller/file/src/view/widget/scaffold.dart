import '../../../../entry.dart';
import '../../../../file.dart';

class ScaffoldFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/view/widget/';

  @override
  String get fileName => 'scaffold.dart';

  @override
  String get content => '''
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:$title/src/controller.dart';

export './scaffold/refresh.dart';

class ${C}Scaffold extends Scaffold {
  const ${C}Scaffold({
    super.key,
    super.appBar,
    super.body,
    super.drawer,
    super.drawerScrimColor,
    super.backgroundColor,
    super.extendBodyBehindAppBar,
    super.bottomNavigationBar,
    this.autoPadding = true,
    this.bottomWidget,
    this.bottomPadding,
  });

  final bool autoPadding;
  final Widget? bottomWidget;
  final double? bottomPadding;

  EdgeInsets get _padding => const EdgeInsets.symmetric(
    horizontal: ThemeCont.xl, vertical: ThemeCont.xl,
  );

  EdgeInsets get _bottomWidgetPadding => _padding.copyWith(
    bottom: bottomPadding ?? 80.0.h,
  );

  Widget get _bottomWidget {
    if (bottomWidget == null) return Container();
    return Padding(
      padding: _bottomWidgetPadding,
      child: bottomWidget,
    );
  }

  @override
  Widget? get body => Stack(
    children: [
      Positioned.fill(
        child: SingleChildScrollView(
          child: super.body ?? Container(),
        ),
      ),
      _bottomWidget,
    ],
  );
}
''';
}
