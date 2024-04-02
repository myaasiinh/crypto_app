// ignore_for_file: avoid_print

import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:crypto_app/domain/item_mapper_crypto_feed.dart';
import 'package:crypto_app/domain/load_crypto_feed_usecase.dart';
import 'package:crypto_app/infra/crypto_feed_dio_client.dart';
import 'package:crypto_app/infra/crypto_feed_response.dart';
import 'package:crypto_app/utils/http_client.dart';

class LoadCryptoFeedRemoteUseCases extends LoadCryptoFeedUseCase {
  final CryptoFeedDioClient _httpClient;

  LoadCryptoFeedRemoteUseCases(this._httpClient) : super.success([]);

  Future<CryptoFeedResult> load() async {
    try {
      final result = await _httpClient.get().first;
      // Print response from API
      print('Response from API: $result');

      if (result.data != null) {
        final mappedData = CryptoFeedMapper.fromModelResponseMapDomain(result as CryptoFeedModelResponses);
        print('Mapped data: ${mappedData.data.single.coinInfo.fullName}');
        return CryptoFeedResult.success(mappedData as List<CryptoFeedModelDomain>?);
      } else {
        return CryptoFeedResult.success(null);
      }
    } catch (e) {
      return CryptoFeedResult.failure(UnknownError());
    }
  }
}
