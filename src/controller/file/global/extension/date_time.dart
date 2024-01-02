import '../../../entry.dart';
import '../../../file.dart';

class DateTimeExtensionFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}global/extension/';

  @override
  String get fileName => 'date_time.dart';

  @override
  String get content => '''
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:$title/global.dart';
import 'package:$title/src/controller.dart';

enum Weekday {
  mon, tue, wed, thu, fri, sat, sun;
  String get _tr => 'weekdays.\$name';
  String get long => LangCont.tr('\$_tr.l');
  String get mid => LangCont.tr('\$_tr.m');
  String get short => LangCont.tr('\$_tr.s');
}

extension DateTimeExtension on DateTime {
  Timestamp get toTimestamp => Timestamp.fromDate(this);

  DateTime get ignoreTime => DateTime(year, month, day);

  int get age => now.difference(this).inDays ~/ 365.25;
  int get generation => age ~/ 10 * 10;

  Weekday get wd => Weekday.values[weekday - 1];
}
''';
}
