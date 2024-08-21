import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_coupon_page/add_coupon_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_coupon_page/widget/coupon_widget.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_coupon_page/widget/coupon_widget_disimpan.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_coupon_page/widget/floating_button_add_coupon.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_coupon_page/widget/textfield_date_lifetime_coupon.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_coupon_page/widget/textfield_desc_coupon.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_coupon_page/widget/textfield_perentase_coupon.dart';

class AddCouponView extends GetView<AddCouponController> {
  const AddCouponView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final headingFontSize = screenWidth * 0.045;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            'Tambah Coupon',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: headingFontSize,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Color(0xff8a8a8a),
            indicatorColor: Color(0xff7EC1EB),
            tabs: [
              Tab(text: 'Tambah Coupon'),
              Tab(text: 'Disimpan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Persentase coupon',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 8),
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
                        child: TextFieldPersentaseCoupon(),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Deskripsi coupon',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 8),
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
                        child: TextFieldDescCoupon(),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Lifetime coupon',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 8),
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
                        child: TextFieldDateLifetime(controller: controller),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Gambar coupon',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 12),
                      Center(
                        child: Coupon(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: FloatingButtonAddCoupon(),
                ),
              ],
            ),
            SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: CouponDisimpan(
                        percent: '10%',
                        description: 'Promo Hari Raya',
                        expiredDate: DateFormat('dd MMMM yyyy')
                            .format(DateTime.now())
                            .toString(),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
