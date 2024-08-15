import 'dart:convert';

import 'package:assesment_task/core/api/api_consumer.dart';
import 'package:assesment_task/core/errors_and_success_response/success/success_response.dart';
import 'package:assesment_task/core/exceptions/exceptions.dart';
import 'package:assesment_task/core/exceptions/failure.dart';
import 'package:assesment_task/core/services/cache_helper.dart';
import 'package:assesment_task/core/utils/constant_keys.dart';
import 'package:assesment_task/features/grades/data/models/delete_grade_request.dart';
import 'package:assesment_task/features/grades/data/models/get_grades_response_model.dart';
import 'package:assesment_task/features/grades/data/services%20/grades_api_end_points.dart';

class GradesService {
  ApiConsumer apiConsumer;

  GradesService({required this.apiConsumer});

  Future<List<GetGradesResponseModel>> getGrades() async {
    final response = await apiConsumer.get(GradesApiEndPoints.getGradesUrl, {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}"
    });

    if (response.statusCode == 200) {
      return List<GetGradesResponseModel>.from(
          jsonDecode(response.body.toString())
              .map((data) => GetGradesResponseModel.fromJson(data)));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

  Future<SuccessResponseModel> deleteGrade(DeleteGradeRequest parameter) async {
    final response = await apiConsumer
        .delete(GradesApiEndPoints.deleteGradesUrl(parameter.id), null, {
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
