import 'package:crypto_app/infra/crypto_feed_response.dart';
import 'package:crypto_app/infra/crypto_feed_services.dart';
import 'package:crypto_app/utils/error_handling.dart';
import 'package:crypto_app/infra/dio_client_result.dart';

class CryptoFeedClient {
  final CryptoFeedService _cryptoFeedService;
  
  CryptoFeedClient(this._cryptoFeedService);

  Future<DioClientResult> get() async {
    try {
      final result = _cryptoFeedService.get();
      return DioClientResult.success(result as CryptoFeedModelResponses?);
    } on ConnectivityException catch (e) {
      return DioClientResult.failure(ConnectivityException(message: e.message));
    } on InvalidDataException catch (e) {
      return DioClientResult.failure(InvalidDataException(message: e.message));
    } catch (e) {
      return DioClientResult.failure(Exception());
    }
  }
}
