import 'package:get/get.dart';
import 'package:seatu_ersih_admin/view/edit_banner_page/edit_banner_view.dart';
import 'package:seatu_ersih_admin/view/edit_card_page/edit_card_view.dart';
import 'package:seatu_ersih_admin/view/home_page/HomepageView.dart';
import 'package:seatu_ersih_admin/view/login_page/LoginpageView.dart';
import 'package:seatu_ersih_admin/view/order_detail_page/order_detail_view.dart';
import 'package:seatu_ersih_admin/view/order_list_page/order_list_view.dart';
import 'package:seatu_ersih_admin/view/order_management_page/order_management_view.dart';
import 'package:seatu_ersih_admin/view/order_request_page/order_request_view.dart';
import 'package:seatu_ersih_admin/view/order_status_inprogress/order_status_inprogress_view.dart';
import 'package:seatu_ersih_admin/view/register_page/RegisterviewPage.dart';

class Routes {
  static String homepage = '/home';
  static String login = '/login';
  static String register = '/register';
  static String editbanner = '/editbanner';
  static String editcard = '/editcard';
  static String orderlist = '/orderlist';
  static String orderdetail = '/orderdetail';
  static String ordermanagement = '/ordermanagement';
  static String orderrequest = '/orderrequest';
  static String orderstatusinprogress = '/orderstatusinprogress';

  static List<GetPage> pages = [
    GetPage(name: homepage, page: () => HomePage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: register, page: () => RegisterPage()),
    GetPage(name: editbanner, page: () => EditBannerView()),
    GetPage(name: editcard, page: () => EditCardView()),
    GetPage(name: orderlist, page: () => OrderListView()),
    GetPage(name: orderdetail, page: () => OrderDetailView()),
    GetPage(name: ordermanagement, page: () => OrderManagementView()),
    GetPage(name: orderrequest, page: () => OrderRequestView()),
    GetPage(name: orderstatusinprogress, page: () => OrderStatusInprogressView()),
  ];
}