import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/history_payment_page/history_payment_controller.dart';

class HistoryPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryPaymentController>(() => HistoryPaymentController());
  }
}
