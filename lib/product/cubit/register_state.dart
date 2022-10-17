part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {
  final bool isLoading;

  RegisterLoading(this.isLoading);

}

class RegisterCompleted extends RegisterState {
  final RegisterResponseModel registerResponseModel;

  RegisterCompleted(this.registerResponseModel);

}

class RegisterError extends RegisterState {
  final String message;

  RegisterError(this.message);

}

