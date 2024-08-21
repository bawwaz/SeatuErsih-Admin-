import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_deep_page/product_review_deep_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_deep_page/widget/card_review_deep.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_deep_page/widget/shimmer_review_deep.dart';
import 'package:shimmer/shimmer.dart';

class ProductReviewDeepView extends GetView<ProductReviewDeepController> {
  const ProductReviewDeepView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final headingFontSize = screenWidth * 0.045;
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
            fontSize: headingFontSize,
          ),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Color(0xff7EC1EB),
        onRefresh: () async {
          return await controller.getDetailOrder();
        },
        child: Obx(() {
          if (controller.isLoading.value) {
            return ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: controller.isLoading.value
                  ? 4
                  : controller.reviewDeepList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ShimmerReviewDeep(),
                  ),
                );
              },
            );
          } else if (controller.reviewDeepList.isEmpty) {
            return ListView(
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                Container(
                  height: 700,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Tidak Ada Data",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
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
                      orderType: controller.reviewDeepList[index]
                              ["order_type"] ??
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
                      profilePictureUrl: controller.reviewDeepList[index]
                          ["user"]?["profile_picture"],
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
