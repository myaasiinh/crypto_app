import 'package:crypto_app/api/crypto_feed_client.dart';
import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:crypto_app/domain/item_mapper_crypto_feed.dart';
import 'package:crypto_app/domain/load_crypto_feed_usecase.dart';
import 'package:crypto_app/infra_api/crypto_feed_dio_client.dart';

class LoadCryptoFeedRemoteUseCases extends LoadCryptoFeedUseCase {
  final CryptoFeedHttpClient _httpClient;

  LoadCryptoFeedRemoteUseCases(this._httpClient) : super.success(CryptoFeedResult.success([]) as List<CryptoFeedModelDomain>?);

  @override
  Future<CryptoFeedResult> load() async {
    try {
      final result = await _httpClient.get().first;
      return result.data(
        (success) {
          if (success.data != null) {
            final mappedData = CryptoFeedItemsMapper.map(success.data);
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
