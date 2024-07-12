import 'package:get/get.dart';
import 'package:seatu_ersih_admin/view/order_status_inprogress/order_status_inprogress_controller.dart';

class orderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderStatusInprogressController>(() => OrderStatusInprogressController());
  }
}
