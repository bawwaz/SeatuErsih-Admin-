import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/HomepageController.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/widget/HomepageBody.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class HomePage extends GetView<homePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF7EC1EB),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image(image: AssetImage('assets/img/icon.png')),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, left: 14),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PROFILE);
                    },
                    child: Image(
                      image: AssetImage('assets/img/user-icon.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Color(0xff7EC1EB),
        onRefresh: () async {
          return await controller.getAllCustomers();
        },
        child: SafeArea(
          child: HomeBody(),
        ),
      ),
    );
  }
}
