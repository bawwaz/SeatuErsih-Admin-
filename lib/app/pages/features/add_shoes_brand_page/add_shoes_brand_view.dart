import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_shoes_brand_page/add_shoes_brand_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_shoes_brand_page/widget/floating_button_add_brand.dart';
import 'package:seatu_ersih_admin/app/pages/features/add_shoes_brand_page/widget/textfield_add_brand_shoes.dart';

class AddShoesBrandView extends StatelessWidget {
  const AddShoesBrandView({super.key});

  @override
  Widget build(BuildContext context) {
    final AddShoesBrandController controller =
        Get.put(AddShoesBrandController());

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
            'Tambah Sepatu',
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
              Tab(text: 'Tambah Sepatu'),
              Tab(text: 'Disimpan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tambah Brand/Nama Sepatu',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 12,
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
                          child: TextfieldAddBrandShoes(),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: FloatingButtonAddBrand(),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sepatu yang Ditambahkan:',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: controller.searchController,
                      decoration: InputDecoration(
                        hintText: 'Cari Sepatu...',
                        hintStyle: GoogleFonts.poppins(
                            color: Color(0xff8a8a8a8),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xff8a8a8a),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF8a8a8a),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff7EC1EB),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Obx(
                      () {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: controller.filteredBrands.map(
                            (brand) {
                              return Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 16),
                                padding: EdgeInsets.all(16),
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${brand['brand']}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'Di order: ${brand['count']}x',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
