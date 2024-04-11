import 'package:crypto_app/domain/crypto_feed.dart';

abstract class CryptoFeedResult{}

class CryptoFeedResultSuccess implements CryptoFeedResult {
  final List<CryptoFeedModelDomain> data;
  CryptoFeedResultSuccess(this.data);
}

class CryptoFeedResultFailure implements CryptoFeedResult {
  final dynamic error;
  CryptoFeedResultFailure(this.error);
}

