import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/order_detail_controller.dart';

class FloatingButtonDetail extends GetView<OrderDetailController> {
  const FloatingButtonDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Obx(
              () => FloatingActionButton.extended(
                heroTag: null,
                onPressed: controller.isCompleteButtonLoading.value
                    ? null
                    : () async {
                        controller.isCompleteButtonLoading.value = true;
                        await controller.postUpdateStatus("completed");
                        controller.isCompleteButtonLoading.value = false;
                      },
                backgroundColor: const Color(0xff7EC1EB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                label: controller.isCompleteButtonLoading.value
                    ? LoadingAnimationWidget.horizontalRotatingDots(
                        color: Colors.white,
                        size: 24,
                      )
                    : Text(
                        'Complete',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
