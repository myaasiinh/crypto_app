import 'package:crypto_app/api/load_crypto_feed_remote_use_case.dart';
import 'package:crypto_app/main/crypto_feed_dio_client_factory%20.dart';
import 'package:crypto_app/api/remote_crypto_feed.dart';

class RemoteCryptoFeedLoaderFactory {
  static CryptoFeedLoader createRemoteCryptoFeedLoader() {
    return LoadCryptoFeedRemoteUseCases(
      CryptoFeedDioClientFactory.createCryptoFeedDioClient(),
    );
  }
}
