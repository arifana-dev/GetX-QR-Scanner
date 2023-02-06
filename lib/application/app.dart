import 'package:ar_qr_scanner/application/constants/colors.dart';
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
          theme: ThemeData.light(useMaterial3: true).copyWith(
            backgroundColor: CustomColors.background,
            scaffoldBackgroundColor: CustomColors.background,
            textTheme: Typography.englishLike2018.apply(
              fontSizeFactor: 0.8.sp,
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
          ),
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.cupertino,
        );
      },
    );
  }
}
