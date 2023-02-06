import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/src/objects/barcode.dart';

import '../../application/app.routes.dart';
import '../../application/constants/app_text.dart';
import '../../application/constants/colors.dart';
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
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.barcode.isEmpty
                        ? 1
                        : controller.barcode.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (controller.barcode.isEmpty) {
                        return _customCard(child: const Text('Scan First'));
                      } else {
                        final data = controller.barcode[index];
                        return _barcodeResult(data, index);
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.sp),
                child: MaterialButton(
                  onPressed: () async {
                    final data = await Get.toNamed(Routes.camera);
                    log('$data');
                  },
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  color: CustomColors.primary,
                  child: const Text('Scan'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _barcodeResult(Barcode data, int index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) => controller.barcode.removeAt(index),
      child: _customCard(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Type'),
                  const Text('Result'),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${data.format.toString().replaceAll('BarcodeFormat.', '').toUpperCase()}',
                  ),
                  SelectableText(
                    data.rawValue ?? '',
                    onTap: () => controller.onValueTap(data.rawValue ?? ''),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card _customCard({required Widget child}) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: child,
      ),
    );
  }
}
