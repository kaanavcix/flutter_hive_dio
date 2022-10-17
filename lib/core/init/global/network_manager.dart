import 'package:dio/dio.dart';

class NetworkManager {
    NetworkManager._();
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://reqres.in/api"));

  Dio get dioInstance => _dio;



  static final NetworkManager instance = NetworkManager._();
}
