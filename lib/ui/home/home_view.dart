import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../application/constants/app_text.dart';
import '../../application/constants/colors.dart';
import '../../application/helpers/hex_color.dart';
import 'controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Text(
                AppInfo.appTitle,
                textScaleFactor: 1.3.sp,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.sp),
                child: const Divider(thickness: 1),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      color: HexColor.fromHex('#D61355'),
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: const Text('Under Construction'),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: HexColor.fromHex('#F94A29'),
                            child: Padding(
                              padding: EdgeInsets.all(10.sp),
                              child: const Text('Under Construction'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            color: HexColor.fromHex('#FCE22A'),
                            child: Padding(
                              padding: EdgeInsets.all(10.sp),
                              child: const Text('Under Construction'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Card(
                      color: HexColor.fromHex('#30E3DF'),
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: const Text('Under Construction'),
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {},
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                color: Colors.teal,
                child: const Text('Scan'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
