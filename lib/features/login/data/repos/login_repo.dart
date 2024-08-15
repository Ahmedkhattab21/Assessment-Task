import 'package:assesment_task/core/exceptions/exceptions.dart';
import 'package:assesment_task/core/exceptions/failure.dart';
import 'package:assesment_task/features/login/data/models/login_request_model.dart';
import 'package:assesment_task/features/login/data/models/login_response_model.dart';
import 'package:assesment_task/features/login/data/services%20/login_service.dart';
import 'package:dartz/dartz.dart';

class LoginRepo {
  final LoginService _loginService;

  LoginRepo(this._loginService);

  Future<Either<Failure, LoginResponseModel>> loginWithEmailAdnPassword(
      LoginRequestModel parameter) async {
    try {
      return Right(await _loginService.loginWithEmailAdnPassword(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
