import '../../../../entry.dart';
import '../../../../file.dart';

class ThemeContFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/controller/other/';

  @override
  String get fileName => 'theme.dart';

  @override
  String get content => '''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:$title/src/controller.dart';

class ThemeCont extends Cont {
  static ThemeCont get to => Get.find<ThemeCont>();

  final _mode = ThemeMode.system.obs;
  ThemeMode get themeMode => _mode.value;

  void setThemeMode(ThemeMode mode) => _mode(mode);

  @override
  Future init() async => _mode(AuthCont.to.logged!.themeMode);

  Brightness get brightness {
    Brightness system = PageCont.mediaQuery.platformBrightness;
    if (!AuthCont.to.isLogged) return system;
    switch (themeMode) {
      case ThemeMode.system: return system;
      case ThemeMode.light: return Brightness.light;
      case ThemeMode.dark: return Brightness.dark;
    }
  }
  bool get isLightMode => brightness == Brightness.light;
  bool get isDarkMode => brightness == Brightness.dark;


  /// color
  static const MaterialColor primary = MaterialColor(0xFFFF9F47, {
     1: Color(0xFFFFF4E9),
     5: Color(0xFFFFDBA6),
    10: Color(0xFFFFB36A),
    20: Color(0xFFFF9F47),
    30: Color(0xFFFF8C1E),
    40: Color(0xFFFF7D00),
    50: Color(0xFFF06B02),
    60: Color(0xFFE55D10),
    70: Color(0xFFD54E14),
  });

  static const MaterialColor neutral = MaterialColor(0xFFC7C8D0, {
     0: Color(0xFFFFFFFF),
     5: Color(0xFFF9FAFC),
    10: Color(0xFFEDEEF1),
    20: Color(0xFFC7C8D0),
    30: Color(0xFFA1A1A8),
    40: Color(0xFF6B6B70),
    50: Color(0xFF46464B),
    60: Color(0xFF1E1E22),
    70: Color(0xFF040404),
  });

  static const Color positive = Color(0xFF39E68A);
  static const Color danger = Color(0xFFE84242);

  /// typography
  static const fontFamily = 'Pretendard';
  static const _ff = fontFamily;

  static const bold = FontWeight.w700;
  static const semiBold = FontWeight.w600;
  static const medium = FontWeight.w500;
  static const regular = FontWeight.w400;

  static const title = [
    TextStyle(fontFamily: _ff, fontWeight: bold,     fontSize: 20.0, height: 20 / 24),
    TextStyle(fontFamily: _ff, fontWeight: semiBold, fontSize: 20.0, height: 20 / 24),
    TextStyle(fontFamily: _ff, fontWeight: semiBold, fontSize: 18.0, height: 18 / 22),
    TextStyle(fontFamily: _ff, fontWeight: semiBold, fontSize: 16.0, height: 16 / 20),
  ];
  static const subtitle = [
    TextStyle(fontFamily: _ff, fontWeight: bold,     fontSize: 15.0, height: 15 / 18),
    TextStyle(fontFamily: _ff, fontWeight: semiBold, fontSize: 14.0, height: 14 / 18),
    TextStyle(fontFamily: _ff, fontWeight: semiBold, fontSize: 12.0, height: 12 / 16),
  ];
  static const button = [
    TextStyle(fontFamily: _ff, fontWeight: semiBold, fontSize: 18.0, height: 18 / 18),
    TextStyle(fontFamily: _ff, fontWeight: semiBold, fontSize: 15.0, height: 15 / 15),
    TextStyle(fontFamily: _ff, fontWeight: medium,   fontSize: 13.0, height: 13 / 13),
  ];
  static const body = [
    TextStyle(fontFamily: _ff, fontWeight: medium,   fontSize: 18.0, height: 18 / 26),
    TextStyle(fontFamily: _ff, fontWeight: medium,   fontSize: 16.0, height: 16 / 24),
    TextStyle(fontFamily: _ff, fontWeight: regular,  fontSize: 14.0, height: 14 / 22),
    TextStyle(fontFamily: _ff, fontWeight: regular,  fontSize: 13.0, height: 13 / 20),
  ];
  static const caption = [
    TextStyle(fontFamily: _ff, fontWeight: regular,  fontSize: 12.0, height: 12 / 18),
    TextStyle(fontFamily: _ff, fontWeight: medium,   fontSize: 11.0, height: 11 / 16),
  ];

  static const   zero =   .0;
  static const   xxxs =  4.0;
  static const    xxs =  6.0;
  static const     xs =  8.0;
  static const      s = 12.0;
  static const      m = 16.0;
  static const      l = 20.0;
  static const     xl = 24.0;
  static const    xxl = 32.0;
  static const   xxxl = 40.0;
  static const  xxxxl = 48.0;
  static const xxxxxl = 64.0;

  static const Color  kakao = Color(0xFFFFFE50);
  static const Color  naver = Color(0xFF03CF5D);
  static const Color google = Color(0xFFEA4335);
  static const Color  apple = Color(0xFF000000);
}
''';
}
