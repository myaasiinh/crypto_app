import 'package:crypto_app/infra/crypto_feed_response.dart';
import 'package:crypto_app/utils/status_network.dart';

class DioClientResult {
  StatusNetworkType type;
  CryptoFeedModelResponses? data; // Marking data as nullable
  dynamic error;

  DioClientResult.success(this.data) : type = StatusNetworkType.success;

  DioClientResult.failure(this.error) : type = StatusNetworkType.failure;
}

