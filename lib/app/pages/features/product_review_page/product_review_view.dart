import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/product_review_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/widget/card_product_review_deep.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/widget/card_product_review_regular.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class ProductReviewView extends GetView<ProductReviewController> {
  const ProductReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Product Review',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Obx(
              () => ListView.builder(
                itemCount: controller.laundries.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        controller.laundries[index]['id'] == 1 ? Get.toNamed(Routes.PRODUCTREVIEWREG, arguments: 1.toString(),):
                        Get.toNamed(Routes.PRODUCTREVIEWDEEP, arguments: 2.toString(),);
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
                        child: CardProductReviewDeep(
                          name: controller.laundries[index]['name'],
                          description: controller.laundries[index]
                              ['Description'],
                          rating: controller.laundries[index]["average_rating"],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
