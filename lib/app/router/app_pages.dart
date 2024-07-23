import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/HomepageBinding.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/HomepageView.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/order_detail_binding.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/order_detail_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_view.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/LoginpageView.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/login_binding.dart';
import 'package:seatu_ersih_admin/view/order_list_page/order_list_view.dart';

part 'routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: homePageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ORDERMANAGEMENT,
      page: () => OrderManagementView(),
      binding: orderStatusBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
        name: Routes.ORDERDETAIL,
        page: () => OrderDetailView(),
        binding: orderStatusBinding())
  ];
}
