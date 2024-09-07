import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:seatu_ersih_admin/app/pages/features/edit_product_page/edit_product_controller.dart';

class FLoatingButton extends GetView<EditProductController> {
  const FLoatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.9,
      child: Obx(
        () => FloatingActionButton.extended(
          onPressed: controller.isLoading.value
              ? null
              : () async {
                  await controller.postEditProduct();
                },
          label: controller.isLoading.value
              ? LoadingAnimationWidget.horizontalRotatingDots(
                  color: Colors.white,
                  size: 24,
                )
              : Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
          backgroundColor: const Color(0xff7EC1EB),
        ),
      ),
    );
  }
}
