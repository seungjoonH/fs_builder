import '../command.dart';
import '../version.dart';

class UpdateCommandCont extends CommandCont {
  UpdateCommandCont(super.args);

  @override
  void execute() {
    super.execute();
    VersionCont.update();
  }
}