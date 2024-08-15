abstract class LoginState {}

class InitialState extends LoginState {}

class ChangeEmailOrMobileState extends LoginState {}

class ChangeSecureTextState extends LoginState {}

class OnLoginWithEmailAndPasswordLoadingState extends LoginState {}

class OnLoginWithEmailAndPasswordSuccessState extends LoginState {}

class OnLoginWithEmailAndPasswordErrorState extends LoginState {
  String text;

  OnLoginWithEmailAndPasswordErrorState({required this.text});
}

class OnLoginWithEmailAndPasswordCatchErrorState extends LoginState {
  String text;

  OnLoginWithEmailAndPasswordCatchErrorState({required this.text});
}

class OnLoginWithSocialLoadingState extends LoginState {}
class OnLoginWithSocialSuccessState extends LoginState {}
class OnLoginWithSocialErrorState extends LoginState {}
class OnLoginWithSocialCatchErrorState extends LoginState {}

class OnLoginWithAppleLoadingState extends LoginState {}
class OnLoginWithAppleSuccessState extends LoginState {}
class OnLoginWithAppleErrorState extends LoginState {}
class OnLoginWithAppleCatchErrorState extends LoginState {}
