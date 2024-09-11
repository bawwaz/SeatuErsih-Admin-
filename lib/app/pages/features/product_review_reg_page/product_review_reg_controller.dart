import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seatu_ersih_admin/api/api_endpoint.dart';

class ProductReviewRegController extends GetxController {
  final box = GetStorage();
  var token = ''.obs;
  var laundryId = ''.obs;
  var reviewRegList = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
    laundryId.value = Get.arguments ?? '';
    print(Get.arguments);
    if (laundryId.value.isNotEmpty) {
      getDetailOrder();
    } else {
      Get.snackbar('Error', 'Order ID not found.');
    }
  }

  Future<void> getDetailOrder() async {
    final url = ApiEndpoint.baseUrl;
    // final url =
    //     'http://seatuersih.pradiptaahmad.tech/api/review/all/${laundryId.value}';
    final headers = this.headers;

    isLoading.value = true;

    try {
      if (headers.isEmpty) {
        Get.snackbar('Error', 'No authentication token found.');
        return;
      }

      var response = await http.get(Uri.parse('$url/review/all/${laundryId.value}'), headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is Map && decodedResponse.containsKey('reviews')) {
          reviewRegList.value =
              List<Map<String, dynamic>>.from(decodedResponse['reviews']);
        } else {
          Get.snackbar('Error', 'Unexpected response format');
        }
       } //else {
      //   Get.snackbar('Error', 'Failed to retrieve data: ${response.body}');
      // }
    } catch (e) {
      Get.snackbar('Error', 'Exception occurred: $e');
      print(e);
    } finally {
      isLoading.value = false;
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
