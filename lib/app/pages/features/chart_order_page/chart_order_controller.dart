import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class ChartOrderController extends GetxController {
  final chartReg = [].obs;
  final chartDeep = [].obs;
  var isLoading = true.obs;
  final box = GetStorage();
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getChartReg();
  }

  Future<void> getChartReg() async {
    isLoading.value = true;
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response = await http
          .get(Uri.parse('$url/order/chart/regular_clean'), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null && data is List) {
          chartReg.assignAll(data);
        } else {
          print('no data found');
        }
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> getChartDeep() async {
    isLoading.value = true;
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response = await http.get(Uri.parse('$url/order/chart/deep_clean'),
          headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null && data is List) {
          if (data.isEmpty) {
            Get.snackbar(
              'No Data',
              'No deep clean data found.',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
          chartDeep.assignAll(data);
        } else {
          print('no data found');
        }
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
