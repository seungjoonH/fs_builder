import 'dart:io';

import 'entry.dart';
import 'file/app.dart';
import 'file/global.dart';
import 'file/global/date_time.dart';
import 'file/global/extension.dart';
import 'file/global/extension/date_time.dart';
import 'file/global/extension/duration.dart';
import 'file/global/extension/int.dart';
import 'file/global/firebase.dart';
import 'file/global/string.dart';
import 'file/main.dart';
import 'file/route.dart';
import 'file/src/controller.dart';
import 'file/src/controller/get.dart';
import 'file/src/controller/other.dart';
import 'file/src/controller/other/auth.dart';
import 'file/src/controller/other/lang.dart';
import 'file/src/controller/other/theme.dart';
import 'file/src/controller/page.dart';
import 'file/src/model.dart';
import 'file/src/dao.dart';
import 'file/src/model/dbmodel.dart';
import 'file/src/view.dart';
import 'file/src/view/page.dart';
import 'file/src/view/widget.dart';
import 'file/src/view/widget/scaffold.dart';
import 'file/src/view/widget/scaffold/refresh.dart';
import 'file/src/view/widget/scaffold/refresh/main.dart';
import 'title.dart';

abstract class FileCont {
  static FileCont get(String keyword) {
    switch (keyword) {
      case 'main':
        return MainFileCont();
      case 'route':
        return RouteFileCont();
      case 'app':
        return AppFileCont();
      case 'global':
        return GlobalFileCont();
      case 'date-time':
        return DateTimeFileCont();
      case 'firebase':
        return FirebaseFileCont();
      case 'string':
        return StringFileCont();
      case 'extension':
        return ExtensionFileCont();
      case 'date-time-extension':
        return DateTimeExtensionFileCont();
      case 'duration-extension':
        return DurationExtensionFileCont();
      case 'int-extension':
        return IntExtensionFileCont();
      case 'cont' || 'controller':
        return ControllerFileCont();
      case 'model':
        return ModelFileCont();
      case 'view':
        return ViewFileCont();
      case 'get-cont':
        return GetContFileCont();
      case 'other-cont':
        return OtherContFileCont();
      case 'page-cont':
        return PageContFileCont();
      case 'auth-cont':
        return AuthContFileCont();
      case 'lang-cont':
        return LangContFileCont();
      case 'theme-cont':
        return ThemeContFileCont();
      case 'dao':
        return DAOFileCont();
      case 'dbmodel':
        return DBModelFileCont();
      case 'page':
        return PageFileCont();
      case 'widget':
        return WidgetFileCont();
      case 'scaffold':
        return ScaffoldFileCont();
      case 'refresh-scaffold':
        return RefreshScaffoldFileCont();
      case 'main-scaffold':
        return MainScaffoldFileCont();
      default:
        print('"$keyword" keyword does not exist');
        exit(-1);
    }
  }

  String? _path;
  String? _fileName;
  String? _content;

  FileCont({String? path, String? fileName, String? content}) {
    _path = path;
    _fileName = fileName;
    _content = content;
  }

  String get path;
  String get fileName;
  String get content;

  String get pathAlt => _path ?? path;
  String get fileNameAlt => _fileName ?? fileName;
  String get contentAlt =>
      _content ?? EntryCont.getFileContent(pathAlt, fileNameAlt) ?? content;

  String get title => TitleCont.title!;
  String get C => TitleCont.C!;

  RegExp get matchExp => RegExp(r'\/\* [\s\S]+ Area \*\/([\s\S]*)= \*\/');

  String getMatched(String text) {
    return matchExp.firstMatch(text)!.group(0)!;
  }

  void init({String? option}) {
    _content = EntryCont.getFileContent(pathAlt, fileNameAlt);
    EntryCont.initFile(pathAlt, fileNameAlt, option == null ? contentAlt : content);
  }
}
