import 'dart:convert';

import 'package:assesment_task/core/api/api_consumer.dart';
import 'package:assesment_task/core/exceptions/exceptions.dart';
import 'package:assesment_task/core/exceptions/failure.dart';
import 'package:assesment_task/features/login/data/models/login_request_model.dart';
import 'package:assesment_task/features/login/data/models/login_response_model.dart';
import 'package:assesment_task/features/login/data/services%20/login_api_end_points.dart';

class LoginService {
  ApiConsumer apiConsumer;

  LoginService({required this.apiConsumer});

  Future<LoginResponseModel> loginWithEmailAdnPassword(
      LoginRequestModel parameter) async {
    final response = await apiConsumer.post(
        LoginApiEndPoints.loginUrl,
        LoginRequestModel(phone: parameter.phone, password: parameter.password)
            .toJson(),
        null);

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
