import 'package:crypto_app/infra/crypto_feed_response.dart';

abstract class DioClientResult{}

class DioClientResultSuccess implements DioClientResult {
  final CryptoFeedModelResponses data;

  DioClientResultSuccess(this.data);
}

class DioClientResultFailure implements DioClientResult {
  final dynamic error;

  DioClientResultFailure(this.error);
}

abstract class DioClient {
  Stream<DioClientResult> get();
}

// Exception untuk menangani masalah koneksi
class ConnectivityException implements Exception {}

// Exception untuk menangani data yang tidak valid
class InvalidDataException implements Exception {}
