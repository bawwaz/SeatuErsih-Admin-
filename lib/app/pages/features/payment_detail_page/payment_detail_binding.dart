import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/payment_detail_page/payment_detail_controller.dart';

class PaymentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentDetailController>(() => PaymentDetailController());
  }
}
