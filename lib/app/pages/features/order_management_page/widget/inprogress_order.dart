import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_controller.dart';

class CardInProgress extends GetView<OrderManagementController> {
  const CardInProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'In-progress Orders',
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.042,
            fontWeight: FontWeight.bold,
            color: Color(0xff7EC1EB),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Obx(
          () {
            return Text(
              '${controller.inprogressOrder.length}',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ],
    );
  }
}
