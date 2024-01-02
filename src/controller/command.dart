import 'dart:io';

import 'command/add.dart';
import 'command/clear.dart';
import 'command/empty.dart';
import 'command/help.dart';
import 'command/init.dart';
import 'command/remove.dart';
import 'command/title.dart';
import 'command/update.dart';
import 'command/version.dart';
import 'error.dart';
import 'help.dart';
import 'help/empty.dart';

class CommandCont {
  late List<String> args;

  CommandCont(this.args);

  static CommandCont get(List<String> args) {
    if (args.isEmpty) return EmptyCommandCont(args);

    String keyword = args[0];
    switch (keyword) {
      case 'help': return HelpCommandCont(args);
      case 'title': return TitleCommandCont(args);
      case 'init': return InitCommandCont(args);
      case 'add': return AddCommandCont(args);
      case 'rm': return RemoveCommandCont(args);
      case 'clear': return ClearCommandCont(args);
      case 'version': return VersionCommandCont(args);
      case 'update': return UpdateCommandCont(args);
      default:
        print('"$keyword" keyword does not exist');
        exit(-1);
    }
  }

  String get keyword => args[0];
  List<String> get arguments {
    List<String> list = [...args.sublist(1, args.length)];
    return list..removeWhere((arg) => arg[0] == '-');
  }

  List<String> get options {
    List<String> list = [...args.sublist(1, args.length)];
    return list.where((arg) => arg[0] == '-').toList();
  }

  void execute() {
    if (args.isEmpty) {
      ErrorCont.showInputInvaild(args);
      EmptyHelpCont().showUsage(args);
      return;
    }

    HelpCont cont = HelpCont.get(keyword);
    if (!cont.validate(arguments, options)) {
      ErrorCont.showInputInvaild(args);
      cont.showUsage(arguments);
    }

    if (arguments.contains('help')) {
      cont.showUsage(arguments);
    }
  }
}
