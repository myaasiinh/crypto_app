// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:crypto_app/api/crypto_feed_client.dart';
import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:crypto_app/domain/item_mapper_crypto_feed.dart';
import 'package:crypto_app/domain/load_crypto_feed_usecase.dart';
import 'package:crypto_app/infra/crypto_feed_dio_client.dart';

class LoadCryptoFeedRemoteUseCases extends LoadCryptoFeedUseCase {
  final CryptoFeedDioClient _httpClient;

  LoadCryptoFeedRemoteUseCases(this._httpClient) : super.success([]);

  Future<CryptoFeedResult> load() async {
    try {
      final result = await _httpClient.get().first;
      print('Response from API: $result'); // Print response from API

      if (result.data != null) {
        final mappedData = CryptoFeedMapper.fromModelResponseMapDomain(result.data);
        print('Mapped data: $mappedData'); // Print mapped data

        return CryptoFeedResult.success(mappedData as List<CryptoFeedModelDomain>?);
      } else {
        return CryptoFeedResult.success(null);
      }
    } catch (e) {
      return CryptoFeedResult.failure(UnknownError());
    }
  }
}
