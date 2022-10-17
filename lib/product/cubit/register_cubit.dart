import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_hive_login/core/init/cache/hive_cache.dart';
import 'package:flutter_bloc_hive_login/product/model/register_request_model.dart';
import 'package:flutter_bloc_hive_login/product/model/register_response_model.dart';
import 'package:meta/meta.dart';

import '../../core/base/abstract_dio_service.dart';
import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.emailController, this.passwordController, this.formKey,
      {required this.dioService, required this.hiveCache})
      : super(RegisterInitial());

  TextEditingController emailController;
  TextEditingController passwordController;
  GlobalKey<FormState> formKey;
  IdioService dioService;
  bool isLoading = false;
  HiveCache hiveCache;

  Future<void> registerRequest() async {
    if (formKey.currentState!.validate()) {
      try {
        changeLoading();
        RegisterResponseModel? registerResponseModel =
            await dioService.registerRequest(RegisterRequestModel(
                email: emailController.text.trim(),
                password: passwordController.text.trim()));
        if (registerResponseModel != null) {
          hiveCache.saveTokenRegister(registerResponseModel);

          emit(RegisterCompleted(registerResponseModel));
        }
      } catch (e) {
        emit(RegisterError(e.toString()));
      }
    }
  }

  void changeLoading() {
    isLoading = !isLoading;
    emit(RegisterLoading(isLoading));
  }
}
