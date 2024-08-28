import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
      child: Obx(
        () => FloatingActionButton.extended(
          onPressed: controller.isLoading.value
              ? null
              : () async {
                  controller.isLoading.value = true;
                  await controller.postBrand();
                  controller.isLoading.value = false;
                  // Uncomment and implement below logic based on the success of postBrand
                  // if (success) {
                  //   Get.snackbar('Success', 'Brand added successfully');
                  //   controller.brand_name.add(controller.brand.value);
                  //   controller.brand.value = '';
                  // } else {
                  //   Get.snackbar('Error', 'Failed to add brand');
                  // }
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
