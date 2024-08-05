import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ProductReviewController extends GetxController {
  var laundries = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  var box = GetStorage();
  var orderId = ''.obs;
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    orderId.value = Get.arguments ?? '';
    token.value = box.read('token');
    getAllLaundries();
  }

  Future<void> getAllLaundries() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/laundry/getall';
    final headers = this.headers;

    try {
      if (headers['Authorization'] == "Bearer ") {
        Get.snackbar('Error', 'No authentication token found.');
        return;
      }

      isLoading.value = true;

      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is Map &&
            decodedResponse.containsKey('laundries')) {
          laundries.value =
              List<Map<String, dynamic>>.from(decodedResponse['laundries']);
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

  Map<String, String> get headers {
    return {
      "Accept": "application/json",
      "Authorization": "Bearer ${token.value}",
      "Content-Type": "application/json"
    };
  }
}
