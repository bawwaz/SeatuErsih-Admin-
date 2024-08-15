import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_location_page/add_location_controller.dart';

class FloatingButtonKec extends StatelessWidget {
  const FloatingButtonKec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AddLocationController controller = Get.find();

    return SizedBox(
      width: double.infinity,
      child: FloatingActionButton.extended(
        onPressed: () async {
          if (controller.selectedKabupatenId.value == 0) {
            Get.snackbar('Error', 'Pilih kabupaten terlebih dahulu.');
            return;
          }
          await controller.postKecamatan();
          await controller.getAllKabupaten();
          await controller.getAllKecamatan();
          controller.kecamatanController.clear();
          controller.selectedKabupatenId.value = 0; 
        },
        label: Text(
          'Simpan',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        backgroundColor: Color(0xff7EC1EB),
      ),
    );
  }
}
