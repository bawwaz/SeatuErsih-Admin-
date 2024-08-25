import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class homePageController extends GetxController {
  var customers = <Map<String, dynamic>>[].obs;
  var token = ''.obs;
  var box = GetStorage();
  var username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    username.value = box.read('username') ?? '';
    token.value = box.read('token') ?? '';
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
    getAllCustomers();
  }

  Future<void> getAllCustomers() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/users/all';
    final headers = this.headers;

    try {
      if (headers.isEmpty) {
        Get.snackbar('Error', 'No authentication token found.');
        return;
      }

      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is Map && decodedResponse.containsKey('users')) {
          customers.value =
              List<Map<String, dynamic>>.from(decodedResponse['users']);
        } else {
          Get.snackbar('Error', 'Unexpected response format');
        }
      } else {
        Get.snackbar('Error', 'Failed to retrieve data: ${response.body}');
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
