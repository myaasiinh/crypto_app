import 'package:crypto_app/infra/crypto_feed_response.dart';
import 'package:crypto_app/infra/crypto_feed_services.dart';
import 'package:crypto_app/utils/http_client.dart';

class CryptoFeedClient {
  final CryptoFeedService _cryptoFeedService;
  
  CryptoFeedClient(this._cryptoFeedService);

  Future<HttpClientResult> get() async {
    try {
      final result = _cryptoFeedService.get();
      return HttpClientResult.success(result as CryptoFeedModelResponses?);
    } on ConnectivityException catch (e) {
      return HttpClientResult.failure(ConnectivityException(message: e.message));
    } on InvalidDataException catch (e) {
      return HttpClientResult.failure(InvalidDataException(message: e.message));
    } catch (e) {
      return HttpClientResult.failure(Exception());
    }
  }
}
