import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:crypto_app/utils/status_network.dart';

class CryptoFeedResult {
  late StatusNetworkType type;
  List<CryptoFeedModelDomain>? cryptoFeedItems;
  dynamic error;

  CryptoFeedResult.success(this.cryptoFeedItems) : type = StatusNetworkType.success;

  CryptoFeedResult.failure(this.error) : type = StatusNetworkType.failure;
}

abstract class CryptoFeedLoader {
  Stream<CryptoFeedResult> load();
}