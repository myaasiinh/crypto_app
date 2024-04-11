// ignore_for_file: file_names

import 'package:crypto_app/api/remote_crpyto_feed.dart';
import 'package:crypto_app/infra/crypto_feed_dio_client.dart';
import 'package:crypto_app/main/crypto_feed_service_factory.dart';

class CryptoFeedRemoteClientFactory {
  static RemoteCryptoFeed createRemoteCryptoFeed() {
    final cryptoFeedService =
        CryptoFeedServiceFactory.createCryptoFeedService();
    return CryptoFeedDioClient(
        cryptoFeedService);
  }
}
