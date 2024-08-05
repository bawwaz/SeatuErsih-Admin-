import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_deep_page/product_review_deep_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_deep_page/widget/card_review_deep.dart';

class ProductReviewDeepView extends GetView<ProductReviewDeepController> {
  const ProductReviewDeepView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/img/angle-circle-right 1.png'),
        ),
        centerTitle: true,
        title: Text(
          'Deep Clean Review',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.reviewDeepList.isEmpty) {
          return Center(child: Text('No data found.'));
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: controller.reviewDeepList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 3,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: CardReviewDeep(
                    orderType: controller.reviewDeepList[index]["order_type"] ??
                        'No order',
                    date: DateTime.parse(controller.reviewDeepList[index]
                            ["review_date"] ??
                        DateTime.now().toString()),
                    name: controller.reviewDeepList[index]["user"]
                            ?["username"] ??
                        'No name',
                    rating: controller.reviewDeepList[index]["rating"]
                            ?.toString() ??
                        'No rating',
                    review: controller.reviewDeepList[index]["review"] ??
                        'No review',
                    profilePictureUrl: controller.reviewDeepList[index]["user"]
                        ?["profile_picture"],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
