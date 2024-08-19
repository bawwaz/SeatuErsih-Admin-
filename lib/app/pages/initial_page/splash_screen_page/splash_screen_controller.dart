import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(Routes.LOGIN); 
    });
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      // Jika token ada, arahkan ke halaman utama
      
      Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(Routes.BTMNAVBAR);
    });
    } else {
      // Jika token tidak ada, arahkan ke halaman login
      
      Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(Routes.LOGIN);
    });
    }
  }
}
