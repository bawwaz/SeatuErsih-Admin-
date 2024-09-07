import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/edit_product_page/edit_product_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/edit_product_page/widget/dropdown_order_type.dart';
import 'package:seatu_ersih_admin/app/pages/features/edit_product_page/widget/floating_button.dart';
import 'package:seatu_ersih_admin/app/pages/features/edit_product_page/widget/textfield_edit_desc.dart';
import 'package:seatu_ersih_admin/app/pages/features/edit_product_page/widget/textfield_edit_price.dart';

class EditProductView extends GetView<EditProductController> {
  const EditProductView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final headingFontSize = screenWidth * 0.045;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            'assets/img/angle-circle-right 1.png',
            width: screenWidth * 0.07,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Edit Produk',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: headingFontSize,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Deskripsi Produk',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 13),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 3,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: TextFieldEditDesc(),
            ),
            SizedBox(height: 25),
            Text(
              'Edit Harga Produk',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 13),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 3,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: TextFieldEditPrice(),
            ),
            SizedBox(height: 25),
            Text(
              'Pilih Tipe Produk',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 13),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: DropdownChoseOrder(),
            ),
          ],
        ),
      ),
      floatingActionButton: Positioned(
        bottom: 20,
        left: 20,
        right: 20,
        child: FLoatingButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
