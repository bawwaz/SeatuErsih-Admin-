import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/global_component/navbar/btmnavcontroller.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/HomepageView.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/product_review_view.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationController controller = Get.find();

    // Check if there are arguments passed to set the initial tab index
    int initialIndex = Get.arguments ?? 0;
    controller.currentIndex.value = initialIndex;

    final List<Widget> pages = [
      HomePage(),
      ProductReviewView(),
      OrderManagementView(),
    ];

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor: Colors.white,
          backgroundColor: Color(0XFF7ec1eb),
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.reviews_outlined), label: 'Product Review'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_laundry_service),
                label: 'Order Management'),
          ],
        ),
      ),
    );
  }
}
