import 'dart:io';

import '../../extension.dart';
import '../command.dart';
import '../entry.dart';
import '../error.dart';
import '../file.dart';
import '../file/route.dart';
import '../file/src/controller/dbmodel.dart';
import '../file/src/controller/dbmodel/concrete.dart';
import '../file/src/controller/get.dart';
import '../file/src/controller/other.dart';
import '../file/src/controller/other/concrete.dart';
import '../file/src/controller/page.dart';
import '../file/src/dao/dbdao.dart';
import '../file/src/dao/dbdao/concrete.dart';
import '../file/src/dao/localdao.dart';
import '../file/src/dao/localdao/concrete.dart';
import '../file/src/model/dbmodel.dart';
import '../file/src/model/dbmodel/concrete.dart';
import '../file/src/model/localmodel.dart';
import '../file/src/model/localmodel/concrete.dart';
import '../file/src/view/page.dart';
import '../help/remove.dart';
import '../title.dart';

class RemoveCommandCont extends CommandCont {
  RemoveCommandCont(super.args);

  @override
  void execute() {
    super.execute();

    if (arguments.length < 2) {
      ErrorCont.showInputInvaild(args);
      RemoveHelpCont().showUsage(args);
      return;
    }

    if (options.isNotEmpty) {
      print('"${options.first}" option does not exist');
      exit(-1);
    }

    switch (cmd) {
      case 'model': removeModel(); break;
      case 'page': removePage(); break;
      case 'cont': removeCont(); break;
    }
  }

  String get cmd => arguments[0];
  String get name => arguments[1];

  void removeModel() {
    String fileName = name.toSnakeCase;
    late FileCont cont;
    late String filePath;

    DBModelFileCont().remove(name);
    DBDAOFileCont().remove(name);

    cont = ConcreteDBDAOFileCont(name);
    filePath = EntryCont.concat(cont.path, fileName, 'dart');
    EntryCont.removeFile(filePath);

    cont = ConcreteDBModelFileCont(name);
    filePath = EntryCont.concat(cont.path, fileName, 'dart');
    EntryCont.removeFile(filePath);


    LocalModelFileCont().remove(name);
    LocalDAOFileCont().remove(name);

    cont = ConcreteLocalDAOFileCont(name);
    filePath = EntryCont.concat(cont.path, fileName, 'dart');
    EntryCont.removeFile(filePath);

    cont = ConcreteLocalModelFileCont(name);
    filePath = EntryCont.concat(cont.path, fileName, 'dart');
    EntryCont.removeFile(filePath);
  }

  void removePage() {
    PageFileCont().remove(name);
    PageContFileCont().remove(name);
    GetContFileCont().remove(name, 'page');
    String route = RouteFileCont().remove(name);
    if (route == '') return;

    late String path;
    path = EntryCont.concat(EntryCont.libPath, 'src/view/page/');
    path = EntryCont.concat(path, route, 'dart');
    EntryCont.removeFile(path);

    path = EntryCont.concat(EntryCont.libPath, 'src/controller/page/');
    path = EntryCont.concat(path, route, 'dart');
    EntryCont.removeFile(path);
  }

  void removeCont() {
    String nameAlt = name;
    nameAlt = nameAlt.replaceAll(RegExp(r'[cC][oO][nN][tT]$'), '');

    if (nameAlt.contains('page')) {
      print('Please use "rm page" command');
      print('\nRecommend: ');
      print(
          '  \$ ${TitleCont.title} add page ${nameAlt.replaceAll('page', '').toCamelCase}');
      exit(-1);
    }

    GetContFileCont().remove(name, 'db');
    GetContFileCont().remove(name, 'other');

    nameAlt = nameAlt.toCamelCase;

    String fileName = '${nameAlt.toSnakeCase}.dart';
    late FileCont cont;
    late String path;

    DBModelContFileCont().add(nameAlt);
    cont = ConcreteDBModelContFileCont(name);

    path = EntryCont.concat(cont.path, fileName);
    EntryCont.removeFile(path);

    OtherContFileCont().add(nameAlt);
    cont = ConcreteOtherContFileCont(name);

    path = EntryCont.concat(cont.path, fileName);
    EntryCont.removeFile(path);
  }
}
