import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_shoes_brand_page/add_shoes_brand_controller.dart';

class FloatingButtonAddBrand extends StatelessWidget {
  const FloatingButtonAddBrand({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AddShoesBrandController controller = Get.find();

    return SizedBox(
      width: double.infinity,
      child: FloatingActionButton.extended(
        onPressed: () async {
          await controller.postBrand();
          // if (success) {
          //   Get.snackbar('Success', 'Brand added successfully');
          //   controller.brand_name.add(controller.brand.value); // Update the list of saved brands
          //   controller.brand.value = ''; // Clear the text field after saving
          // } else {
          //   Get.snackbar('Error', 'Failed to add brand');
          // }
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
