// ignore_for_file: file_names

import 'package:crypto_app/api/remote_crpyto_feed.dart';
import 'package:crypto_app/infra/crypto_feed_dio_client.dart';
import 'package:crypto_app/main/crypto_feed_service_factory.dart';

class CryptoFeedDioClientFactory {
  static DioClient createCryptoFeedDioClient() {
    final cryptoFeedService =
        CryptoFeedServiceFactory.createCryptoFeedService();
    return CryptoFeedDioClient(
        cryptoFeedService); // Assuming CryptoFeedClient accepts CryptoFeedService in its constructor.
  }
}
