import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/order_request_controller.dart';

class FloatingButton extends GetView<OrderRequestController> {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 160,
          height: 50,
          child: FloatingActionButton.extended(
            heroTag: null,
            onPressed: () {
              controller.postUpdateStatus('in-progress');
            },
            backgroundColor: Color(0xff7EC1EB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            label: Text(
              'Accept',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
        Container(
          width: 160,
          height: 50,
          child: FloatingActionButton.extended(
            onPressed: () {
              controller.postUpdateStatus('decline');
            },
            backgroundColor: Color(0xffEB4335),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            label: Text(
              'Decline',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
