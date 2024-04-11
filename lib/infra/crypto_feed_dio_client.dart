import 'dart:async';
import 'dart:io'; // Untuk mengakses HttpException
import 'package:crypto_app/infra/crypto_feed_services.dart';
import 'package:crypto_app/api/remote_crpyto_feed.dart';

class CryptoFeedDioClient implements DioClient {
  final CryptoFeedService _cryptoFeedService;

  CryptoFeedDioClient(this._cryptoFeedService);
  @override
  Stream<DioClientResult> get() async* {
    try {
      yield DioClientResultSuccess(await _cryptoFeedService.get());
    } catch (error) {
      if (error is SocketException) {
        // Menangani masalah koneksi
        yield DioClientResultFailure(ConnectivityException());
      } else {
        yield DioClientResultFailure(InvalidDataException());
      }
    }
  }
}
