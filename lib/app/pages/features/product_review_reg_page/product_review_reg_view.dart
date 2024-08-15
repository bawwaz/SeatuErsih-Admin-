import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_reg_page/product_review_reg_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_reg_page/widget/card_review_reg.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_reg_page/widget/shimmer_review_reg.dart';
import 'package:shimmer/shimmer.dart';

class ProductReviewRegView extends GetView<ProductReviewRegController> {
  const ProductReviewRegView({super.key});

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
          'Regular Clean Review',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: controller.isLoading.value
                ? 4
                : controller.reviewRegList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ShimmerReviewReg(),
                ),
              );
            },
          );
        } else if (controller.reviewRegList.isEmpty) {
          return Center(child: Text('No data found.'));
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: controller.reviewRegList.length,
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
                  child: CardReviewReg(
                    orderType: controller.reviewRegList[index]["order_type"] ??
                        'No order',
                    date: DateTime.parse(controller.reviewRegList[index]
                            ["review_date"] ??
                        DateTime.now().toString()),
                    name: controller.reviewRegList[index]["user"]
                            ?["username"] ??
                        'No name',
                    rating:
                        controller.reviewRegList[index]["rating"]?.toString() ??
                            'No rating',
                    review: controller.reviewRegList[index]["review"] ??
                        'No review',
                    profilePictureUrl: controller.reviewRegList[index]["user"]
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
