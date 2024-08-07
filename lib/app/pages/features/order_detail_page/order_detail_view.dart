import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/order_detail_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/widget/card_contact.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/widget/card_order.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/widget/floating_button.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/widget/shimmer_card_contact.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/widget/shimmer_card_order.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderDetailController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/img/angle-circle-right 1.png'),
        ),
        centerTitle: true,
        title: Text(
          'Order Detail',
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
            return SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerCardOrderDetail(), // Shimmer for Order section
                  SizedBox(height: 15),
                  ShimmerCardContactDetail(), // Shimmer for Contact section
                ],
              ),
            );
          } else {
            final order = controller.orderDetail;
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
                    child: CardOrderDetail(
                      product: order['order_type'] ?? 'No order',
                      date: DateTime.parse(order['pickup_date']),
                      note: order['notes'] ?? 'No note',
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
                    child: CardContactDetail(
                      address: order['detail_address'] ?? '',
                      phone: order['phone'] ?? '',
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingButtonDetail(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
