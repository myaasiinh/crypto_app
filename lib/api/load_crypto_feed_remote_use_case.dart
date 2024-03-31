import 'package:crypto_app/api/crypto_feed_client.dart';
import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/domain/crypto_feed.dart';
import 'package:crypto_app/domain/load_crypto_feed_usecase.dart';
import 'package:crypto_app/infra_api/cryptofeed_dio_client.dart';


 abstract class LoadCryptoFeedRemoteUseCase implements LoadCryptoFeedUseCase {
  final CryptoFeedHttpClient _httpClient;

  LoadCryptoFeedRemoteUseCase(this._httpClient);

  @override
  Future<CryptoFeedResult> load() async {
    try {
      final result = await _httpClient.get().first;
      return result.map(
        (success) => CryptoFeedResult.success(
          success.data != null ? CryptoFeedModel(success.data!) : null,
        ),
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
