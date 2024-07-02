import 'package:get/get.dart';
import 'package:seatu_ersih_admin/view/order_request_page/order_request_controller.dart';

class orderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRequestController>(() => OrderRequestController());
  }
}
