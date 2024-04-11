
// ignore_for_file: file_names

import 'package:crypto_app/api/crypto_feed_client.dart';

abstract class LoadCryptoFeedUseCases {
  Stream<CryptoFeedResult> load();
}
