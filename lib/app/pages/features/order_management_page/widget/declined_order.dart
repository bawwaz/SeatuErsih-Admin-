import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_controller.dart';

class CardDeclined extends GetView<OrderManagementController> {
  const CardDeclined({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Declined Orders',
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.040,
            fontWeight: FontWeight.bold,
            color: Color(0xffE75060),
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
                  '${controller.declinedOrder.length}',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            SvgPicture.asset("assets/svg/decline.svg")
          ],
        ),
      ],
    );
  }
}
