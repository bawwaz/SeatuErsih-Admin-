import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/global_component/navbar/btmnavcontroller.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/HomepageController.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/HomepageView.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/product_review_controller.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/product_review_view.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final BottomNavigationController navController = Get.find();
        switch (navController.currentIndex.value) {
          case 0:
            Get.lazyPut<homePageController>(
                () => homePageController()); // Inisialisasi disini

            return HomePage();
          case 1:
            Get.lazyPut<ProductReviewController>(
                () => ProductReviewController()); // Inisialisasi disini

            return ProductReviewView();
          case 2:
            Get.lazyPut<OrderManagementController>(
                () => OrderManagementController()); // Inisialisasi disini

            return OrderManagementView(); // Pastikan Binding diaplikasikan di sini jika diperlukan
          default:
            return HomePage();
        }
      }),
      bottomNavigationBar: Obx(() {
        final BottomNavigationController navController = Get.find();
        return BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: (index) {
            navController.currentIndex.value = index;
            if (index == 2) {
              Get.put(
                  ProductReviewController()); // Inisialisasi ulang controller
            }
          },
          backgroundColor: Color(0xFF7EC1EB), // Set color here
          selectedItemColor: Colors.white, // Color for selected item
          unselectedItemColor: Colors.white, // Color for unselected items
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_half),
              label: 'Product Review',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service),
              label: 'Order Management',
            ),
          ],
        );
      }),
    );
  }
}
