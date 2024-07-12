import 'package:get/get.dart';
import 'package:seatu_ersih_admin/view/order_status_declined_page/order_status_declined_controller.dart';

class orderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderStatusDeclinedController>(() => OrderStatusDeclinedController());
  }
}
