import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_wait_for_payment_page/order_detail_wait_for_payment_controller.dart';

class OrderDetailWaitForPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailWaitForPaymentController>(() => OrderDetailWaitForPaymentController());
  }
}
