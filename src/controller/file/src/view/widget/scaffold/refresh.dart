import '../../../../../entry.dart';
import '../../../../../file.dart';

class RefreshScaffoldFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/view/widget/scaffold/';

  @override
  String get fileName => 'refresh.dart';

  @override
  String get content => '''
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:$title/global.dart';
import 'package:$title/src/view.dart';

export './refresh/main.dart';

class RefreshScaffold extends ${C}Scaffold {
  const RefreshScaffold({
    super.key,
    super.appBar,
    super.body,
    super.drawer,
    super.drawerScrimColor,
    super.autoPadding,
    super.bottomWidget,
    super.bottomPadding,
    super.bottomNavigationBar,
    super.backgroundColor,
    required this.refreshController,
    required this.onRefresh,
    this.scrollController,
  });

  final RefreshController refreshController;
  final Future Function() onRefresh;
  final ScrollController? scrollController;

  @override
  Widget? get body => SmartRefresher(
    controller: refreshController,
    onRefresh: () async {
      await onRefresh();
      refreshController.refreshCompleted();
    },
    onLoading: () async {
      await delay(10.ms);
      refreshController.loadComplete();
    },
    header: MaterialClassicHeader(
      // color: ThemeCont.to.textAlt,
      // backgroundColor: ThemeCont.to.surface,
      offset: 40.0.h,
    ),
    child: SingleChildScrollView(
      controller: scrollController,
      child: super.body,
    ),
  );
}
''';
}
