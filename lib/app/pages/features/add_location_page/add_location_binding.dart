import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_location_page/add_location_controller.dart';

class AddLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLocationController>(() => AddLocationController());
  }
}
