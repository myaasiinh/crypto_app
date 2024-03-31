// ignore_for_file: file_names

import 'package:crypto_app/api/crypto_feed_client.dart';
import 'package:crypto_app/infra_api/crypto_feed_dio_client.dart';
import 'package:crypto_app/main/crypto_feed_service_factory.dart';

class CryptoFeedHttpClientFactory {
  static CryptoFeedClient createCryptoFeedHttpClient() {
    final cryptoFeedService = CryptoFeedServiceFactory.createCryptoFeedService();
    return CryptoFeedClient(cryptoFeedService as CryptoFeedHttpClient); // Assuming CryptoFeedClient accepts CryptoFeedService in its constructor.
  }
}
