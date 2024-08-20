import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      return Future.delayed(
        Duration(seconds: 3),
        () {
          Get.offNamed(Routes.BTMNAVBAR);
        },
      );
    } else {
      return Future.delayed(
        Duration(seconds: 3),
        () {
          Get.offNamed(Routes.LOGIN);
        },
      );
    }
  }
}
