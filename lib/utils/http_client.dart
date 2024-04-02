import 'package:crypto_app/infra/crypto_feed_response.dart';
import 'package:crypto_app/utils/status_network.dart';



class HttpClientResult {
  StatusNetworkType type;
  CryptoFeedModelResponses? data; // Marking data as nullable
  dynamic error;

  HttpClientResult.success(this.data) : type = StatusNetworkType.success;

  HttpClientResult.failure(this.error) : type = StatusNetworkType.failure;
}

abstract class CryptoFeedHttpClient {
  Stream<HttpClientResult> get();
}

// Exception untuk menangani masalah koneksi
class ConnectivityException implements Exception {
  final String message;

  ConnectivityException({this.message = 'No internet connection'}) : super();
}

// Exception untuk menangani data yang tidak valid
class InvalidDataException implements Exception {
  final String message;

  InvalidDataException({this.message = 'Invalid data'}) : super();
}

// Exception untuk menangani error tidak diketahui
class UnknownError implements Exception {}
