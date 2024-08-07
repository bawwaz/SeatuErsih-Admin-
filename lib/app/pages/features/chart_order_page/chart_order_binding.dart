import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/chart_order_page/chart_order_controller.dart';

class ChartOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartOrderController>(() => ChartOrderController());
  }
}
