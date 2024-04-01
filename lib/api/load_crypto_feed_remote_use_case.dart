// ignore_for_file: avoid_print

import 'package:crypto_app/api/crypto_feed_client.dart';
import 'package:crypto_app/api/remote_crypto_feed.dart';
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
      
      return result.data(
        (success) {
          if (success.data != null) {
            final mappedData = CryptoFeedItemsMapper.map(success.data);
            print('Mapped data: $mappedData'); // Print mapped data
            return CryptoFeedResult.success(mappedData);
          } else {
            return CryptoFeedResult.success(null);
          }
        },
        (failure) {
          if (failure.error is ConnectivityException) {
            return CryptoFeedResult.failure(ConnectivityException());
          } else if (failure.error is InvalidDataException) {
            return CryptoFeedResult.failure(InvalidDataException());
          } else {
            return CryptoFeedResult.failure(UnknownError());
          }
        },
      );
    } catch (e) {
      return CryptoFeedResult.failure(UnknownError());
    }
  }
}
