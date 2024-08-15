import 'dart:convert';

import 'package:assesment_task/core/api/api_consumer.dart';
import 'package:assesment_task/core/errors_and_success_response/success/success_response.dart';
import 'package:assesment_task/core/exceptions/exceptions.dart';
import 'package:assesment_task/core/exceptions/failure.dart';
import 'package:assesment_task/core/services/cache_helper.dart';
import 'package:assesment_task/core/utils/constant_keys.dart';
import 'package:assesment_task/features/claces/data/models/delete_class_request.dart';
import 'package:assesment_task/features/claces/data/models/get_claces_response_model.dart';
import 'package:assesment_task/features/claces/data/services%20/claces_api_end_points.dart';

class ClacesService {
  ApiConsumer apiConsumer;

  ClacesService({required this.apiConsumer});

  Future<List<GetClacesResponseModel>> getClaces() async {
    final response = await apiConsumer.get(ClacesApiEndPoints.getClacesUrl, {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}"
    });

    if (response.statusCode == 200) {
      return List<GetClacesResponseModel>.from(
          jsonDecode(response.body.toString())
              .map((data) => GetClacesResponseModel.fromJson(data)));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

  Future<SuccessResponseModel> deleteClass(DeleteClassRequest parameter) async {
    final response = await apiConsumer
        .delete(ClacesApiEndPoints.deleteClassUrl(parameter.id), null, {
      ConstantKeys.appAuthorization:
      "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}"
    });

    if (response.statusCode == 204) {
      return SuccessResponseModel.fromJson(jsonDecode('{"message":"done"}'));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

}
