class LoginResponseModel {
  String token;
  LoginResponseDataModel data;

  LoginResponseModel({
    required this.token,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
          token: json['token'],
          data: LoginResponseDataModel.fromJson(json['user']));
}

class LoginResponseDataModel {
  String id;
  String schoolId;
  String name;

  LoginResponseDataModel(
      {required this.id, required this.schoolId, required this.name});

  factory LoginResponseDataModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseDataModel(
        id: json['id'],
        schoolId: json['school_id'],
        name: json['name'],
      );
}
