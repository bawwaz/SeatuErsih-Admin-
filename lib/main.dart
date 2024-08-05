import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/firebase_options.dart';
import 'app/router/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
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
