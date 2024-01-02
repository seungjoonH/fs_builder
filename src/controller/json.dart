import 'dart:convert';
import 'dart:io';

class JsonCont {
  late String path;
  JsonCont(this.path);

  Map<String, dynamic> get loadedJson {
    var fileContent = File(path).readAsStringSync();
    return json.decode(fileContent);
  }

  void save(Map<String, dynamic> data, {String? output}) {
    String outputPath = output ?? path;
    var jsonString = const JsonEncoder.withIndent('  ').convert(data);
    File(outputPath).writeAsStringSync(jsonString);
  }
}
