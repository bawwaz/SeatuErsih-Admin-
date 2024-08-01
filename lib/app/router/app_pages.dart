import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:seatu_ersih_admin/app/global_component/navbar/navbar.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/HomepageBinding.dart';
import 'package:seatu_ersih_admin/app/pages/features/home_page/HomepageView.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/order_detail_binding.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_detail_page/order_detail_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_binding.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_management_page/order_management_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_pending_page/order_status_pending_binding.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_pending_page/order_status_pending_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_deep_page/product_review_deep_binding.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_deep_page/product_review_deep_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_reg_page/product_review_reg_binding.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_reg_page/product_review_reg_view.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/LoginpageView.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/login_binding.dart';
import 'package:seatu_ersih_admin/draft/order_list_page/order_list_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/order_request_binding.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_request_page/order_request_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_completed_page/order_status_completed_binding.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_completed_page/order_status_completed_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_declined_page/order_status_declined_binding.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_declined_page/order_status_declined_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_inprogress_page/order_status_inprogress_binding.dart';
import 'package:seatu_ersih_admin/app/pages/features/order_status_inprogress_page/order_status_inprogress_view.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/product_review_binding.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/product_review_view.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/register_page/RegisterviewPage.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/register_page/register_binding.dart';

part 'routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL = Routes.ORDERDETAIL;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: homePageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.BTMNAVBAR,
      page: () => BottomNavBar(),
      bindings: [
        homePageBinding(),
        ProductReviewBinding(),
        OrderManagementBinding(),
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ORDERMANAGEMENT,
      page: () => OrderManagementView(),
      binding: OrderManagementBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ORDERDETAIL,
      page: () => OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: Routes.PRODUCTREVIEW,
      page: () => ProductReviewView(),
      binding: ProductReviewBinding(),
    ),
    GetPage(
      name: Routes.ORDERSTATUSPENDING,
      page: () => OrderStatusPendingView(),
      binding: OrderStatusPendingBinding(),
    ),
    GetPage(
      name: Routes.ORDERSTATUSINPROGRESS,
      page: () => OrderStatusInprogressView(),
      binding: OrderStatusInprogressBinding(),
    ),
    GetPage(
      name: Routes.ORDERSTATUSDECLINED,
      page: () => OrderStatusDeclinedView(),
      binding: OrderStatusDeclinedBinding(),
    ),
    GetPage(
      name: Routes.ORDERSTATUSCOMPLETED,
      page: () => OrderStatusCompletedView(),
      binding: OrderStatusCompletedBinding(),
    ),
    GetPage(
      name: Routes.ORDERREQUEST,
      page: () => OrderRequestView(),
      binding: OrderRequestBinding(),
    ),
    GetPage(
      name: Routes.PRODUCTREVIEWREG,
      page: () => ProductReviewRegView(),
      binding: ProductReviewRegBinding(),
    ),
    GetPage(
      name: Routes.PRODUCTREVIEWDEEP,
      page: () => ProductReviewDeepView(),
      binding: ProductReviewDeepBinding(),
    ),
  ];
}
