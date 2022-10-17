class RegisterResponseModel {
  int? id;
  String? token;

  RegisterResponseModel({this.id, this.token});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['token'] = token;
    return data;
  }
}
