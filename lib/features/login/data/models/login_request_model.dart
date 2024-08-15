class LoginRequestModel {
  String? phone;
  String? password;

  LoginRequestModel({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "mobile": phone,
        "password": password,
      };
}
