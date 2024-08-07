import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/widget/HomepageBody.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class HomePage extends StatelessWidget {
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
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff545454),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, left: 14),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PROFILE);
                    },
                    child: Image(
                      image: AssetImage('assets/img/user.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: HomeBody(),
      ),
    );
  }
}
