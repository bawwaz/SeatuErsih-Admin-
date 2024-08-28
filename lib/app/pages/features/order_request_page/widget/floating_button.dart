import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/order_request_controller.dart';

class FloatingButton extends GetView<OrderRequestController> {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(10),
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
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(right: 8),
                child: FloatingActionButton.extended(
                  heroTag: null,
                  onPressed: controller.isAcceptButtonLoading.value
                      ? null
                      : () async {
                          controller.isAcceptButtonLoading.value = true;
                          await controller.postUpdateStatus('waiting_for_payment');
                          controller.isAcceptButtonLoading.value = false;
                        },
                  backgroundColor: const Color(0xff7EC1EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  label: controller.isAcceptButtonLoading.value
                      ? LoadingAnimationWidget.horizontalRotatingDots(
                          color: Colors.white,
                          size: 24,
                        )
                      : Text(
                          'Accept',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(left: 8),
                child: FloatingActionButton.extended(
                  onPressed: controller.isDeclineButtonLoading.value ||
                          !controller.isDeclineButtonEnabled.value
                      ? null
                      : () async {
                          controller.isDeclineButtonLoading.value = true;
                          await controller.postDeclineNote();
                          controller.isDeclineButtonLoading.value = false;
                        },
                  backgroundColor: controller.isDeclineButtonEnabled.value
                      ? const Color(0xffEB4335)
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  label: controller.isDeclineButtonLoading.value
                      ? LoadingAnimationWidget.horizontalRotatingDots(
                          color: Colors.white,
                          size: 24,
                        )
                      : Text(
                          'Decline',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
