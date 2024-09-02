import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_wait_for_payment_page/widget/shimmer.dart';
import 'order_detail_wait_for_payment_controller.dart';
import 'widget/card_contact.dart';
import 'widget/card_order.dart';
import 'widget/card_customer_item.dart';

class OrderDetailWaitForPaymentView
    extends GetView<OrderDetailWaitForPaymentController> {
  const OrderDetailWaitForPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Color(0xff7EC1EB),
        onRefresh: controller.refreshOrders,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(20),
          child: Obx(() {
            if (controller.isLoading.value) {
              return ShimmerLoading(screenWidth: screenWidth);
            }

            return Column(
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
                  child: CardOrderWait(
                    product:
                        controller.orderDetail['order_type'] ?? 'No product',
                    note: controller.orderDetail['notes'] ?? 'No note',
                    date: DateTime.parse(
                        controller.orderDetail['pickup_date'] ??
                            DateTime.now().toString()),
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
                  child: CardContactWait(
                    kabName:
                        controller.orderDetail['kabupaten'] ?? 'No Kabupaten',
                    kecName:
                        controller.orderDetail['kecamatan'] ?? 'No Kecamatan',
                    address: controller.orderDetail['detail_address'] ??
                        'No address',
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
                SizedBox(height: 10),
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
                            child: CardCustomerItemWait(
                              brand: controller.customerItem[index]['brand'] !=
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
                              notes: controller.customerItem[index]['notes'] !=
                                      null
                                  ? controller.customerItem[index]['notes']
                                      .toString()
                                  : 'No note',
                            ),
                          );
                        },
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
