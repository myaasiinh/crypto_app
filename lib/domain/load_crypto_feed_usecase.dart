import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:crypto_app/utils/status_network.dart';


class LoadCryptoFeedUseCase {
  final StatusNetworkType type;
  final List<CryptoFeedModelDomain>? data;
  final dynamic error;

  LoadCryptoFeedUseCase.success(this.data)
      : type = StatusNetworkType.success,
        error = null;

  LoadCryptoFeedUseCase.failure(this.error)
      : type = StatusNetworkType.failure,
        data = null;
}
