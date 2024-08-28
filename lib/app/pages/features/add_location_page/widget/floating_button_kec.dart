import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
      child: Obx(
        () => FloatingActionButton.extended(
          onPressed: controller.isLoading.value
              ? null
              : () async {
                  if (controller.selectedKabupatenId.value == 0) {
                    Get.snackbar('Error', 'Pilih kabupaten terlebih dahulu.');
                    return;
                  }
                  controller.isLoading.value = true;
                  await controller.postKecamatan();
                  await controller.getAllKabupaten();
                  await controller.getAllKecamatan();
                  controller.kecamatanController.clear();
                  controller.selectedKabupatenId.value = 0;
                  controller.isLoading.value = false;
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
