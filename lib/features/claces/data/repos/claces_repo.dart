import 'package:assesment_task/core/errors_and_success_response/success/success_response.dart';
import 'package:assesment_task/core/exceptions/exceptions.dart';
import 'package:assesment_task/core/exceptions/failure.dart';
import 'package:assesment_task/features/claces/data/models/delete_class_request.dart';
import 'package:assesment_task/features/claces/data/models/get_claces_response_model.dart';
import 'package:assesment_task/features/claces/data/services%20/claces_service.dart';
import 'package:dartz/dartz.dart';

class ClacesRepo {
  final ClacesService _clacesService;

  ClacesRepo(this._clacesService);

  Future<Either<Failure, List<GetClacesResponseModel>>> getClaces() async {
    try {
       print( _clacesService.getClaces());
      return Right(await _clacesService.getClaces());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
  Future<Either<Failure, SuccessResponseModel>> deleteClass(
      DeleteClassRequest parameter) async {
    try {
      return Right(await _clacesService.deleteClass(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
