import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/edit_product_page/edit_product_controller.dart';

class TextFieldEditPrice extends GetView<EditProductController> {
  const TextFieldEditPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller.priceController,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        hintText: 'Tambahkan disini...',
        hintStyle: GoogleFonts.poppins(
          color: Color(0xff8a8a8a),
          fontSize: 13,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
