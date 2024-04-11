import 'package:crypto_app/infra/crypto_feed_response.dart';

abstract class DioClientResult {}

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

class ConnectivityException implements Exception {}

class InvalidDataException implements Exception {}
