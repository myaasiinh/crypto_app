import 'package:crypto_app/api/load_crypto_feed_remote_use_case.dart';
import 'package:crypto_app/domain/load_crypto_feed_usecase.dart';
import 'package:crypto_app/infra_api/crypto_feed_dio_client.dart';
import 'package:crypto_app/main/crypto_feed_dio_client_factory%20.dart';

class RemoteCryptoFeedLoaderFactory {
  static LoadCryptoFeedUseCase createRemoteCryptoFeedLoader() {
    return LoadCryptoFeedRemoteUseCases(
      CryptoFeedHttpClientFactory.createCryptoFeedHttpClient() as CryptoFeedHttpClient,
    );
  }
}
