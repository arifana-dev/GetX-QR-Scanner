import 'package:get/get.dart';

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
  ];
}

abstract class Routes {
  static const home = '/home';
}
