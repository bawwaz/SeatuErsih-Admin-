import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/global_component/navbar/btmnavcontroller.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/splash_screen_page/splash_screen_controller.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/splash_screen_page/splash_screen_view.dart';
import 'package:seatu_ersih_admin/firebase_options.dart';
import 'app/router/app_pages.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  Get.put(BottomNavigationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Seatu Ersih Admin',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (_) => SplashScreenView(),
    );
  }
}
