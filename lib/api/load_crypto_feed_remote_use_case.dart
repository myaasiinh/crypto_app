// ignore_for_file: avoid_print

import 'package:crypto_app/api/crypto_feed_result.dart';
import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:crypto_app/domain/item_mapper_crypto_feed.dart';
import 'package:crypto_app/infra/crypto_feed_dio_client.dart';
import 'package:crypto_app/infra/crypto_feed_response.dart';
import 'package:crypto_app/utils/http_client.dart';
import 'package:crypto_app/utils/status_network.dart';


class LoadCryptoFeedRemoteUseCases implements CryptoFeedLoader {
  final CryptoFeedDioClient _cryptoFeedHttpClient;

  LoadCryptoFeedRemoteUseCases(this._cryptoFeedHttpClient);

  @override
  Stream<CryptoFeedResult> load() async* {
    try {
      await for (var result in _cryptoFeedHttpClient.get()) {
        if (result.type == StatusNetworkType.success) {
          final cryptoFeed = result.data;
          if (cryptoFeed!.data.isNotEmpty) {
            // Mapping data and printing debug info
            final mappedData = CryptoFeedMapper.fromModelResponseMapDomain(cryptoFeed.data as CryptoFeedModelResponses) as List<CryptoFeedModelDomain>?;
            print('Mapped Data: $mappedData');
            yield CryptoFeedResult.success(mappedData);
          } else {
            yield CryptoFeedResult.success([]); // Return empty list if data is empty
          }
        } else {
          // Handle failure case
          if (result.error is ConnectivityException) {
            yield CryptoFeedResult.failure(ConnectivityException());
          } else if (result.error is InvalidDataException) {
            yield CryptoFeedResult.failure(InvalidDataException());
          } else {
            yield CryptoFeedResult.failure(UnknownError());
          }
        }
      }
    } catch (e) {
      yield CryptoFeedResult.failure(UnknownError());
    }
  }
}
