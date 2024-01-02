import '../../../entry.dart';
import '../../../file.dart';

class IntExtensionFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}global/extension/';

  @override
  String get fileName => 'int.dart';

  @override
  String get content => '''
import 'package:get/get.dart';

extension IntExtension on int {
  Duration get ms => Duration(milliseconds: this);
  Duration get s => Duration(seconds: this);
  Duration get m => Duration(minutes: this);
  Duration get h => Duration(hours: this);
  Duration get d => Duration(days: this);
  Duration get w => Duration(days: this * 7);

  String get year {
    if (Get.locale!.languageCode == 'ko') return '\$this년';
    return '\${this}y';
  }
  String get month {
    if (Get.locale!.languageCode == 'ko') return '\$this개월';
    return '\${this}mo';
  }
  String get day {
    if (Get.locale!.languageCode == 'ko') return '\$this일';
    return '\${this}d';
  }
  String get hour {
    if (Get.locale!.languageCode == 'ko') return '\$this시간';
    return '\${this}h';
  }
  String get minute {
    if (Get.locale!.languageCode == 'ko') return '\$this분';
    return '\${this}m';
  }
  String get second {
    if (Get.locale!.languageCode == 'ko') return '\$this초';
    return '\${this}s';
  }

  String get zPad2 => '\$this'.padLeft(2, '0');
  String get zPad3 => '\$this'.padLeft(3, '0');
  String get zPad4 => '\$this'.padLeft(4, '0');
  String get zPad8 => '\$this'.padLeft(8, '0');
}
''';
}
