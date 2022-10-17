import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_hive_login/core/base/abstract_dio_service.dart';
import 'package:flutter_bloc_hive_login/product/model/register_response_model.dart';
import 'package:flutter_bloc_hive_login/product/model/register_request_model.dart';
import 'package:flutter_bloc_hive_login/product/model/login_response_model.dart';
import 'package:flutter_bloc_hive_login/product/model/login_request_model.dart';

class DioService extends IdioService {
  DioService(super.dio);

  @override
  Future<LoginResponseModel?>? loginRequest(
      LoginRequestModel loginRequestModel) async {
    try {
      var response = await dio.post("/${OnboardingPath.login.name}",
          data: loginRequestModel);

      if (response.statusCode == HttpStatus.ok) {
        if (response.data is Map<String, dynamic>) {
          return LoginResponseModel.fromJson(response.data);
        }
      }
    } on DioError catch (message) {
      print(message.message);
    }
  }

  @override
  Future<RegisterResponseModel?>? registerRequest(
      RegisterRequestModel registerRequestModel) async {
    try {
      var response = await dio.post("/${OnboardingPath.register.name}",
          data: registerRequestModel);

      if (response.statusCode == HttpStatus.ok) {
        if (response.data is Map<String, dynamic>) {
          return RegisterResponseModel.fromJson(response.data);
        }
      }
    } on DioError catch (message) {
      print(message.message);
    }
  }
}

enum OnboardingPath { login, register }
