import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/total_customer_page/total_customer_controller.dart';

class TotalCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TotalCustomerController>(() => TotalCustomerController());
  }
}
