import 'package:crypto_app/infra/crypto_feed_response.dart';

abstract class RemoteCryptoFeedResult {}

class RemoteCryptoFeedSuccess implements RemoteCryptoFeedResult {
  final CryptoFeedModelResponses data;

  RemoteCryptoFeedSuccess(this.data);
}

class RemoteCryptoFeedFailure implements RemoteCryptoFeedResult {
  final dynamic error;

  RemoteCryptoFeedFailure(this.error);
}

abstract class RemoteCryptoFeed {
  Stream<RemoteCryptoFeedResult> get();
}

class ConnectivityException implements Exception {}

class InvalidDataException implements Exception {}
