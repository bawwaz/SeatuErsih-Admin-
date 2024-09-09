import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/api/api_endpoint.dart';

class OrderStatusPendingController extends GetxController {
  var pendingOrder = [].obs;
  var isLoading = true.obs;
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
    // final url = 'http://seatuersih.pradiptaahmad.tech/api/order/status/pending';
    final url = ApiEndpoint.baseUrl;
    final headers = this.headers;

    try {
      if (headers.isEmpty) {
        Get.snackbar('Error', 'No authentication token found.');
        return;
      }

      isLoading.value = true;

      var response = await http.get(
        Uri.parse('$url/order/status/pending'),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        print(decodedResponse);
        pendingOrder.value = decodedResponse['data'];
      }
    } catch (e) {
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
