import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class HistoryPaymentController extends GetxController {
  var history = <Map<String, dynamic>>[].obs;
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
    checkPermissions().then((_) => getAllHistory());
  }

  Future<void> getAllHistory() async {
    final url =
        'http://seatuersih.pradiptaahmad.tech/api/payment/all-payment-histories';
    final headers = this.headers;

    try {
      if (headers.isEmpty) {
        Get.snackbar('Error', 'No authentication token found.');
        return;
      }

      isLoading.value = true;

      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is Map && decodedResponse.containsKey('data')) {
          history.value =
              List<Map<String, dynamic>>.from(decodedResponse['data']);
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

  Future<void> checkPermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<void> exportToExcel() async {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Payment History'];

    // Menambahkan header
    sheetObject
      ..cell(CellIndex.indexByString('A1')).value = TextCellValue('Username')
      ..cell(CellIndex.indexByString('B1')).value = TextCellValue('Order Date')
      ..cell(CellIndex.indexByString('C1')).value = TextCellValue('Order Type')
      ..cell(CellIndex.indexByString('D1')).value =
          TextCellValue('Total Price');

    // Menambahkan data dari payment history
    for (var i = 0; i < history.length; i++) {
      var item = history[i];
      sheetObject
        ..cell(CellIndex.indexByString("A${i + 2}")).value =
            TextCellValue(item['user']['username'])
        ..cell(CellIndex.indexByString("B${i + 2}")).value =
            TextCellValue(item['order_date'])
        ..cell(CellIndex.indexByString("C${i + 2}")).value =
            TextCellValue(item['order_type'])
        ..cell(CellIndex.indexByString("D${i + 2}")).value =
            TextCellValue(item['total_price'].toString());
    }

    // Simpan file di direktori Downloads
    var dir =
        await getExternalStorageDirectory(); // Menggunakan direktori penyimpanan eksternal
    if (dir == null) {
      Get.snackbar("Error", "Unable to access external storage.");
      return;
    }

    var downloadsDir = Directory('/storage/emulated/0/Download');
    if (!await downloadsDir.exists()) {
      downloadsDir.createSync(recursive: true);
    }

    var filePath =
        "${downloadsDir.path}/PaymentHistory_${DateTime.now().millisecondsSinceEpoch}.xlsx";
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    print('File saved to: $filePath');
    print('File exists: ${File(filePath).existsSync()}');

    try {
      File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(excel.encode()!);
      print('File saved to: $filePath');
      Get.snackbar("Success",
          "Data telah diekspor ke Excel! Periksa folder Download Anda.");
    } catch (e) {
      print('Error saving file: $e');
      Get.snackbar("Error", "Gagal mengekspor data ke Excel.");
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
