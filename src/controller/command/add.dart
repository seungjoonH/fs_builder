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
import '../file/src/controller/page/concrete.dart';
import '../file/src/dao/dbdao.dart';
import '../file/src/dao/dbdao/concrete.dart';
import '../file/src/dao/localdao.dart';
import '../file/src/dao/localdao/concrete.dart';
import '../file/src/model/dbmodel.dart';
import '../file/src/model/dbmodel/concrete.dart';
import '../file/src/model/localmodel.dart';
import '../file/src/model/localmodel/concrete.dart';
import '../file/src/view/page.dart';
import '../file/src/view/page/concrete.dart';
import '../help/add.dart';
import '../title.dart';

class AddCommandCont extends CommandCont {
  AddCommandCont(super.args);

  @override
  void execute() {
    super.execute();

    if (arguments.length < 2) {
      ErrorCont.showInputInvaild(args);
      AddHelpCont().showUsage(args);
      return;
    }

    switch (cmd) {
      case 'model': addModel(); break;
      case 'page': addPage(); break;
      case 'cont': addCont(); break;
    }
  }

  String get cmd => arguments[0];
  String get name => arguments[1];
  String get route {
    if (arguments.length < 3) return '/';
    String r = arguments[2];
    if (r[0] != '/') r = '/$r';
    if (r[r.length - 1] != '/') r = '$r/';
    return r;
  }
  String get opt {
    if (cmd == 'model') {
      if (options.contains('-d') || options.contains('--db')) {
        return 'db';
      } else if (options.contains('-l') || options.contains('--local')) {
        return 'local';
      }
    }
    else if (cmd == 'cont') {
      if (options.contains('-d') || options.contains('--db')) {
        return 'db';
      } else if (options.contains('-o') || options.contains('--other')) {
        return 'other';
      }
    }

    print('"${options.first}" option does not exist');
    exit(-1);
  }

  void addModel() {
    String fileName = '${name.toSnakeCase}.dart';
    late FileCont cont;

    switch (opt) {
      case 'db':
        DBModelFileCont().add(name);
        DBDAOFileCont().add(name);

        cont = ConcreteDBDAOFileCont(name);
        EntryCont.initFile(cont.path, fileName, cont.content);

        cont = ConcreteDBModelFileCont(name);
        EntryCont.initFile(cont.path, fileName, cont.content);

      case 'local':
        LocalModelFileCont().add(name);
        LocalDAOFileCont().add(name);

        cont = ConcreteLocalDAOFileCont(name);
        EntryCont.initFile(cont.path, fileName, cont.content);

        cont = ConcreteLocalModelFileCont(name);
        EntryCont.initFile(cont.path, fileName, cont.content);
    }
  }

  void addPage() {
    PageFileCont().add(name, route);
    PageContFileCont().add(name, route);
    GetContFileCont().add(name, 'page');
    RouteFileCont().add(name, route);

    String libPath = EntryCont.libPath;
    late String path;
    late String fileName;
    late String content;

    path = EntryCont.concat(libPath, 'src/view/page');
    path = EntryCont.concat(path, route);
    fileName = '${name.toSnakeCase}.dart';
    content = ConcretePageFileCont(name).content;

    EntryCont.initFile(path, fileName, content);

    path = EntryCont.concat(libPath, 'src/controller/page');
    path = EntryCont.concat(path, route);
    if (path[path.length - 1] != '/') path += '/';
    fileName = '${name.toSnakeCase}.dart';
    content = ConcretePageContFileCont(name).content;

    EntryCont.initFile(path, fileName, content);
  }

  void addCont() {
    String nameAlt = name;
    nameAlt = nameAlt.replaceAll(RegExp(r'[cC][oO][nN][tT]$'), '');

    if (nameAlt.contains('page')) {
      print('Please use "add page" command');
      print('\nRecommend: ');
      print(
          '  \$ ${TitleCont.title} add page ${nameAlt.replaceAll('page', '').toCamelCase}');
      exit(-1);
    }

    GetContFileCont().remove(name, opt);

    nameAlt = nameAlt.toCamelCase;

    String fileName = '${nameAlt.toSnakeCase}.dart';
    late FileCont cont;

    switch (opt) {
      case 'db':
        DBModelContFileCont().add(nameAlt);
        cont = ConcreteDBModelContFileCont(name);
      case 'other':
        OtherContFileCont().add(nameAlt);
        cont = ConcreteOtherContFileCont(name);
    }

    EntryCont.initFile(cont.path, fileName, cont.content);
  }
}
