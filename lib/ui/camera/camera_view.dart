import 'package:ar_qr_scanner/application/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'controller/camera_controller.dart';
import 'widgets/scanner_overlay.dart';

class CameraView extends GetView<CameraController> {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Scan',
          textScaleFactor: 1.sp,
        ),
        backgroundColor: CustomColors.background,
      ),
      body: Obx(
        () => Stack(
          children: [
            MobileScanner(
              fit: BoxFit.cover,
              allowDuplicates: false,
              onDetect: controller.onDetect,
              controller: controller.controller.value,
            ),
            CustomPaint(
              painter: ScannerOverlay(controller.scanWindows(context)),
            ),
          ],
        ),
      ),
    );
  }
}
