import '../command.dart';
import '../version.dart';

class VersionCommandCont extends CommandCont {
  VersionCommandCont(super.args);

  @override
  void execute() {
    super.execute();
    print('ver ${VersionCont.version}');
  }
}
