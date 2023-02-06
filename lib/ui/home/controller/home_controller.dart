import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class HomeController extends GetxController {
  final barcode = <Barcode>[].obs;
  final args = <MobileScannerArguments>[].obs;

  Future onValueTap(String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    Get.snackbar('Success!', 'Success copy value to Clipboard');
  }
}
