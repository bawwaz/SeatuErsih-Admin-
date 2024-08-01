import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_pending_page/widget/card_pending_orders.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class OrderStatusPendingView extends StatelessWidget {
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
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(Routes.ORDERREQUEST);
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
              child: CardPendingOrders(),
            ),
          );
        },
      ),
    );
  }
}
