import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final box = GetStorage();
  var token = ''.obs;
  var username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
    username.value = box.read('username') ?? '';
  }

  Future<void> logout() async {
    final url =
        'http://seatuersih.pradiptaahmad.tech/api/admins/logout'; // Ganti dengan URL yang sesuai
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token.value}',
      'Content-Type': 'application/json',
    };

    try {
      var response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Menghapus token dari GetStorage
        box.remove('token');
        // Menampilkan snackbar
        Get.snackbar(
          'Logout',
          'Anda sudah logout',
          snackPosition: SnackPosition.TOP,
        );
        // Menavigasi ke halaman login atau halaman lain yang sesuai setelah logout
        Get.offAllNamed(
            '/login'); // Pastikan Anda telah mendefinisikan rute '/login' di GetX
      } else {
        Get.snackbar(
          'Error',
          'Gagal logout: ${response.body}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Exception occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
