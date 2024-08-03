import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_location_page/add_location_controller.dart';

class FloatingButtonKab extends StatelessWidget {
  const FloatingButtonKab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AddLocationController controller = Get.find();

    return SizedBox(
      width: double.infinity,
      child: FloatingActionButton.extended(
        onPressed: () async {
          await controller.postKabupaten();
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