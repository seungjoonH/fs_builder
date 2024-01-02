import '../../extension.dart';
import '../entry.dart';
import '../file.dart';

class AppFileCont extends FileCont {
  @override
  String get path => EntryCont.libPath;

  @override
  String get fileName => '$title.dart';

  @override
  String get content => '''
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:$title/route.dart';
import 'package:$title/src/controller.dart';

class ${title.capitalize} extends StatefulWidget {
  const ${title.capitalize}({super.key});

  @override
  State<${title.capitalize}> createState() => _${title.capitalize}State();
}

class _${title.capitalize}State extends State<${title.capitalize}> {
  get _instance => WidgetsBinding.instance;

  void initialSetting(Duration _) async {
    // await LocalModel.loadAll();
  }

  @override
  void initState() {
    super.initState();
    _instance.addPostFrameCallback(initialSetting);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeCont());
    Get.put(LangCont());

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        PageCont.context = context;
        PageCont.mediaQuery = MediaQuery.of(context);
        return GetMaterialApp(
          enableLog: false,
          title: '${title.capitalize}',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: LangCont.to.getLocale ?? context.locale,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(size: 20.0),
            ),
          ),
          initialBinding: BindingsBuilder(GetCont.init),
          getPages: ${C}Route.getPages,
        );
      },
    );
  }
}

''';
}
