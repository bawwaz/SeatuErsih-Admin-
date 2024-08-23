import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih_admin/app/global_component/navbar/btmnavcontroller.dart';
import 'package:seatu_ersih_admin/app/global_component/navbar/navbar.dart';

class OrderDetailController extends GetxController {
  final box = GetStorage();
  var token = ''.obs;
  var orderId = ''.obs;
  var orderDetail = <String, dynamic>{}.obs;
  var customerItem = <Map<String, dynamic>>[].obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
    orderId.value = Get.arguments;
    print(Get.arguments);
    getDetailOrder();
    getCustomerItem();
  }

  Future<void> refreshOrders() async {
    await getDetailOrder();
    await getCustomerItem();
  }

  Future<void> getDetailOrder() async {
    final url =
        'http://seatuersih.pradiptaahmad.tech/api/order/get/${orderId.value}';
    final headers = this.headers;

    isLoading.value = true;

    try {
      if (headers.isEmpty) {
        Get.snackbar('Error', 'No authentication token found.');
        return;
      }

      var response = await http.get(Uri.parse(url), headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is Map && decodedResponse.containsKey('data')) {
          orderDetail.value =
              Map<String, dynamic>.from(decodedResponse['data']);
        } else {
          Get.snackbar('Error', 'Unexpected response format');
        }
      } else {
        Get.snackbar('Error', 'Failed to retrieve data: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Exception occurred: $e');
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCustomerItem() async {
    final url =
        'http://seatuersih.pradiptaahmad.tech/api/shoe/getshoe/${orderId.value}';
    final headers = this.headers;

    isLoading.value = true;

    try {
      if (headers.isEmpty) {
        Get.snackbar('Error', 'No authentication token found.');
        return;
      }

      var response = await http.get(Uri.parse(url), headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is Map && decodedResponse.containsKey('data')) {
          customerItem.value =
              List<Map<String, dynamic>>.from(decodedResponse['data']);
        }
      } else {
        Get.snackbar('Error', 'Failed to retrieve data: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Exception occurred: $e');
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> postUpdateStatus(String orderStatus) async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/order/update';
    var data = {'id': Get.arguments, 'order_status': orderStatus};

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${box.read('token')}",
          "Content-Type": "application/json"
        },
        body: json.encode(data),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);

        if (orderStatus == "completed") {
          Get.offAll(() => BottomNavBar(), arguments: 2);
          final BottomNavigationController navController = Get.find();
          navController.currentIndex.value = 2;

          String snackbarMessage = orderStatus == "decline"
              ? 'Data berhasil diupdate dan silahkan cek didecline'
              : 'Data berhasil diupdate silahkan cek di in-progress';

          Get.snackbar(
            'Success',
            snackbarMessage,
            snackPosition: SnackPosition.TOP,
          );
        } else {
          Get.snackbar('Error', 'Unexpected order status: $orderStatus');
        }
      } else {
        Get.snackbar('Error', 'Failed to submit data: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Exception occurred: $e');
      print(e);
    }
  }

  Map<String, String> get headers {
    print('Retrieved Token: ${token.value}');
    return {
      "Accept": "application/json",
      "Authorization": "Bearer ${token.value}",
      "Content-Type": "application/json"
    };
  }
}
