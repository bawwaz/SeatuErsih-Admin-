import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/profile_page/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/img/angle-circle-right 1.png'),
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 130,
                height: 130,
                child: Image.asset(
                  "assets/img/profile-icon.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nama Penjual',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                alignment: Alignment.centerLeft,
                child: Obx(
                  () {
                    return Text(
                      '${controller.username.value}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8a8a8a8),
                        fontSize: 14,
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffEB4335),
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: controller.isLoading.value ? null : () => controller.logout(),
            child: controller.isLoading.value
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Text(
                    'Logout',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
