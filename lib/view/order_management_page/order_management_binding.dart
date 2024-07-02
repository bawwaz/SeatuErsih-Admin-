import 'package:get/get.dart';
import 'package:seatu_ersih_admin/view/order_management_page/order_management_controller.dart';

class orderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderManagementController>(() => OrderManagementController());
  }
}
