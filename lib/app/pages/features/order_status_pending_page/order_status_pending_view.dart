import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_pending_page/order_status_pending_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_pending_page/widget/card_pending_orders.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_pending_page/widget/shimmer_card_pending_orders.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class OrderStatusPendingView extends GetView<OrderStatusPendingController> {
  const OrderStatusPendingView({super.key});

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
          'Pending Order',
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
          await controller.getPendingOrder();
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
              var sortedOrders = controller.pendingOrder
                ..sort((a, b) {
                  DateTime dateA = DateTime.parse(a["pickup_date"]);
                  DateTime dateB = DateTime.parse(b["pickup_date"]);
                  return dateA.compareTo(dateB);
                });

              return ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: sortedOrders.length,
                physics: AlwaysScrollableScrollPhysics(),
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
                      Get.toNamed(Routes.ORDERREQUEST,
                          arguments: sortedOrders[index]["id"].toString());
                    },
                    child: CardPendingOrders(
                      orderType: sortedOrders[index]["order_type"],
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
