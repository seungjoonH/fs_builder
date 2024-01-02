import '../../../../entry.dart';
import '../../../../file.dart';

class AuthContFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/controller/other/';

  @override
  String get fileName => 'auth.dart';

  @override
  String get content => '''
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:$title/src/controller.dart';
import 'package:$title/src/dao.dart';
import 'package:$title/src/model.dart';

enum LoginType {
  id, kakao, naver, google, apple;
  String get locale => LangCont.tr('word.\$name');
  String get signIn => LangCont.tr('button.sign-in', args: [locale.capitalize!]);

  Color get color => [ThemeCont.google, ThemeCont.apple][index];

  static LoginType? toEnum(String? string) =>
      values.firstWhereOrNull((type) => type.name == string);
}

class AuthCont extends Cont {
  static AuthCont get to => Get.find<AuthCont>();

  final _logged = Rx<${C}User?>(null);

  ${C}User? get logged => _logged.value;
  bool get isLogged => _logged.value != null;
  void setLogged(${C}User user) => _logged(user);

  String get uid => logged!.key;

  User? _credentialUser;

  String? _imageUrl;
  String? _name;
  String? _email;
  String get imageUrl => _imageUrl!;
  String get name => _name ?? 'unnamed';
  String get email => _email!;

  final _loginType = Rx<LoginType?>(null);
  LoginType? get loginType => _loginType.value;

  Future _initAfterLogin() async {}

  void fAutoLogin() async {}
  void fLogin(LoginType type) async {}
  void fLogout() {}
  void fDeleteAccount() {/* not-implemented */}

  Future loadUser() async {
    ${C}User? loaded = await ${C}UserDAO().loadOne(uid);
    if (loaded == null) throw Exception('User load failed');
    setLogged(loaded);
  }

  @override
  Future init() async {
    _logged(null);
    _loginType(null);
  }
}
''';
}
