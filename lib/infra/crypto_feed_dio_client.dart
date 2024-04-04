import 'dart:async';
import 'dart:io'; // Untuk mengakses HttpException
import 'package:crypto_app/infra/crypto_feed_services.dart';
import 'package:crypto_app/utils/crypto_feed_http_client.dart';
import 'package:crypto_app/utils/error_handling.dart';
import 'package:crypto_app/utils/http_client_result.dart';

class CryptoFeedDioClient implements CryptoFeedHttpClient{
  final CryptoFeedService cryptoFeedService;

  CryptoFeedDioClient(this.cryptoFeedService);

  @override
  Stream<HttpClientResult> get() async* {
    try {
      yield HttpClientResult.success(await cryptoFeedService.get());
    } catch (error) {
      if (error is IOException) {
        yield HttpClientResult.failure(ConnectivityException());
      } else if (error is HttpException) {
        yield HttpClientResult.failure(InvalidDataException());
      } else {
        yield HttpClientResult.failure(UnknownError());
      }
    }
  }
}