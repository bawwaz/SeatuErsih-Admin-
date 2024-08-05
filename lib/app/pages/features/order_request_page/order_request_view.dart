import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/order_request_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/card_contact.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/card_customer.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/card_order.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/floating_button.dart';

class OrderRequestView extends GetView<OrderRequestController> {
  const OrderRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
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
          'Order Request',
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
            return Center(child: CircularProgressIndicator());
          }

          if (controller.detailOrder.isEmpty) {
            return Center(child: Text('No order details available'));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  height: 205,
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
                  child: CardOrder(
                    product: controller.detailOrder["order_type"] ?? 'N/A',
                    note: controller.detailOrder["notes"] ?? 'No notes',
                    date: controller.detailOrder["pickup_date"] != null
                        ? DateTime.parse(controller.detailOrder["pickup_date"])
                        : DateTime.now(),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Contact',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  height: 140,
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
                  child: CardContact(
                    address: controller.detailOrder["detail_address"] ??
                        'No address',
                    phone: controller.detailOrder["phone"] ?? 'No phone',
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Customer',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  height: 200,
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
                  child: CardCustomer(
                    username: controller.detailOrder["user"]["username"] ?? 'No username',
                    email: controller.detailOrder["user"]["email"] ?? 'No email',
                    phone: controller.detailOrder["user"]["phone"] ?? 'No phone',
                    profile: controller.detailOrder["user"]["profile"] ?? '', // Assuming profile URL is in this field
                  ),
                ),
                SizedBox(height: 75),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
