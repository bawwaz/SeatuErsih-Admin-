import 'package:dio/dio.dart';
import 'package:seatu_ersih_admin/api/api_endpoint.dart';
import 'package:seatu_ersih_admin/api/dio_instance.dart';

class RegistAuthService {
  final DioInstance dioInstance = DioInstance();

  Future<void> regist(
      String username, String email, String phone, String password) async {
    try {
      final response = await dioInstance
          .postRequest(endpoint: ApiEndpoint.baseUrlRegister, data: {
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
      });
      
      if (response.statusCode == 422) {
        final errorMessage = response.data['message'];
        if (errorMessage == 'Email already exists') {
          throw Exception("email already exists");
        } else {
          throw Exception(errorMessage);
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        final errorMessage = e.response?.data['message'] ?? 'Unknown error';
        throw Exception(errorMessage);
      } else {
        throw Exception(e.toString());
      }
    }
  }
}
