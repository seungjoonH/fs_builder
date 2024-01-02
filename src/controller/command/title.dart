import '../command.dart';
import '../title.dart';

class TitleCommandCont extends CommandCont {
  TitleCommandCont(super.args);

  @override
  void execute() {
    super.execute();

    if (args.length == 1) {
      print(TitleCont.title);
      return;
    }

    TitleCont.setTitle(args[1]);
  }
}
