import 'package:crypto_app/infra_api/crypto_feed_response.dart';
import 'package:dio/dio.dart';

class CryptoFeedService {
  final Dio _dio;

  CryptoFeedService(this._dio);

  Future<CryptoFeedModelResponses> get({
    int? limit = 20,
    String? tsym = "USD",
  }) async {
   final response = await _dio.get(
        "data/top/totaltoptiervolfull",
        queryParameters: {
          "limit": limit,
          "tsym": tsym,
        },
      );
      return CryptoFeedModelResponses.fromJson(response.data);
  }
}
