import '../../../../../extension.dart';
import '../../../../entry.dart';
import '../../../../file.dart';

class ConcreteLocalModelFileCont extends FileCont {
  ConcreteLocalModelFileCont(this.name);

  final String name;

  @override
  String get path => '${EntryCont.libPath}src/model/localmodel/';

  @override
  String get fileName => '$name.dart';

  @override
  String get content => '''
class ${name.toPascalCase} extends LocalModel {
	late String _id;
	
  ${name.toPascalCase}.fromJson(super.json) : super.fromJson();
	
	@override
	void fromJson(Map<String, dynamic> json) {
		_id = json['id'];
	}
	
	@override
	String get key => _id;
}
''';
}
