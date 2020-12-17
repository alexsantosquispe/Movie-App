import 'package:dio/dio.dart';

class DioClient {
  factory DioClient() => _dioClient;

  DioClient._internal();

  static final DioClient _dioClient = DioClient._internal();
  static final Dio _dioInstance = Dio();

  static Dio get dioInstance => _dioInstance;

  void dispose() {
    _dioInstance.close();
  }
}
