import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_location_page/add_location_controller.dart';

class TextFieldAddKabupaten extends StatelessWidget {
  const TextFieldAddKabupaten({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AddLocationController controller = Get.put(AddLocationController());

    return TextField(
      controller: controller.kabupatenController,
      decoration: InputDecoration(
        hintText: 'Tambahkan disini...',
        hintStyle: GoogleFonts.poppins(
          color: Color(0xff8a8a8a),
          fontSize: 14,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}