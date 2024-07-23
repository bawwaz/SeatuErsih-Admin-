import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/order_request_controller.dart';

class OrderRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRequestController>(() => OrderRequestController());
  }
}
