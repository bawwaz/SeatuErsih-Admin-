import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/order_request_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/card_contact.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/card_customer.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/card_customer_item.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/card_note.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/card_order.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/floating_button.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/shimmer_card_contact.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/shimmer_card_customer.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/shimmer_card_note.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/widget/shimmer_card_order.dart';

class OrderRequestView extends GetView<OrderRequestController> {
  const OrderRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final horizontalPadding = screenWidth * 0.05;
    final headingFontSize = screenWidth * 0.045;
    final subheadingFontSize = screenWidth * 0.035;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/img/angle-circle-right 1.png'),
        ),
        centerTitle: true,
        title: Text(
          'Order Request',
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
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerCardOrder(),
                  SizedBox(height: 15),
                  ShimmerCardContact(),
                  SizedBox(height: 15),
                  ShimmerCardCustomer(),
                  SizedBox(height: 15),
                  ShimmerCardNote(),
                ],
              ),
            );
          }

          if (controller.detailOrder.isEmpty) {
            return Center(child: Text('No order details available'));
          }

          return RefreshIndicator(
            backgroundColor: Colors.white,
            color: Color(0xff7EC1EB),
            onRefresh: controller.refreshOrders,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
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
                    child: CardOrder(
                      product: controller.detailOrder["order_type"] ?? 'N/A',
                      note: controller.detailOrder["notes"] ?? 'No notes',
                      date: controller.detailOrder["pickup_date"] != null
                          ? DateTime.parse(
                              controller.detailOrder["pickup_date"])
                          : DateTime.now(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Address',
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
                    child: CardContact(
                      kabName:
                          controller.detailOrder['kabupaten'] ?? 'No Kabupaten',
                      kecName:
                          controller.detailOrder['kecamatan'] ?? 'No Kecamatan',
                      address: controller.detailOrder["detail_address"] ??
                          'No address',
                      // phone: controller.detailOrder["phone"] ?? 'No phone',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Customer',
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
                    child: CardCustomer(
                      username: controller.detailOrder["user"]["username"] ??
                          'No username',
                      email:
                          controller.detailOrder["user"]["email"] ?? 'No email',
                      phone:
                          controller.detailOrder["user"]["phone"] ?? 'No phone',
                      profile: controller.detailOrder["user"]
                              ["profile_picture"] ??
                          'No Photo',
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
                  SizedBox(height: 5),
                  controller.customerItem.isEmpty
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
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.customerItem.length,
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
                              child: CardCustomerItemPending(
                                brand: controller.customerItem[index]
                                            ['brand'] !=
                                        null
                                    ? controller.customerItem[index]['brand']
                                        .toString()
                                    : 'No brand',
                                addons: controller.customerItem[index]
                                            ['addons'] !=
                                        null
                                    ? controller.customerItem[index]['addons']
                                        .toString()
                                    : 'No addons',
                                notes: controller.customerItem[index]
                                            ['notes'] !=
                                        null
                                    ? controller.customerItem[index]['notes']
                                        .toString()
                                    : 'No note',
                              ),
                            );
                          },
                        ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Beri alasan',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: subheadingFontSize,
                        ),
                      ),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          '(jika ingin membatalkan pesanan)',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff8a8a8a),
                            fontSize: screenWidth * 0.030,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: CardNote(),
                  ),
                  SizedBox(height: 120),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
