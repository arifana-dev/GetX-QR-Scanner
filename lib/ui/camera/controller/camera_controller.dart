import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../home/controller/home_controller.dart';

class CameraController extends GetxController {
  final controller = MobileScannerController().obs;

  Rect scanWindows(BuildContext context) {
    return Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: Get.width * 0.6,
      height: Get.width * 0.6,
    );
  }

  Future<void> onDetect(
    Barcode barcode,
    MobileScannerArguments? args,
  ) async {
    if (barcode.rawValue == null) {
      Get.snackbar('Failed!', 'Failed to Scan QR/Barcode');
    } else {
      final home = Get.find<HomeController>();
      home.barcode.add(barcode);
      if (args != null) home.args.add(args);

      Get.back(closeOverlays: true, result: barcode);
      Get.snackbar('Success!', 'Success to Scan QR/Barcode');
    }
  }
}
