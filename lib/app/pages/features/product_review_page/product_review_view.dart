import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/product_review_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/widget/card_product_review_deep.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/widget/card_product_review_regular.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/widget/shimmer_product_review.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';
import 'package:shimmer/shimmer.dart';

class ProductReviewView extends GetView<ProductReviewController> {
  const ProductReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final headingFontSize = screenWidth * 0.045;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/img/angle-circle-right 1.png'),
        ),
        centerTitle: true,
        title: Text(
          'Product Review',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: headingFontSize,
          ),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Color(0xff7EC1EB),
        onRefresh: controller.refreshOrders,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => ListView.builder(
                  itemCount: controller.isLoading.value
                      ? 2
                      : controller.laundries.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (controller.isLoading.value) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: ShimmerProductReview(),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: InkWell(
                          onTap: () {
                            controller.laundries[index]['id'] == 1
                                ? Get.toNamed(Routes.PRODUCTREVIEWREG,
                                    arguments: 1.toString())
                                : Get.toNamed(Routes.PRODUCTREVIEWDEEP,
                                    arguments: 2.toString());
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: controller.laundries[index]['id'] == 1
                                ? CardProductReviewRegular(
                                    name: controller.laundries[index]['name'],
                                    description: controller.laundries[index]
                                        ['description'],
                                    rating: controller.laundries[index]
                                        ["average_rating"],
                                  )
                                : CardProductReviewDeep(
                                    name: controller.laundries[index]['name'],
                                    description: controller.laundries[index]
                                        ['description'],
                                    rating: controller.laundries[index]
                                        ["average_rating"],
                                  ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
