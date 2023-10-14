import 'package:dio/dio.dart';

class NetworkClient {
  Dio get dio {
    final option = BaseOptions(
      baseUrl: 'https://private-16555-erd.apiary-mock.com',
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 30000),
      receiveDataWhenStatusError: true,
    );

    final dio = Dio(option);

    return dio;
  }
}
