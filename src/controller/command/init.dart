import 'dart:io';

import '../../extension.dart';
import '../command.dart';
import '../entry.dart';
import '../file.dart';
import '../file/app.dart';
import '../file/global.dart';
import '../file/global/date_time.dart';
import '../file/global/extension.dart';
import '../file/global/extension/date_time.dart';
import '../file/global/extension/duration.dart';
import '../file/global/extension/int.dart';
import '../file/global/firebase.dart';
import '../file/global/string.dart';
import '../file/main.dart';
import '../file/route.dart';
import '../file/src/controller.dart';
import '../file/src/controller/dbmodel.dart';
import '../file/src/controller/get.dart';
import '../file/src/controller/other/loading.dart';
import '../file/src/controller/other.dart';
import '../file/src/controller/other/auth.dart';
import '../file/src/controller/other/lang.dart';
import '../file/src/controller/other/theme.dart';
import '../file/src/controller/page.dart';
import '../file/src/dao/dbdao.dart';
import '../file/src/dao/dbdao/concrete.dart';
import '../file/src/dao/localdao.dart';
import '../file/src/model.dart';
import '../file/src/dao.dart';
import '../file/src/model/dbmodel.dart';
import '../file/src/model/dbmodel/concrete.dart';
import '../file/src/model/localmodel.dart';
import '../file/src/view.dart';
import '../file/src/view/page.dart';
import '../file/src/view/widget.dart';
import '../file/src/view/widget/scaffold.dart';
import '../file/src/view/widget/scaffold/refresh.dart';
import '../file/src/view/widget/scaffold/refresh/main.dart';
import '../title.dart';

class InitCommandCont extends CommandCont {
  InitCommandCont(super.args);

  String get name => arguments[0];

  @override
  void execute() {
    super.execute();

    String? option;
    if (options.isNotEmpty) {
      if (options.contains('-f') || options.contains('--force')) {
        option = 'force';
      } else if (options.contains('-u') || options.contains('--update')) {
        option = 'update';
      } else {
        print('"${options.first}" option does not exist');
        exit(-1);
      }
    }

    if (arguments.isEmpty) initAll(option: option);

    var cont = FileCont.get(name.toKebabCase);

    cont.init(option: option);
  }

  void initAll({String? option}) {
    if (option == 'force') EntryCont.removeDir(force: true);

    // lib
    MainFileCont().init(option: option);
    RouteFileCont().init(option: option);
    AppFileCont().init(option: option);
    GlobalFileCont().init(option: option);

    // lib/global
    DateTimeFileCont().init(option: option);
    FirebaseFileCont().init(option: option);
    StringFileCont().init(option: option);
    ExtensionFileCont().init(option: option);

    // lib/global/extension
    DateTimeExtensionFileCont().init(option: option);
    DurationExtensionFileCont().init(option: option);
    IntExtensionFileCont().init(option: option);

    // lib/src/
    DAOFileCont().init(option: option);
    ModelFileCont().init(option: option);
    ControllerFileCont().init(option: option);
    ViewFileCont().init(option: option);

    // lib/src/controller/
    GetContFileCont().init(option: option);
    PageContFileCont().init(option: option);
    LoadingContFileCont().init(option: option);
    DBModelContFileCont().init(option: option);
    OtherContFileCont().init(option: option);

    // lib/src/controller/other/
    AuthContFileCont().init(option: option);
    LangContFileCont().init(option: option);
    ThemeContFileCont().init(option: option);

    // lib/src/dao/
    DBDAOFileCont().init(option: option);
    LocalDAOFileCont().init(option: option);

    // lib/src/dao/dbdao
    ConcreteDBDAOFileCont('${TitleCont.C}User').init(option: option);

    // lib/src/model/
    DBModelFileCont().init(option: option);
    LocalModelFileCont().init(option: option);

    // lib/src/model/dbmodel/
    ConcreteDBModelFileCont('${TitleCont.C}User').init(option: option);

    // lib/src/view/
    PageFileCont().init(option: option);
    WidgetFileCont().init(option: option);

    // lib/src/view/widget/
    ScaffoldFileCont().init(option: option);

    // lib/src/view/widget/refresh/
    RefreshScaffoldFileCont().init(option: option);

    // lib/src/view/widget/refresh/main/
    MainScaffoldFileCont().init(option: option);

    exit(0);
  }
}
