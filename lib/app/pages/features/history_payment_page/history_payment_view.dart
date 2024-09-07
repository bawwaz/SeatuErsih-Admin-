import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/history_payment_page/history_payment_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/history_payment_page/widget/card_payment_history.dart';
import 'package:seatu_ersih_admin/app/pages/features/history_payment_page/widget/shimmer_payment_history.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';
import 'package:shimmer/shimmer.dart';

class HistoryPaymentView extends GetView<HistoryPaymentController> {
  const HistoryPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final headingFontSize = screenWidth * 0.045;

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Color(0xff7EC1EB),
        onRefresh: () async {
          return await controller.getAllHistory();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Payment History',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: headingFontSize,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  Obx(() {
                    return InkWell(
                        onTap: controller.history.isEmpty
                            ? () {
                                controller.showCustomSnackbar("Gagal",
                                    "Data kosong. Tidak bisa diekspor.",
                                    isError: true);
                              }
                            : () {
                                controller.exportToExcel();
                              },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[50],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Export to Excel',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: controller.history.isEmpty
                                      ? Colors.grey
                                      : Colors.green[700],
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 8),
                              SvgPicture.asset(
                                "assets/svg/excel.svg",
                              ),
                            ],
                          ),
                        ));
                  }),
                ],
              ),
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
                    return ListView(
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Container(
                          height: 500,
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
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.history.length,
                      itemBuilder: (context, index) {
                        final historyItem = controller.history[index];

                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PAYMENTDETAIL,
                                arguments: historyItem['order_id']);
                          },
                          child: PaymentHistory(
                            paymentChannel: historyItem['payment_channel']?? 'Unknown',
                            orderDate: DateTime.parse(historyItem['paid_at']),
                            orderType: historyItem['order_type'] ?? 'Unknown',
                            price: historyItem['amount']?.toString() ?? '0',
                            profilePictureUrl:
                                historyItem['payment_method_image'],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
