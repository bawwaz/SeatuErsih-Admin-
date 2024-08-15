import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_location_page/add_location_controller.dart';

class DropDownPilihKabupaten extends StatelessWidget {
  const DropDownPilihKabupaten({super.key});

  @override
  Widget build(BuildContext context) {
    final AddLocationController controller = Get.find();

    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(
              'Pilih Kabupaten...',
              style: GoogleFonts.poppins(
                color: Color(0xff8a8a8a),
                fontSize: 14,
              ),
            ),
            value: controller.kabupaten_name
                    .firstWhereOrNull((kabupaten) => kabupaten['id'] == controller.selectedKabupatenId.value)?['kabupaten'] ??
                null,
            items: controller.kabupaten_name.map((kabupaten) {
              return DropdownMenuItem<String>(
                value: kabupaten['kabupaten'],
                child: Text(
                  kabupaten['kabupaten'],
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              );
            }).toList(),
            onChanged: (value) {
              final selectedKabupaten = controller.kabupaten_name.firstWhere((kabupaten) => kabupaten['kabupaten'] == value);
              controller.selectedKabupatenId.value = selectedKabupaten['id'];
            },
            icon: Icon(Icons.arrow_drop_down, color: Color(0xff8a8a8a)),
          ),
        ),
      ),
    );
  }
}
