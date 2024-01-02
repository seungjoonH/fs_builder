import 'dart:io';

import 'json.dart';
import 'entry.dart';

class TitleCont {
  static String? _title;

  static var jsonCont = JsonCont(EntryCont.jsonFilePath);

  static void _loadTitle() {
    _title = jsonCont.loadedJson['title'];
  }

  static String? get title {
    if (_title == null) _loadTitle();
    return _title;
  }

  static String? get C {
    if (title == null) return null;
    return title![0].toUpperCase();
  }

  static void setTitle(String title) async {
    var data = jsonCont.loadedJson;
    data['title'] = title;
    jsonCont.save(data);

    await _setAlias(title);

    print('Project title successfully set to "$title"');
  }

  static Future _setAlias(String title) async {
    String shell = EntryCont.shellFilePath;
    String main = EntryCont.mainPath;

    await Process.run('sh', [shell, title, main]);
    await Process.run('/bin/zsh', ['-i', '-c', 'source ~/.zshrc']);
  }
}
