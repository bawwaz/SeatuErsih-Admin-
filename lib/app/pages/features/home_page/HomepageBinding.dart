import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/HomepageController.dart';

class homePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<homePageController>(() => homePageController());
  }
}
