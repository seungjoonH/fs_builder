import '../command.dart';
import '../entry.dart';

class ClearCommandCont extends CommandCont {
  ClearCommandCont(super.args);

  @override
  void execute() {
    super.execute();

    EntryCont.removeDir(path: EntryCont.libPath, force: true);
  }
}
