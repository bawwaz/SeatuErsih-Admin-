import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_location_page/add_location_controller.dart';

class CardDataKec extends StatelessWidget {
  const CardDataKec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AddLocationController controller = Get.find();

    return Obx(() {
      return ListView.builder(
        itemCount: controller.kecamatan_name.length,
        itemBuilder: (context, index) {
          final kecamatan = controller.kecamatan_name[index];
          return Card(
            child: ListTile(
              title: Text(
                kecamatan['kecamatan'],
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
