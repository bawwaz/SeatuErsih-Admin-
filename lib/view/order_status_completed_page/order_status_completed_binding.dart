import 'package:get/get.dart';
import 'package:seatu_ersih_admin/view/order_status_completed_page/order_status_completed_controller.dart';

class orderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderStatusCompletedController>(() => OrderStatusCompletedController());
  }
}
