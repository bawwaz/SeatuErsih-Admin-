import 'package:get/get.dart';
import 'package:seatu_ersih_admin/view/product_review_page/product_review_controller.dart';

class orderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductReviewController>(() => ProductReviewController());
  }
}
