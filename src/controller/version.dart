import 'dart:io';

import 'entry.dart';
import 'json.dart';

class VersionCont {
  static String? _version;

  static var jsonCont = JsonCont(EntryCont.jsonFilePath);

  static void _loadVersion() {
    _version = jsonCont.loadedJson['version'];
  }

  static String? get version {
    if (_version == null) _loadVersion();
    return _version;
  }

  static Future update() async {
    String path = EntryCont.concat(EntryCont.projectPath, '/fs_builder');
    var result = await Process.run(
      'git', ['push', 'origin', 'main'],
      workingDirectory: path,
    );

    if (result.stderr != '') {
      print('Update Failed\n\n${result.stderr}');
      exit(-1);
    }

    print('"FS Builder" is now up to date');
    _loadVersion();
    print('ver $_version');
    exit(0);
  }
}
