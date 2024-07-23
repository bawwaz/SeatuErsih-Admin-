import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/order_detail_controller.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailController>(() => OrderDetailController());
  }
}
