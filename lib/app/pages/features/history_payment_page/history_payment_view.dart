import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/history_payment_page/history_payment_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/history_payment_page/widget/card_payment_history.dart';
import 'package:seatu_ersih_admin/app/pages/features/history_payment_page/widget/shimmer_payment_history.dart';
import 'package:shimmer/shimmer.dart';

class HistoryPaymentView extends GetView<HistoryPaymentController> {
  const HistoryPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/img/angle-circle-right 1.png'),
        ),
        centerTitle: true,
        title: Text(
          'History Payment',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () {
                if (controller.isLoading.value) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6, 
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: ShimmerPaymentHistory(),
                      );
                    },
                  );
                } else if (controller.history.isEmpty) {
                  return Center(
                    child: Text(
                      "Tidak Ada Data Pembayaran",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.history.length,
                    itemBuilder: (context, index) {
                      final historyItem = controller.history[index];
                      final user = historyItem['user'];

                      return PaymentHistory(
                        name: user['username'],
                        orderDate: DateTime.parse(historyItem['order_date']),
                        orderType: historyItem['order_type'],
                        price: historyItem['total_price'].toString(),
                        profilePictureUrl: user['profile_picture'],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
