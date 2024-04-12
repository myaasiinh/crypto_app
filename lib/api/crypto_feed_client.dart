import 'package:crypto_app/domain/crypto_feed.dart';

abstract class CryptoFeedClient {}

class CryptoFeedClienttSuccess implements CryptoFeedClient {
  final List<CryptoFeedModelDomain> data;
  CryptoFeedClienttSuccess(this.data);
}

class CryptoFeedClientFailure implements CryptoFeedClient {
  final dynamic error;
  CryptoFeedClientFailure(this.error);
}

