// ignore_for_file: avoid_print

import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:crypto_app/domain/item_mapper_crypto_feed.dart';
import 'package:crypto_app/infra/crypto_feed_dio_client.dart';
import 'package:crypto_app/utils/http_client.dart';


class LoadCryptoFeedRemoteUseCases extends CryptoFeedLoader {
  final CryptoFeedDioClient _httpClient;

  LoadCryptoFeedRemoteUseCases(this._httpClient) : super();

  @override
  Stream<CryptoFeedResult> load() {
    try {
      return _httpClient.get().asyncMap((result) async {
        // Print response from API
        print('Response from API: $result');

        if (result.data !=null) {
          final mappedData = CryptoFeedMapper.fromModelResponseMapDomain(result.data!);
          return CryptoFeedResult.success(mappedData as List<CryptoFeedModelDomain>?);
        } else {
          return CryptoFeedResult.failure(UnknownError());
        }
      });
    } catch (e) {
      return Stream.value(CryptoFeedResult.failure(UnknownError()));
    }
  }
}

