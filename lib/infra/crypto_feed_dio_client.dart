import 'dart:async';
import 'dart:io'; // Untuk mengakses HttpException
import 'package:crypto_app/infra/crypto_feed_services.dart';
import 'package:crypto_app/infra/dio_client.dart';
import 'package:crypto_app/utils/error_handling.dart';
import 'package:crypto_app/infra/dio_client_result.dart';

class CryptoFeedDioClient implements DioClient{
  final CryptoFeedService cryptoFeedService;

  CryptoFeedDioClient(this.cryptoFeedService);

  @override
  Stream<DioClientResult> get() async* {
    try {
      yield DioClientResult.success(await cryptoFeedService.get());
    } catch (error) {
      if (error is SocketException) {
        yield DioClientResult.failure(ConnectivityException());
      } else if (error is HttpException) {
        yield DioClientResult.failure(InvalidDataException());
      } else {
        yield DioClientResult.failure(UnknownError());
      }
    }
  }
}