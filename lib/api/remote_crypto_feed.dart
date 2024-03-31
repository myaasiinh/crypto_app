import 'package:crypto_app/domain/crypto_feed.dart';

enum ResultType { success, failure }

class CryptoFeedResult {
  final ResultType type;
  final List<CryptoFeedModel>? data;
  final dynamic error;

  CryptoFeedResult.success(this.data)
      : type = ResultType.success,
        error = null;

  CryptoFeedResult.failure(this.error)
      : type = ResultType.failure,
        data = null;
}