import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/global_component/navbar/btmnavcontroller.dart';
import 'app/router/app_pages.dart';

void main() {
  // Register BottomNavigationController
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
