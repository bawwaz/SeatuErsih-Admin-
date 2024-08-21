import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/order_detail_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/widget/card_contact.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/widget/card_customer_item.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/widget/card_order.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/widget/floating_button.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/widget/shimmer_card_contact.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/widget/shimmer_card_order.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderDetailController controller = Get.find();

    final screenWidth = MediaQuery.of(context).size.width;
    final headingFontSize = screenWidth * 0.045;

    return Scaffold(
      backgroundColor: Colors.white,
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
          'Order Detail',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: headingFontSize,
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
                  ShimmerCardOrderDetail(),
                  SizedBox(height: 15),
                  ShimmerCardContactDetail(),
                  SizedBox(height: 15),
                  ShimmerCardContactDetail(),
                ],
              ),
            );
          } else {
            final order = controller.orderDetail;
            final cusItem = controller.customerItem;
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
                      fontSize: screenWidth * 0.038,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.27,
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
                      product: order['order_type']?.toString() ?? 'No order',
                      date: order['pickup_date'] != null
                          ? DateTime.parse(order['pickup_date'])
                          : DateTime.now(),
                      note: order['notes']?.toString() ?? 'No note',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Contact',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: screenWidth * 0.038,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.19,
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
                      address:
                          order['detail_address']?.toString() ?? 'No address',
                      phone: order['phone']?.toString() ?? 'No phone',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Customer Item',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: screenWidth * 0.038,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.27,
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
                    child: CardCustomerItem(
                      brand: cusItem.isNotEmpty && cusItem[0]['brand'] != null
                          ? cusItem[0]['brand'].toString()
                          : 'No brand',
                      addons: cusItem.isNotEmpty && cusItem[0]['addons'] != null
                          ? cusItem[0]['addons'].toString()
                          : 'No addons',
                      notes: cusItem.isNotEmpty && cusItem[0]['notes'] != null
                          ? cusItem[0]['notes'].toString()
                          : 'No note',
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  )
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
