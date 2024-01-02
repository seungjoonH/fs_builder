import '../../entry.dart';
import '../../file.dart';

class FirebaseFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}global/';

  @override
  String get fileName => 'firebase.dart';

  @override
  String get content => '''
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

var f = FirebaseFirestore.instance;
var s = FirebaseStorage.instance;
''';
}
