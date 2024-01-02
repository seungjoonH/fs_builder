import '../../../../../extension.dart';
import '../../../../entry.dart';
import '../../../../file.dart';

class ConcretePageFileCont extends FileCont {
  ConcretePageFileCont(this.name);

  final String name;

  @override
  String get path => '${EntryCont.libPath}src/page/';

  @override
  String get fileName => name;

  @override
  String get content => '''
import 'package:flutter/material.dart';
import 'package:$title/src/controller.dart';
import 'package:$title/src/view.dart';

class ${name.toPascalCase}Page extends ${C}Page {
  const ${name.toPascalCase}Page({super.key});

  @override
  ${C}PageState<${name.toPascalCase}Page> createState() => _${name.toPascalCase}PageState();
}

class _${name.toPascalCase}PageState extends ${C}PageState<${name.toPascalCase}Page> {
  Widget _buildBody(BuildContext context) {
    return Container();
  }

  @override
  Widget buildPage(BuildContext context) {
    return ${C}Scaffold(
      appBar: AppBar(title: Text(cont.appBarTitle)),
      body: _buildBody(context),
    );
  }

  @override
  ${name.toPascalCase}PageCont get cont => ${name.toPascalCase}PageCont.to;
}
''';
}
