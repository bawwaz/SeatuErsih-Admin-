import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_reg_page/product_review_reg_controller.dart';

class ProductReviewRegBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductReviewRegController>(() => ProductReviewRegController());
  }
}
