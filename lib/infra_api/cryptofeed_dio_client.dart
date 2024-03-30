import 'dart:async';
import 'dart:io'; // Untuk mengakses HttpException
import 'package:crypto_app/infra_api/crypto_feed_services.dart';
import 'package:crypto_app/utils/handle_error_utils.dart';

class CryptoFeedHttpClient {
  final CryptoFeedService _cryptoFeedService;

  CryptoFeedHttpClient(this._cryptoFeedService);

  Stream<HttpClientResult> get() async* {
    try {
      yield HttpClientResult.success(await _cryptoFeedService.get());
    } catch (error) {
      if (error is SocketException) { // Menangani masalah koneksi
        yield HttpClientResult.failure(ConnectivityException());
      } else {
        yield HttpClientResult.failure(InvalidDataException());
      }
    }
  }
}
