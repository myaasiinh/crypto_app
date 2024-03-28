import 'package:crypto_app/domain/crypto_feed.dart';
import 'package:crypto_app/infra_api/crypto_feed_services.dart';


class RemoteCryptoFeed {
  final CryptoFeedService cryptoFeedService;

  RemoteCryptoFeed({required this.cryptoFeedService});

  Future<List<CoinItem>> fetchCryptoFeed() async {
    return await cryptoFeedService.fetchCryptoFeed();
  }
}
