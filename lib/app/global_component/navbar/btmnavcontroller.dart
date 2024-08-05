import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    initNotif();
  }

  Future<void> initNotif() async {
    await FirebaseMessaging.instance.requestPermission();
    final token = await FirebaseMessaging.instance.getToken();
    print("Token Firebase = $token");
  }
}
