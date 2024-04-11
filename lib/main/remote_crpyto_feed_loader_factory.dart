import 'package:crypto_app/api/load_crypto_feed_remote_use_case.dart';
import 'package:crypto_app/domain/load_crpyto_feed_use_case.dart';
import 'package:crypto_app/main/crypto_feed_dio_client_factory%20.dart';

class RemoteCryptoFeedLoaderFactory {
  static LoadCryptoFeedUseCases createRemoteCryptoFeedLoader() {
    return LoadCryptoFeedRemoteUseCases(
      CryptoFeedDioClientFactory.createCryptoFeedDioClient(),
    );
  }
}
