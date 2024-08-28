import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_shoes_brand_page/add_shoes_brand_controller.dart';

class TextfieldAddBrandShoes extends StatelessWidget {
  const TextfieldAddBrandShoes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AddShoesBrandController controller =
        Get.put(AddShoesBrandController());

    return Form(
      key: controller.brandKey,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Tidak boleh kosong';
          }
          bool exists = controller.brand_name.any((element) =>
              element['brand'].toString().toLowerCase() == value.toLowerCase());
          if (exists) {
            return 'Nama Sepatu sudah ada';
          }
          return null;
        },
        controller: controller.brandController,
        decoration: InputDecoration(
          hintText: 'Tambahkan disini...',
          hintStyle: GoogleFonts.poppins(
            color: Color(0xff8a8a8a),
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
