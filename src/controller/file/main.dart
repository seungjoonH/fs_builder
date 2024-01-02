import '../../extension.dart';
import '../entry.dart';
import '../file.dart';

class MainFileCont extends FileCont {
  @override
  String get path => EntryCont.libPath;

  @override
  String get fileName => 'main.dart';

  @override
  String get content => '''
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:$title/firebase_options.dart';
import 'package:$title/src/controller.dart';
import 'package:$title/$title.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting();
  runApp(LangCont.equipLocalization(const ${title.capitalize}()));
}
''';
}
