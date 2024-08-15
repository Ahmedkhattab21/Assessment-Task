import 'dart:convert';

import 'package:assesment_task/core/api/api_consumer.dart';
import 'package:assesment_task/core/errors_and_success_response/success/success_response.dart';
import 'package:assesment_task/core/exceptions/exceptions.dart';
import 'package:assesment_task/core/exceptions/failure.dart';
import 'package:assesment_task/core/services/cache_helper.dart';
import 'package:assesment_task/core/utils/constant_keys.dart';
import 'package:assesment_task/features/grade_details/data/models/add_grade_request.dart';
import 'package:assesment_task/features/grade_details/data/models/add_grade_response_error.dart';
import 'package:assesment_task/features/grade_details/data/models/update_grade_request.dart';
import 'package:assesment_task/features/grade_details/data/services%20/grade_details_api_end_points.dart';
import 'package:dartz/dartz.dart';

class GradeDetailsService {
  ApiConsumer apiConsumer;

  GradeDetailsService({required this.apiConsumer});

  Future<Either<AddGradeResponseError, SuccessResponseModel>> addGrade(
      AddGradeRequest parameter) async {
    final response = await apiConsumer.post(
        GradeDetailsApiEndPoints.addGradesUrl,
        AddGradeRequest(
          nameAr: parameter.nameAr,
          nameEn: parameter.nameEn,
          schoolId: parameter.schoolId,
        ).toJson(),
        {
          ConstantKeys.appAuthorization:
              "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}"
        });

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Right(
          SuccessResponseModel.fromJson(jsonDecode('{"message":"done"}')));
    } else if (response.statusCode == 422) {
      return Left(AddGradeResponseError.fromJson(jsonDecode(response.body)));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

  Future<Either<AddGradeResponseError, SuccessResponseModel>> editGrade(
      UpdateGradeRequest parameter) async {
    final response = await apiConsumer.put(
        GradeDetailsApiEndPoints.editGradesUrl(parameter.id),
        UpdateGradeRequest(
                nameAr: parameter.nameAr,
                nameEn: parameter.nameEn,
                schoolId: parameter.schoolId,
                id: parameter.id)
            .toJson(),
        {
          ConstantKeys.appAuthorization:
              "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}"
        });

    if (response.statusCode == 200) {
      return Right(
          SuccessResponseModel.fromJson(jsonDecode('{"message":"done"}')));
    } else if (response.statusCode == 422) {
      return Left(AddGradeResponseError.fromJson(jsonDecode(response.body)));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

}
