import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_location_page/add_location_controller.dart';

class TextFieldAddKecamatan extends StatelessWidget {
  const TextFieldAddKecamatan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AddLocationController controller = Get.put(AddLocationController());

    return Form(
      key: controller.KecamatanKey,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Nama kecamatan tidak boleh kosong';
          }
          bool exists = controller.kecamatan_name.any((element) =>
              element['kecamatan'].toString().toLowerCase() ==
              value.toLowerCase());
          if (exists) {
            return 'Nama kecamatan sudah ada';
          }
          return null;
        },
        controller: controller.kecamatanController,
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
