import 'dart:io';

import 'title.dart';

class EntryCont {
  static String get pwd => Directory.current.path;
  static get projectPath {
    String path = pwd;
    path = pwd.replaceAll(RegExp(r'/fs_builder/*'), '');
    return path.replaceAll('/fs_builder', '');
  }

  static String get libPath {
    return concat(projectPath, 'lib');
  }

  static String get mainPath {
    return concat(projectPath, 'fs_builder/src/main', 'dart');
  }

  static String get shellFilePath {
    return concat(projectPath, 'fs_builder/shell/set_alias', 'sh');
  }

  static String get jsonFilePath {
    return concat(projectPath, 'fs_builder/asset/project', 'json');
  }

  static String toShort(String path) {
    Pattern from = RegExp('^.*lib/');
    String to = '${TitleCont.title}/lib/';
    return path.replaceAll(from, to);
  }

  static void makeDir(String path) {
    Directory dir = Directory(path);
    if (dir.existsSync()) return;
    if (path == '/') return;
    dir.createSync(recursive: true);
    print('DIR  "${toShort(path)}" created');
  }

  static void makeFile(String path, String fileName, [String? content]) {
    String filePath = path + fileName;
    makeDir(path);

    File file = File(filePath);
    file.writeAsStringSync(content ?? '');
  }

  static bool doesfileExist(String path, String fileName) {
    return File(path + fileName).existsSync();
  }

  static String? getFileContent(String path, String fileName) {
    if (!doesfileExist(path, fileName)) return null;
    String filePath = path + fileName;
    File file = File(filePath);
    return file.readAsStringSync();
  }

  static void initFile(String path, String fileName, [String? content]) {
    String filePath = path + fileName;
    makeFile(path, fileName, content);

    print('FILE "${toShort(filePath)}" initialized');
  }

  static void updateFile(String path, String fileName, String content) {
    String filePath = path + fileName;
    makeFile(path, fileName, content);

    print('FILE "${toShort(filePath)}" updated');
  }

  static void removeDir({String? path, bool force = false}) {
    String dirPath = path ?? libPath;
    Directory dir = Directory(dirPath);
    if (!dir.existsSync()) return;
    if (!force && dir.listSync().isNotEmpty) return;
    dir.deleteSync(recursive: force);

    print('DIR  "${toShort(dirPath)}" deleted${force ? ' recursively' : ''}');
  }

  static void removeFile(String path) {
    File file = File(path);
    if (!file.existsSync()) return;
    file.deleteSync();

    String dirPath = path.replaceAll(RegExp(r'\/([^/]+\..*)$'), '');

    print('FILE "${toShort(path)}" deleted');

    removeDir(path: dirPath);
  }

  static String concat(String path1, String path2, [String? ext]) {
    String a = '$path1/';
    String b = '$path2/';
    String path = (a + b).replaceAll(RegExp(r'//+'), '/');
    if (ext == null) return path;
    return '$path.$ext'.replaceAll('/.', '.');
  }
}
