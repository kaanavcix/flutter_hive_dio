part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  final bool isLoading;
  LoginLoading(this.isLoading);
}

class LoginCompeleted extends LoginState {
  final LoginResponseModel loginResponseModel;
  LoginCompeleted(this.loginResponseModel);
}
class LoginError extends LoginState {
  final String data;
  LoginError(this.data);
}

class LoginFinished extends LoginState {
  final LoginResponseModel loginResponseModel;
  LoginFinished(this.loginResponseModel);
}

class LoginValidateMode extends LoginState {
  final bool isFail;
  LoginValidateMode(this.isFail);
}



