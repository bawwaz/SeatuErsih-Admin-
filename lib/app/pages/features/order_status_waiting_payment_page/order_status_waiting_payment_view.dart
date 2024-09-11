import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_waiting_payment_page/order_status_waiting_payment_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_waiting_payment_page/widget/card_waiting_payment.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_waiting_payment_page/widget/shimmer_card_waiting_payment.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart'; // Import the shimmer widget

class OrderStatusWaitingPaymentView
    extends GetView<OrderStatusWaitingPaymentController> {
  const OrderStatusWaitingPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final headingFontSize = screenWidth * 0.045;
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
          'Waiting For Pay',
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
          return await controller.getWaitingPayment();
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
                    child: ShimmerCardWaitingPayment(),
                  );
                },
              );
            } else if (controller.waitingOrder.isEmpty) {
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
              var sortedOrders = controller.waitingOrder
                ..sort((a, b) {
                  DateTime dateA = DateTime.parse(a["pickup_date"]);
                  DateTime dateB = DateTime.parse(b["pickup_date"]);
                  return dateA.compareTo(dateB);
                });

              return ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: sortedOrders.length,
                itemBuilder: (context, index) {
                  DateTime date =
                      DateTime.parse(sortedOrders[index]["pickup_date"]);
                  String formattedPrice =
                      sortedOrders[index]["total_price"] == null
                          ? "Belum Ada Harga"
                          : NumberFormat.currency(
                              locale: 'id_ID',
                              symbol: 'Rp. ',
                              decimalDigits: 0,
                            ).format(int.parse(
                              sortedOrders[index]["total_price"].toString()));
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ORDERDETAILWAITFORPAY,
                          arguments: controller.waitingOrder[index]["id"]);
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
                      child: CardWaitingPayment(
                        orderType: controller.waitingOrder[index]["order_type"],
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
      ),
    );
  }
}
