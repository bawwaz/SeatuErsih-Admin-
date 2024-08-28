import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/global_component/navbar/btmnavcontroller.dart';
import 'package:seatu_ersih_admin/app/pages/features/history_payment_page/history_payment_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/history_payment_page/history_payment_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/HomepageController.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/HomepageView.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final BottomNavigationController navController = Get.find();
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _buildPage(navController.currentIndex.value),
        );
      }),
      bottomNavigationBar: Obx(() {
        final BottomNavigationController navController = Get.find();
        return BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: (index) {
            navController.currentIndex.value = index;
          },
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF7EC1EB),
          unselectedItemColor: Color(0xFF607D8B),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/home.svg',
                height: navController.currentIndex.value == 0 ? 28.0 : 24.0,
                color: navController.currentIndex.value == 0
                    ? Color(0xFF7EC1EB)
                    : Color(0xFF607D8B),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/history.svg',
                height: navController.currentIndex.value == 1 ? 28.0 : 24.0,
                color: navController.currentIndex.value == 1
                    ? Color(0xFF7EC1EB)
                    : Color(0xFF607D8B),
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/manage.svg',
                height: navController.currentIndex.value == 2 ? 28.0 : 24.0,
                color: navController.currentIndex.value == 2
                    ? Color(0xFF7EC1EB)
                    : Color(0xFF607D8B),
              ),
              label: 'Manage Order',
            ),
          ],
        );
      }),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        Get.put(homePageController(), permanent: true);
        return HomePage();
      case 1:
        Get.put(HistoryPaymentController(), permanent: true);
        return HistoryPaymentView();
      case 2:
        Get.put(OrderManagementController(), permanent: true);
        return OrderManagementView();
      default:
        return HomePage();
    }
  }
}
