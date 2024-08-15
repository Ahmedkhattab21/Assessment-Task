import 'package:assesment_task/core/errors_and_success_response/success/success_response.dart';
import 'package:assesment_task/core/exceptions/exceptions.dart';
import 'package:assesment_task/core/exceptions/failure.dart';
import 'package:assesment_task/features/grade_details/data/models/add_grade_request.dart';
import 'package:assesment_task/features/grade_details/data/models/add_grade_response_error.dart';
import 'package:assesment_task/features/grade_details/data/models/update_grade_request.dart';
import 'package:assesment_task/features/grade_details/data/services%20/grade_details_service.dart';
import 'package:dartz/dartz.dart';

class GradeDetailsRepo {
  final GradeDetailsService _gradeDetailsService;

  GradeDetailsRepo(this._gradeDetailsService);

  Future<Either<AddGradeResponseError, SuccessResponseModel>> addGrade(
      AddGradeRequest parameter) async {
    try {
      return await _gradeDetailsService.addGrade(parameter);
    } on ServerException catch (failure) {
     throw "error ";
    }
  }

  Future<Either<AddGradeResponseError, SuccessResponseModel>> editGrade(
      UpdateGradeRequest parameter) async {
    try {
      return await _gradeDetailsService.editGrade(parameter);
    } on ServerException catch (failure) {
      throw "error ";
    }
  }


}
