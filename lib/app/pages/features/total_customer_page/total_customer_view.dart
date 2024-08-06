import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/total_customer_page/widget/card_total_customer.dart';
import 'package:seatu_ersih_admin/app/pages/features/total_customer_page/total_customer_controller.dart';

class TotalCustomerView extends GetView<TotalCustomerController> {
  const TotalCustomerView({super.key});

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
          'All - time Customer',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final totalCustomer = controller.customers.length;
            print(totalCustomer);

            return ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: controller.customers.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 137,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(vertical: 8),
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
                    totalCustomer: totalCustomer
                        .toString(), // Mengirim totalCustomer ke CardTotalCustomer
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
