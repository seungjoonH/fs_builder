import '../../../../../extension.dart';
import '../../../../entry.dart';
import '../../../../file.dart';

class ConcreteDBModelFileCont extends FileCont {
  ConcreteDBModelFileCont(this.name);

  final String name;

  @override
  String get path => '${EntryCont.libPath}src/model/dbmodel/';

  @override
  String get fileName {
    String ret = '${name.toSnakeCase}.dart';
    if (name != '${C}User') return ret;
    return ret.replaceAll('${C.toLowerCase()}_', '');
  }

  @override
  String get content => '''
import 'package:$title/src/model.dart';

class ${name.toPascalCase} extends DBModel {
	late String _id;
	
  ${name.toPascalCase}.fromJson(super.json) : super.fromJson();
	
	@override
	void fromJson(Map<String, dynamic> json) {
		_id = json['id'];
	}

	@override
  Map<String, dynamic> toJson() {
		Map<String, dynamic> json = {};
		json['id'] = _id;
		return json;
	}
	
	@override
	void fromModel(DBModel model) {
		model as ${name.toPascalCase};
		_id = model._id;
	}
	
	@override
	String get key => _id;
}
''';
}
