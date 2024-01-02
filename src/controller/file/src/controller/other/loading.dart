import '../../../../entry.dart';
import '../../../../file.dart';

class LoadingContFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/controller/other/';

  @override
  String get fileName => 'loading.dart';

  @override
  String get content => '''
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:$title/src/controller.dart';

class LoadingCont extends Cont {
  static LoadingCont get to => Get.find<LoadingCont>();

  final Color _mainColor = Colors.grey;
  final _color = Colors.grey.obs;
  final _count = 0.obs;
  final _opacity = .2.obs;
  Timer? _timer;

  static final _refreshQueue = <String>[].obs;

  static bool start([String? id, int? sec]) => to.loadStart(id, sec);
  static void end() => to.loadEnd();
  static void clearQueue() => _refreshQueue.clear();

  bool get loading => _count.value > 0;
  Color get color => _color.value;

  void _increaseCount() {}
  void _decreaseCount() {}

  late DateTime _loadTime;

  bool loadStart([String? id, int? sec]) => false;
  void loadEnd() async {}

  @override
  Future init() => throw UnimplementedError();
}
''';
}
