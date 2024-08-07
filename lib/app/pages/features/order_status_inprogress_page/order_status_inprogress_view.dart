import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_inprogress_page/order_status_inprogress_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_inprogress_page/widget/card_inprogress_orders.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_inprogress_page/widget/shimmer_card_inprogress_orders.dart'; // Import the shimmer widget
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class OrderStatusInprogressView
    extends GetView<OrderStatusInprogressController> {
  const OrderStatusInprogressView({super.key});

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
          'In - progress',
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
              itemCount: 5, 
              itemBuilder: (context, index) {
                return ShimmerCardInprogressOrders(); 
              },
            );
          } else if (controller.inprogressOrder.isEmpty) {
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
              itemCount: controller.inprogressOrder.length,
              itemBuilder: (context, index) {
                DateTime date = DateTime.parse(
                    controller.inprogressOrder[index]["pickup_date"]);
                String formattedPrice = NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'Rp ',
                  decimalDigits: 0,
                ).format(controller.inprogressOrder[index]["total_price"]);
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.ORDERDETAIL,
                      arguments:
                          controller.inprogressOrder[index]["id"].toString(),
                    );
                  },
                  child: Container(
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
                    child: CardInprogressOrders(
                      orderType: controller.inprogressOrder[index]
                          ["order_type"],
                      date: date,
                      totalPrice: formattedPrice,
                    ),
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
