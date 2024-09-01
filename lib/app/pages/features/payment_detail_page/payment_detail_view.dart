import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/payment_detail_page/payment_detail_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/payment_detail_page/widget/card_detail.dart';
import 'package:seatu_ersih_admin/app/pages/features/payment_detail_page/widget/card_pembayaran.dart';
import 'package:seatu_ersih_admin/app/pages/features/payment_detail_page/widget/shimmer.dart';

class PaymentDetailView extends GetView<PaymentDetailController> {
  const PaymentDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final headingFontSize = screenWidth * 0.045;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            'assets/img/angle-circle-right 1.png',
            width: screenWidth * 0.07,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Payment Detail',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: headingFontSize,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return ShimmerLoading(screenWidth: screenWidth);
        } else if (controller.transactionDetail.isEmpty) {
          return Center(
            child: Text(
              'Tidak Ada Transaksi',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          );
        } else {
          return RefreshIndicator(
            backgroundColor: Colors.white,
            color: Color(0xff7EC1EB),
            onRefresh: () async {
              return await controller.getTransactionDetail();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 2,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: CardPembayaran(
                        totalPay:
                            controller.transactionDetail['amount'].toString(),
                        status:
                            controller.transactionDetail['status'].toString(),
                        orderDate: DateTime.parse(
                            controller.transactionDetail['paid_at']),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Detail',
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
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: CardDetail(
                      desc: controller.transactionDetail['description']
                          .toString(),
                      paymethod: controller.transactionDetail['payment_channel']
                          .toString(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
