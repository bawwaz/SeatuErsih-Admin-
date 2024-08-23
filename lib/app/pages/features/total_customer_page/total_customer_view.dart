import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/total_customer_page/widget/card_total_customer.dart';
import 'package:seatu_ersih_admin/app/pages/features/total_customer_page/total_customer_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/total_customer_page/widget/shimmer_card_total_customer.dart';
import 'package:shimmer/shimmer.dart';

class TotalCustomerView extends GetView<TotalCustomerController> {
  const TotalCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
          child: Image.asset(
            'assets/img/angle-circle-right 1.png',
            width: screenWidth * 0.07,
          ),
        ),
        centerTitle: true,
        title: Text(
          'All - time Customer',
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
          return await controller.getAllCustomers();
        },
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return ListView.builder(
                padding: EdgeInsets.all(screenWidth * 0.05),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: ShimmerCardTotalCustomer(),
                    ),
                  );
                },
              );
            } else if (controller.customers.isEmpty) {
              return Center(
                child: Text(
                  "Tidak Ada Data Customer",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              );
            } else {
              final totalCustomer = controller.customers.length;

              return ListView.builder(
                padding: EdgeInsets.all(screenWidth * 0.05),
                itemCount: controller.customers.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: screenHeight * 0.19,
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: CardTotalCustomer(
                      name: controller.customers[index]["username"],
                      joinDate: DateTime.parse(
                        controller.customers[index]["created_at"],
                      ),
                      profilePictureUrl: controller.customers[index]
                          ["profile_picture"],
                      totalCustomer: totalCustomer.toString(),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
