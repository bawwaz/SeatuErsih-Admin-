import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_pending_page/order_status_pending_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_pending_page/widget/card_pending_orders.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_pending_page/widget/shimmer_card_pending_orders.dart'; // Import the shimmer widget
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class OrderStatusPendingView extends GetView<OrderStatusPendingController> {
  const OrderStatusPendingView({super.key});

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
          'Pending Order',
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
          return await controller.getPendingOrder();
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
                    child: ShimmerCardPendingOrders(), 
                  );
                },
              );
            } else if (controller.pendingOrder.isEmpty) {
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
                itemCount: controller.pendingOrder.length,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  DateTime date = DateTime.parse(
                      controller.pendingOrder[index]["pickup_date"]);
                  String formattedPrice = NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(controller.pendingOrder[index]["total_price"]);
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ORDERREQUEST,
                          arguments:
                              controller.pendingOrder[index]["id"].toString());
                    },
                    child: CardPendingOrders(
                      orderType: controller.pendingOrder[index]["order_type"],
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
