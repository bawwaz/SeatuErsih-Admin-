import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class OrderStatusPendingController extends GetxController {
  var pendingOrder = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs; // Menambahkan state loading
  final box = GetStorage();
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
    getPendingOrder();
  }

  Future<void> getPendingOrder() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/order/status/pending';
    final headers = this.headers;

    try {
      if (headers.isEmpty) {
        Get.snackbar('Error', 'No authentication token found.');
        return;
      }

      isLoading.value = true; // Set loading true saat memulai permintaan

      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is List) {
          pendingOrder.value = List<Map<String, dynamic>>.from(decodedResponse);
        } else if (decodedResponse is Map &&
            decodedResponse.containsKey('data')) {
          pendingOrder.value =
              List<Map<String, dynamic>>.from(decodedResponse['data']);
        } else {
          Get.snackbar('Error', 'Unexpected response format');
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false; // Set loading false setelah permintaan selesai
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
