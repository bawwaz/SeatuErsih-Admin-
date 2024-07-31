import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_pending_page/order_status_pending_controller.dart';

class OrderStatusPendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderStatusPendingController>(() => OrderStatusPendingController());
  }
}
