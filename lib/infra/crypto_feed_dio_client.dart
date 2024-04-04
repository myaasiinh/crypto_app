import 'dart:async';
import 'dart:io'; // Untuk mengakses HttpException
import 'package:crypto_app/infra/crypto_feed_services.dart';
import 'package:crypto_app/utils/crypto_feed_http_client.dart';
import 'package:crypto_app/utils/error_handling.dart';
import 'package:crypto_app/utils/http_client_result.dart';

class CryptoFeedDioClient implements CryptoFeedHttpClient {
  final CryptoFeedService _cryptoFeedService;

  CryptoFeedDioClient(this._cryptoFeedService);

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
