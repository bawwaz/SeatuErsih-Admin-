class User {
  int? id;
  String? username;
  String? email;
  String? emailVerifiedAt;
  String? phone;
  String? profilePicture;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.profilePicture,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        profilePicture: json["profile_picture"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "profile_picture": profilePicture,
        "role": role,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
      };
}
