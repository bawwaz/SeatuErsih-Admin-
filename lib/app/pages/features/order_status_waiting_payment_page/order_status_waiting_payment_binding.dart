import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_waiting_payment_page/order_status_waiting_payment_controller.dart';

class OrderStatusWaitingPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderStatusWaitingPaymentController>(
      () => OrderStatusWaitingPaymentController(),
    );
  }
}
