import 'package:dio/dio.dart';

class DioFactory {
  static Dio createDio() {
    final dio = Dio(BaseOptions(baseUrl: "https://min-api.cryptocompare.com/"));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.headers["Authorization"] = "Apikey 1fead772948dffa4d8f1f0a969b16f0f5acf3090c7efeb03368a61853944f899";
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
