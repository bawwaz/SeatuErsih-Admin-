import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/register_page/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
