import 'package:assesment_task/core/errors_and_success_response/success/success_response.dart';
import 'package:assesment_task/core/exceptions/exceptions.dart';
import 'package:assesment_task/core/exceptions/failure.dart';
import 'package:assesment_task/features/grades/data/models/delete_grade_request.dart';
import 'package:assesment_task/features/grades/data/models/get_grades_response_model.dart';
import 'package:assesment_task/features/grades/data/services%20/grades_service.dart';
import 'package:dartz/dartz.dart';

class GradesRepo {
  final GradesService _gradesService;

  GradesRepo(this._gradesService);

  Future<Either<Failure, List<GetGradesResponseModel>>> getGrades() async {
    try {
      return Right(await _gradesService.getGrades());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
  Future<Either<Failure, SuccessResponseModel>> deleteGrade(
      DeleteGradeRequest parameter) async {
    try {
      return Right(await _gradesService.deleteGrade(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
