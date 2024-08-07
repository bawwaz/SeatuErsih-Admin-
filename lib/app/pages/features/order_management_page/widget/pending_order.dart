import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_controller.dart';

class CardPending extends GetView<OrderManagementController> {
  const CardPending({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pending Orders',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xffFE9705),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Obx(
          () {
            return Text(
              '${controller.pendingOrder.length}',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
        // Text(
        //   '10 more than last week',
        //   style: GoogleFonts.poppins(
        //     fontSize: 15,
        //     color: Colors.black,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ],
    );
  }
}
