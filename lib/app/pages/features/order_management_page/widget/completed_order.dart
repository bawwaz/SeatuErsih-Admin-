import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_controller.dart';

class CardCompleted extends GetView<OrderManagementController> {
  const CardCompleted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Completed Orders',
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.040,
            fontWeight: FontWeight.bold,
            color: Color(0xff3AC430),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () {
                return Text(
                  '${controller.completedOrder.length}',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            SvgPicture.asset("assets/svg/completed.svg")
          ],
        ),
      ],
    );
  }
}
