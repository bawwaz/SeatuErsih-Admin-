import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/product_review_controller.dart';

class ProductReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductReviewController>(() => ProductReviewController());
  }
}
