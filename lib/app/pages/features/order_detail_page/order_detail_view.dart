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
            final userPhone = order['user']?['phone']?.toString() ??
                'No phone'; 

            return RefreshIndicator(
              backgroundColor: Colors.white,
              color: Color(0xff7EC1EB),
              onRefresh: controller.refreshOrders,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
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
                        kabName: order['kabupaten'] ?? 'No Kabupaten',
                        kecName: order['kecamatan'] ?? 'No Kecamatan',
                        address: order['detail_address'] ?? 'No address',
                        phone: userPhone,
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
                    cusItem.isEmpty
                        ? Container(
                            width: double.infinity,
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
                            child: Text(
                              'Customer Belum Menambahkan Sepatu',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8a8a8a),
                                fontSize: screenWidth * 0.033,
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: cusItem.length,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            itemBuilder: (context, index) {
                              return Container(
                                width: double.infinity,
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
                                  brand: cusItem[index]['brand'] != null
                                      ? cusItem[index]['brand'].toString()
                                      : 'No brand',
                                  addons: cusItem[index]['addons'] != null
                                      ? cusItem[index]['addons'].toString()
                                      : 'No addons',
                                  notes: cusItem[index]['notes'] != null
                                      ? cusItem[index]['notes'].toString()
                                      : 'No note',
                                ),
                              );
                            },
                          ),
                    SizedBox(
                      height: 90,
                    )
                  ],
                ),
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
