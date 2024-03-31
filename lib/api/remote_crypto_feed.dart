import 'package:crypto_app/domain/crypto_feed_domain.dart';

enum ResultType { success, failure }

class CryptoFeedResult {
  final ResultType type;
  final List<CryptoFeedModelDomain>? data;
  final dynamic error;

  CryptoFeedResult.success(this.data)
      : type = ResultType.success,
        error = null;

  CryptoFeedResult.failure(this.error)
      : type = ResultType.failure,
        data = null;
}