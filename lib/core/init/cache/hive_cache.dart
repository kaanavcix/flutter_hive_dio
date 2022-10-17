import 'package:flutter_bloc_hive_login/product/model/login_response_model.dart';
import 'package:flutter_bloc_hive_login/product/model/register_response_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveCache {
  HiveCache();


  Future<void> saveTokenLogin(LoginResponseModel loginResponseModel) async {
    var box = Hive.box(HivePath.token.name);

    await box.put(HivePath.tokenAuth.name, loginResponseModel.token);
  }

  Future<void> saveTokenRegister(
      RegisterResponseModel registerResponseModel) async {
    var box = Hive.box(HivePath.token.name);

    await box.put(HivePath.tokenAuth.name, registerResponseModel.token);
  }
}

enum HivePath { token, tokenAuth }
