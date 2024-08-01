import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/profile_page/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
