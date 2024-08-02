import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_shoes_brand_page/add_shoes_brand_controller.dart';

class AddShoesBrandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddShoesBrandController>(() => AddShoesBrandController());
  }
}
