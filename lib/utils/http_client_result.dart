import 'package:crypto_app/infra/crypto_feed_response.dart';
import 'package:crypto_app/utils/status_network.dart';

class HttpClientResult {
  StatusNetworkType type;
  CryptoFeedModelResponses? data; // Marking data as nullable
  dynamic error;

  HttpClientResult.success(this.data) : type = StatusNetworkType.success;

  HttpClientResult.failure(this.error) : type = StatusNetworkType.failure;
}

