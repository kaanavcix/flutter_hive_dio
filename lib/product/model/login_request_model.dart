import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    _$LoginRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
