import 'package:dio/dio.dart';

class HttpFactory {
  static Dio createDio() {
    final dio = Dio(BaseOptions(baseUrl: "https://min-api.cryptocompare.com/"));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.headers["Authorization"] = "Apikey 629946b446ccdb20b8606f44756f95c068c09bdac5d021bbc82cf66dd1453eaa";
          return handler.next(options);
        },
      ),
    );
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.options.connectTimeout = const Duration(milliseconds: 10000); // 10 seconds
    dio.options.receiveTimeout = const Duration(milliseconds: 10000); // 10 seconds
    dio.options.sendTimeout = const Duration(milliseconds: 10000); // 10 seconds
    return dio;
  }
}
