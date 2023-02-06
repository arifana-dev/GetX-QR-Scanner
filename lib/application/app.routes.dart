import 'package:get/get.dart';

import '../ui/camera/camera_view.dart';
import '../ui/camera/controller/camera_binding.dart';
import '../ui/home/controller/home_binding.dart';
import '../ui/home/home_view.dart';

List<GetPage<dynamic>> get routes {
  return [
    GetPage(
      name: Routes.home,
      binding: HomeBinding(),
      page: () => const HomeView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.camera,
      binding: CameraBinding(),
      page: () => const CameraView(),
      transition: Transition.cupertino,
    ),
  ];
}

abstract class Routes {
  static const home = '/home';
  static const camera = '/camera';
}
