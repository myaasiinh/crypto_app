import 'package:dio/dio.dart';

class CryptoFeedDioClient {
  final Dio dio;

  CryptoFeedDioClient({required this.dio});

  Future<Response<dynamic>> getCryptoFeed() async {
    try {
      final response = await dio.get('https://min-api.cryptocompare.com/');
      return response;
    } catch (e) {
      throw Exception('Failed to fetch crypto feed: $e');
    }
  }
}
