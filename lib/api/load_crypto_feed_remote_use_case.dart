
import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/domain/crypto_feed.dart';

class LoadCryptoFeedRemoteUseCases {
  final RemoteCryptoFeed remoteCryptoFeed;

  LoadCryptoFeedRemoteUseCases({required this.remoteCryptoFeed});

  Future<List<CoinItem>> call() async {
    return await remoteCryptoFeed.fetchCryptoFeed();
  }
}
