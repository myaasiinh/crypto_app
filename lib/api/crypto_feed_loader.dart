import 'package:crypto_app/api/crypto_feed_result.dart';

abstract class CryptoFeedLoader {
  Stream<CryptoFeedResult> load();
}
