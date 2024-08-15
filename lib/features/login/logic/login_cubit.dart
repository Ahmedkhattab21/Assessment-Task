import 'package:assesment_task/core/services/cache_helper.dart';
import 'package:assesment_task/core/utils/constant_keys.dart';
import 'package:assesment_task/features/login/data/models/login_request_model.dart';
import 'package:assesment_task/features/login/data/repos/login_repo.dart';
import 'package:assesment_task/features/login/logic/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(InitialState());

  bool secureText = false;

  changeSecureText() {
    secureText = !secureText;
    emit(ChangeSecureTextState());
  }

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  loginWithEmailAdnPassword() {
    emit(OnLoginWithEmailAndPasswordLoadingState());
    _loginRepo
        .loginWithEmailAdnPassword(LoginRequestModel(
      phone: phoneController.text,
      password: passwordController.text,
    ))
        .then((value) {
      value.fold((l) {
        emit(OnLoginWithEmailAndPasswordErrorState(text: l.message));
      }, (r) {
        saveUserToken(r.token, r.data.name,r.data.schoolId);
        emit(OnLoginWithEmailAndPasswordSuccessState());
      });
    }).catchError((error) {
      print(error);
      emit(OnLoginWithEmailAndPasswordCatchErrorState(text: error.toString()));
    });
  }

  Future<void> saveUserToken(String token, String name,String schoolId) async {
    await CacheHelper.setData(ConstantKeys.saveSchoolIdToShared, schoolId);
    await CacheHelper.setData(ConstantKeys.saveNameToShared, name);
    await CacheHelper.setSecuredString(ConstantKeys.saveTokenToShared, token);
  }

  static LoginCubit get(context) => BlocProvider.of(context);
}
