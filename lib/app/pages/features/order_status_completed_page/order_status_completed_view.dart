import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_completed_page/order_status_completed_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_completed_page/widget/card_completed_orders.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_completed_page/widget/shimmer_card_completed_orders.dart'; // Import the shimmer widget

class OrderStatusCompletedView extends GetView<OrderStatusCompletedController> {
  const OrderStatusCompletedView({super.key});

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
          'Completed Orders',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Color(0xff7EC1EB),
        onRefresh: () async {
          return await controller.getCompletedOrder();
        },
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ShimmerCardCompletedOrders(),
                  );
                },
              );
            } else if (controller.completedOrder.isEmpty) {
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
                itemCount: controller.completedOrder.length,
                itemBuilder: (context, index) {
                  DateTime date = DateTime.parse(
                      controller.completedOrder[index]["pickup_date"]);
                  String formattedPrice = NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(controller.completedOrder[index]["total_price"]);
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
                    child: CardCompletedOrders(
                      orderType: controller.completedOrder[index]["order_type"],
                      date: date,
                      totalPrice: formattedPrice,
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
