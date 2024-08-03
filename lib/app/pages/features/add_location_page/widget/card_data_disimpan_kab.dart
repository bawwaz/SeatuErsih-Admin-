import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_location_page/add_location_controller.dart';

class CardDataKab extends StatelessWidget {
  const CardDataKab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AddLocationController controller = Get.find();

    return Obx(() {
      return ListView.builder(
        itemCount: controller.kabupaten_name.length,
        itemBuilder: (context, index) {
          final kabupaten = controller.kabupaten_name[index];
          return Card(
            child: ListTile(
              title: Text(
                kabupaten['kabupaten'],
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
