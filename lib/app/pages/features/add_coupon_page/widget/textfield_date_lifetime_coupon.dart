import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_coupon_page/add_coupon_controller.dart';


class TextFieldDateLifetime extends StatelessWidget {
  const TextFieldDateLifetime({
    super.key,
    required this.controller,
  });

  final AddCouponController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0),
          child: Icon(
            Icons.calendar_month,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Obx(
            () => TextField(
              controller: TextEditingController(
                text: controller.selectedDate.value,
              ),
              readOnly: true,
              onTap: () {
                controller.selectDate(context);
              },
              decoration: InputDecoration(
                hintText: 'Tambahkan tanggal expired...',
                hintStyle: GoogleFonts.poppins(
                  color: Color(0xff8a8a8a),
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


