import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_deep_page/product_review_deep_controller.dart';

class ProductReviewDeepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductReviewDeepController>(() => ProductReviewDeepController());
  }
}
