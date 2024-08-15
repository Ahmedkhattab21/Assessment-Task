import 'dart:convert';

import 'package:assesment_task/core/api/api_consumer.dart';
import 'package:assesment_task/core/errors_and_success_response/success/success_response.dart';
import 'package:assesment_task/core/exceptions/exceptions.dart';
import 'package:assesment_task/core/exceptions/failure.dart';
import 'package:assesment_task/core/services/cache_helper.dart';
import 'package:assesment_task/core/utils/constant_keys.dart';
import 'package:assesment_task/features/class_details/data/models/add_class_request.dart';
import 'package:assesment_task/features/class_details/data/models/add_class_response_error.dart';
import 'package:assesment_task/features/class_details/data/models/update_class_request.dart';
import 'package:assesment_task/features/class_details/data/services%20/class_details_api_end_points.dart';
import 'package:dartz/dartz.dart';

class ClassDetailsService {
  ApiConsumer apiConsumer;

  ClassDetailsService({required this.apiConsumer});

  Future<Either<AddClassResponseError, SuccessResponseModel>> addClass(
      AddClassRequest parameter) async {
    final response = await apiConsumer.post(
        ClassDetailsApiEndPoints.addClassUrl,
        AddClassRequest(
          nameAr: parameter.nameAr,
          nameEn: parameter.nameEn,
          gradeId: parameter.gradeId,
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
      return Left(AddClassResponseError.fromJson(jsonDecode(response.body)));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }

  Future<Either<AddClassResponseError, SuccessResponseModel>> editClass(
      UpdateClassRequest parameter) async {
    final response = await apiConsumer.put(
        ClassDetailsApiEndPoints.editClassUrl(parameter.id),
        UpdateClassRequest(
                nameAr: parameter.nameAr,
                nameEn: parameter.nameEn,
                gradeId: parameter.gradeId,
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
      return Left(AddClassResponseError.fromJson(jsonDecode(response.body)));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
