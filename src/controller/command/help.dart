import '../command.dart';
import '../help.dart';
import '../help/help.dart';

class HelpCommandCont extends CommandCont {
  HelpCommandCont(super.args);

  @override
  void execute() {
    super.execute();

    if (args.length == 1) {
      HelpHelpCont().showUsage(args);
    }

    String argument = args[1];
    var cont = HelpCont.get(argument);
    cont.showUsage(args);
  }
}
