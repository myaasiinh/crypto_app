import 'package:crypto_app/domain/crypto_feed.dart';

enum ResultType { success, failure }

class LoadCryptoFeedUseCase {
  final ResultType type;
  final List<CryptoFeedModel>? data;
  final dynamic error;

  LoadCryptoFeedUseCase.success(this.data)
      : type = ResultType.success,
        error = null;

  LoadCryptoFeedUseCase.failure(this.error)
      : type = ResultType.failure,
        data = null;
}
