import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/splash_screen_page/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashScreenController>(SplashScreenController());
  }
}
