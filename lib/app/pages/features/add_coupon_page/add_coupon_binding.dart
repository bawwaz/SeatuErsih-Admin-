import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_coupon_page/add_coupon_controller.dart';

class AddCouponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCouponController>(() => AddCouponController());
  }
}
