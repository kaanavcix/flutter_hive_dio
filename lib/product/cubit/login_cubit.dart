import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_hive_login/core/base/abstract_dio_service.dart';
import 'package:flutter_bloc_hive_login/core/init/cache/hive_cache.dart';
import 'package:flutter_bloc_hive_login/product/model/login_request_model.dart';
import 'package:flutter_bloc_hive_login/product/model/login_response_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.emailController, this.passwordController, this.formKey,
      {required this.dioService, required this.hiveCache})
      : super(LoginInitial());

  TextEditingController emailController;
  TextEditingController passwordController;
  GlobalKey<FormState> formKey;
  IdioService dioService;
  bool isLoading = false;
  bool isFail = false;
  HiveCache hiveCache;

  Future<void> loginRequest(LoginRequestModel loginRequestModel) async {
    if (formKey.currentState!.validate() && formKey.currentState != null) {
      try {
        print("data");
        changeLoading();
        LoginResponseModel? loginResponseModel =
            await dioService.loginRequest(loginRequestModel);
        changeLoading();

        if (loginResponseModel != null) {
          hiveCache.saveTokenLogin(loginResponseModel);
          emit(LoginCompeleted(loginResponseModel));
        }
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    } else {
      if (formKey.currentState == null) {
        isFail = true;
        emit(LoginValidateMode(isFail));
      }
    }
  }

  void changeLoading() {
    isLoading = !isLoading;
    emit(LoginLoading(isLoading));
  }
}
