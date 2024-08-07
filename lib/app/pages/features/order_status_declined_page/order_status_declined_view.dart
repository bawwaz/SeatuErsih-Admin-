import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_declined_page/order_status_declined_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_declined_page/widget/card_declined_orders.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_declined_page/widget/shimmer_card_decline_orders.dart';

class OrderStatusDeclinedView extends GetView<OrderStatusDeclinedController> {
  const OrderStatusDeclinedView({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Declined Orders',
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
            return ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: 4, // Adjust the number of shimmer items as needed
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ShimmerCardDeclinedOrders(), // Use shimmer widget
                );
              },
            );
          } else if (controller.declinedOrder.isEmpty) {
            return Center(
              child: Text(
                "Tidak Ada Data",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: controller.declinedOrder.length,
              itemBuilder: (context, index) {
                DateTime date = DateTime.parse(
                    controller.declinedOrder[index]["pickup_date"]);
                String formattedPrice = NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'Rp ',
                  decimalDigits: 0,
                ).format(controller.declinedOrder[index]["total_price"]);
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  height: 85,
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                  ),
                  child: CardDeclinedOrders(
                    orderType: controller.declinedOrder[index]["order_type"],
                    date: date,
                    totalPrice: formattedPrice,
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
