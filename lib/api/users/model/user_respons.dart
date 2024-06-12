import 'dart:convert';
import 'package:seatu_ersih_admin/api/users/model/user_model.dart';

UserRespons userResponsFromJson(String str) =>
    UserRespons.fromJson(json.decode(str));

String userResponsToJson(UserRespons data) => json.encode(data.toJson());

class UserRespons {
  User? user;
  String? token;

  UserRespons({
    this.user,
    this.token,
  });

  factory UserRespons.fromJson(Map<String, dynamic> json) => UserRespons(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "token": token,
      };
}
