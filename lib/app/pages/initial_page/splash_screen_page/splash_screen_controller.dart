import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(Routes.LOGIN); 
    });
  }
}
