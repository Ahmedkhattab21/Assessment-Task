import 'package:assesment_task/core/errors_and_success_response/success/success_response.dart';
import 'package:assesment_task/core/exceptions/exceptions.dart';
import 'package:assesment_task/features/class_details/data/models/add_class_request.dart';
import 'package:assesment_task/features/class_details/data/models/add_class_response_error.dart';
import 'package:assesment_task/features/class_details/data/models/update_class_request.dart';
import 'package:assesment_task/features/class_details/data/services%20/class_details_service.dart';
import 'package:dartz/dartz.dart';

class ClassDetailsRepo {
  final ClassDetailsService _classDetailsService;

  ClassDetailsRepo(this._classDetailsService);

  Future<Either<AddClassResponseError, SuccessResponseModel>> addClass(
      AddClassRequest parameter) async {
    try {
      return await _classDetailsService.addClass(parameter);
    } on ServerException catch (failure) {
      throw "error ";
    }
  }

  Future<Either<AddClassResponseError, SuccessResponseModel>> editClass(
      UpdateClassRequest parameter) async {
    try {
      return await _classDetailsService.editClass(parameter);
    } on ServerException catch (failure) {
      throw "error ";
    }
  }
}
