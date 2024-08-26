import 'package:dio/dio.dart';
import 'package:seatu_ersih_admin/api/api_endpoint.dart';
import 'package:seatu_ersih_admin/api/dio_instance.dart';

class LoginAuthService {
  final DioInstance dioInstance = DioInstance();

  Future<Response> login(
      String email, String password, String notificationToken) async {
    try {
      final response = await dioInstance.postRequest(
        endpoint: ApiEndpoint.baseUrlLogin,
        isAuthorize: false,
        data: {
          'email': email,
          'password': password,
          'notification_token': notificationToken,
        },
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
