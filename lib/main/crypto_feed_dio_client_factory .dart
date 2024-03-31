// ignore_for_file: file_names

import 'package:crypto_app/infra/crypto_feed_dio_client.dart';
import 'package:crypto_app/main/crypto_feed_service_factory.dart';

class CryptoFeedHttpClientFactory {
  static CryptoFeedDioClient createCryptoFeedHttpClient() {
    final cryptoFeedService = CryptoFeedServiceFactory.createCryptoFeedService();
    return CryptoFeedDioClient(cryptoFeedService); // Assuming CryptoFeedClient accepts CryptoFeedService in its constructor.
  }
}
