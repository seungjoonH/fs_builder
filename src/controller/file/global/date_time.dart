import '../../entry.dart';
import '../../file.dart';

class DateTimeFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}global/';

  @override
  String get fileName => 'date_time.dart';

  @override
  String get content => '''
import 'dart:ui';

import 'package:$title/global.dart';

DateTime get now => DateTime.now();
DateTime get today => now.ignoreTime;
DateTime get yesterday => today.subtract(const Duration(days: 1));
final tomorrow = today.add(const Duration(days: 1));

Future delay(Duration d, [VoidCallback? f]) async => await Future.delayed(d, f);
''';
}
