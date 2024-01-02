import 'dart:io';

import 'help/add.dart';
import 'help/clear.dart';
import 'help/empty.dart';
import 'help/help.dart';
import 'help/init.dart';
import 'help/remove.dart';
import 'help/title.dart';
import 'help/update.dart';
import 'help/version.dart';
import 'title.dart';

abstract class HelpCont {
  static String get executeCommand => TitleCont.title ?? 'dart main.dart';

  static HelpCont get(String keyword) {
    switch (keyword) {
      case '': return EmptyHelpCont();
      case 'help': return HelpHelpCont();
      case 'title': return TitleHelpCont();
      case 'init': return InitHelpCont();
      case 'add': return AddHelpCont();
      case 'rm': return RemoveHelpCont();
      case 'clear': return ClearHelpCont();
      case 'version': return VersionHelpCont();
      case 'update': return UpdateHelpCont();
      default:
        print('"$keyword" keyword does not exist');
        exit(-1);
    }
  }

  String get command;
  Map<String, String> get data;
  Map<String, String> optData = {};

  static Map<String, String> _sortMap(Map<String, String> map) {
    return Map.fromEntries([...map.entries]
      ..sort((e1, e2) => e1.key.compareTo(e2.key)));
  }

  Map<String, String> get sortedData => _sortMap(data);

  List<int> get argumentRequired => [1];
  List<int> get optionRequired => [0];

  bool validate(List<String> arguments, [List<String>? options]) {
    return argumentRequired.contains(arguments.length) &&
        optionRequired.contains(options?.length ?? 0);
  }

  void showUsage(List<String> arguments, [List<String>? options]) {
    bool hasOption = optionRequired.any((c) => c > 0);

    print('');
    print('HELP');
    print('');
    print('  * Command:');
    print('  $command');
    print('');
    print('  * Usage:');
    print(
        '  $executeCommand $command [argument] ${hasOption ? '(option)' : ''}');
    print('');
    if (data.isNotEmpty) print('  * Arguments:');
    for (String cmd in sortedData.keys) {
      int cmdLen = cmd.length;

      print('  $cmd${' ' * (26 - cmdLen)}${sortedData[cmd]!}');
    }
    print('');
    if (optData.isNotEmpty) print('  * Options:');
    for (String cmd in optData.keys) {
      int cmdLen = cmd.length;

      print('  $cmd${' ' * (26 - cmdLen)}${optData[cmd]!}');
    }

    exit(-1);
  }
}
