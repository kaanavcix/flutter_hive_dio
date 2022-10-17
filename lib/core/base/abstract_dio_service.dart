import 'package:dio/dio.dart';
import 'package:flutter_bloc_hive_login/product/model/login_request_model.dart';
import 'package:flutter_bloc_hive_login/product/model/login_response_model.dart';
import 'package:flutter_bloc_hive_login/product/model/register_request_model.dart';
import 'package:flutter_bloc_hive_login/product/model/register_response_model.dart';

abstract class IdioService {
  IdioService(this.dio);

  final Dio dio;

  Future<LoginResponseModel?>? loginRequest(LoginRequestModel loginRequestModel);
    Future<RegisterResponseModel?>? registerRequest(RegisterRequestModel registerRequestModel);


}
