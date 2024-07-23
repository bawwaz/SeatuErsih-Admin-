import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_inprogress_page/order_status_inprogress_controller.dart';

class OrderStatusInprogressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderStatusInprogressController>(() => OrderStatusInprogressController());
  }
}
