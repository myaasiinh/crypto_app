import 'package:crypto_app/utils/http_client_result.dart';

abstract class CryptoFeedHttpClient {
  Stream<HttpClientResult> get();
}
