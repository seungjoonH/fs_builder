import '../../../entry.dart';
import '../../../file.dart';

class DurationExtensionFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}global/extension/';

  @override
  String get fileName => 'duration.dart';

  @override
  String get content => '''
import 'package:$title/src/controller/other/lang.dart';

extension DurationExtension on Duration {
  int get inFormatDays => inDays;
  int get inFormatHours => inHours - inDays * 24;
  int get inFormatMinutes => inMinutes - inHours * 60;
  int get inFormatSeconds => inSeconds - inMinutes * 60;

  String get inDaysUnit => LangCont.plural('unit.d', inDays);
  String get inHoursUnit => LangCont.plural('unit.h', inHours);
  String get inMinutesUnit => LangCont.plural('unit.m', inMinutes);
  String get inSecondsUnit => LangCont.plural('unit.s', inSeconds);

  String get inFormatDaysUnit => LangCont.plural('unit.d', inFormatDays);
  String get inFormatHoursUnit => LangCont.plural('unit.h', inFormatHours);
  String get inFormatMinutesUnit => LangCont.plural('unit.m', inFormatMinutes);
  String get inFormatSecondsUnit => LangCont.plural('unit.s', inFormatSeconds);

  String get format {
    String str = '';
    if (inFormatDays > 0) str += '\$inFormatDaysUnit ';
    if (inFormatHours > 0) str += '\$inFormatHoursUnit ';
    if (inFormatMinutes > 0) str += '\$inFormatMinutesUnit ';
    if (inFormatSeconds > 0) str += '\$inFormatSecondsUnit ';
    return str;
  }

  String get withUnit {
    if (inDays > 0) { return inDaysUnit; }
    else if (inHours > 0) { return inHoursUnit; }
    else if (inMinutes > 0) { return inMinutesUnit; }
    return inSecondsUnit;
  }

  String get left => this == Duration.zero
      ? LangCont.tr('word.finished')
      : '\$format\${LangCont.tr('time.left')}';
  String get ago => '\$withUnit \${LangCont.tr('time.ago')}';
}

''';
}
