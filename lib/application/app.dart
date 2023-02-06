import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app.routes.dart';
import 'constants/app_text.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          getPages: routes,
          title: AppInfo.appTitle,
          initialRoute: Routes.home,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.cupertino,
        );
      },
    );
  }
}
