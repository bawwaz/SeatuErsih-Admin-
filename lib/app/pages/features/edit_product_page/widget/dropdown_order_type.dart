import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/edit_product_page/edit_product_controller.dart';

class DropdownChoseOrder extends GetView<EditProductController> {
  const DropdownChoseOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(
              'Pilih Tipe Order...',
              style: GoogleFonts.poppins(
                color: Color(0xff8a8a8a),
                fontSize: 14,
              ),
            ),
            value: controller.selectedProduct.value.isEmpty
                ? null
                : controller.selectedProduct.value,
            items: controller.orderNames.map((kabupaten) {
              return DropdownMenuItem<String>(
                value: kabupaten,
                child: Text(
                  kabupaten,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              controller.setSelectedProduct(value!);
            },
            icon: Icon(
              Icons.arrow_drop_down,
              color: Color(0xff8a8a8a),
            ),
            dropdownColor: Colors.white,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}