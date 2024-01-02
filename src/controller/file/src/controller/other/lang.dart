import '../../../../entry.dart';
import '../../../../file.dart';

class LangContFileCont extends FileCont {
  @override
  String get path => '${EntryCont.libPath}src/controller/other/';

  @override
  String get fileName => 'lang.dart';

  @override
  String get content => '''
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart' as get_lib;
import 'package:easy_localization/easy_localization.dart' as local_lib;
import 'package:get/get.dart';
import 'package:$title/src/controller.dart';
import 'package:$title/src/model.dart';

enum Language {
  system, english, korean;
  List<Language> get langs => [english, korean];
  String get code {
    if (this == system) return LangCont.locale;
    return name.substring(0, 2);
  }

  String get _tr => 'settings.general-menu.language-type';
  String get locale => LangCont.tr('\$_tr.\$name');

  static Language? toEnum(String? string) =>
      values.firstWhereOrNull((lang) => lang.name == string);
}

class LangCont extends Cont {
  static LangCont get to => Get.find<LangCont>();

  static final _supports = Language.values.map((l) => l.code).toList();
  static const String _asset = 'assets/json/locale';
  static final String _fallback = Language.english.code;

  static Widget equipLocalization(Widget child) {
    return local_lib.EasyLocalization(
      supportedLocales: _supports.map((s) => Locale(s)).toList(),
      path: _asset,
      fallbackLocale: Locale(_fallback),
      child: child,
    );
  }

  static bool get isKorean => locale == Language.korean.code;
  static bool get isEnglish => locale == Language.english.code;

  static String get locale {
    String locale = get_lib.Get.locale?.languageCode ?? _fallback;
    if (locale != Language.korean.code) return Language.english.code;
    return locale;
  }

  static String tr(String text, {
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
    BuildContext? context,
  }) => local_lib.tr(
    text,
    args: args,
    namedArgs: namedArgs,
    gender: gender,
    context: context,
  );

  static String plural(String text, num value, {
    List<String>? args,
    BuildContext? context,
    Map<String, String>? namedArgs,
    String? name,
    local_lib.NumberFormat? format,
  }) => text.plural(value,
    args: args,
    context: context,
    namedArgs: namedArgs,
    name: name,
    format: format,
  );

  final _language = Language.system.obs;
  Language get language => _language.value;

  void setLanguage(Language lang) => _language(lang);

  @override
  Future init({Model? model}) async {
    setLanguage(AuthCont.to.logged!.language);
  }

  Locale? get getLocale {
    if (language == Language.system) return null;
    return Locale(language.code);
  }
}
''';
}
