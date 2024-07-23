import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_controller.dart';

class OrderManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderManagementController>(() => OrderManagementController());
  }
}
