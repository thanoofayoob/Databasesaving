import 'package:get/get.dart';

import '../modules/homePage/Controller/homePageController.dart';

class InitialBindings extends Bindings {
  InitialBindings();

  @override
  void dependencies() {
    Get.put<HomePageController>(HomePageController());
  }
}
