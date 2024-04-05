import 'dart:async';
import 'dart:io'; // Untuk mengakses HttpException
import 'package:crypto_app/infra/crypto_feed_services.dart';
import 'package:crypto_app/infra/dio_client.dart';
import 'package:crypto_app/infra/dio_client_result.dart';
import 'package:crypto_app/utils/error_handling.dart';



class CryptoFeedDioClient implements DioClient {
  final CryptoFeedService _cryptoFeedService;

  CryptoFeedDioClient(this._cryptoFeedService);
  @override
  Stream<DioClientResult> get() async* {
    try {
      yield DioClientResult.success(await _cryptoFeedService.get());
    } catch (error) {
      if (error is SocketException) { // Menangani masalah koneksi
        yield DioClientResult.failure(ConnectivityException());
      } else {
        yield DioClientResult.failure(InvalidDataException());
      }
    }
  }
}