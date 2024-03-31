import 'package:crypto_app/infra/crypto_feed_services.dart';

class CryptoFeedClient {
  final CryptoFeedService _cryptoFeedService;
  
  CryptoFeedClient(this._cryptoFeedService);

  Future<HttpClientResult> get() async {
    try {
      final result = _cryptoFeedService.get();
      return HttpClientResult.success(result);
    } on ConnectivityException catch (e) {
      return HttpClientResult.failure(ConnectivityException(message: e.message));
    } on InvalidDataException catch (e) {
      return HttpClientResult.failure(InvalidDataException(message: e.message));
    } catch (e) {
      return HttpClientResult.failure(Exception());
    }
  }
}

class HttpClientResult<T> {
  final T? data;
  final Exception? error;

  HttpClientResult.success(this.data) : error = null;
  HttpClientResult.failure(this.error) : data = null;
}

// Exception untuk menangani masalah koneksi
class ConnectivityException implements Exception {
  final String message;

  ConnectivityException({this.message = 'No internet connection'}) : super();
}

// Exception untuk menangani data yang tidak valid
class InvalidDataException implements Exception {
  final String message;

  InvalidDataException({this.message = 'Invalid data'}) : super();
}

// Exception untuk menangani error tidak diketahui
class UnknownError implements Exception {}