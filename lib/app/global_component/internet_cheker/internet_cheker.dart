import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/global_component/internet_cheker/internet_cheker_controller.dart';

class InternetChecker extends GetView<InternetCheckerController> {
  final Widget child;

  InternetChecker({required this.child});
  @override
  Widget build(BuildContext context) {
    return GetX<InternetCheckerController>(
      init: InternetCheckerController(),
      builder: (controller) {
        return Stack(
          children: [
            child,
            if (controller.isConnected.value)
              Center(
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: SvgPicture.asset(
                          'assets/svg/internet2.svg',
                          width: 24,
                          height: 24,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 13),
                      Text(
                        'Tidak Ada Koneksi Internet',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
