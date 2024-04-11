import 'dart:async';
import 'dart:io'; // Untuk mengakses HttpException
import 'package:crypto_app/infra/crypto_feed_services.dart';
import 'package:crypto_app/api/remote_crpyto_feed.dart';

class CryptoFeedDioClient implements RemoteCryptoFeed {
  final CryptoFeedService _cryptoFeedService;

  CryptoFeedDioClient(this._cryptoFeedService);
  @override
  Stream<RemoteCryptoFeedResult> get() async* {
    try {
      yield RemoteCryptoFeedSuccess(await _cryptoFeedService.get());
    } catch (error) {
      if (error is SocketException) {
        yield RemoteCryptoFeedFailure(ConnectivityException());
      } else {
        yield RemoteCryptoFeedFailure(InvalidDataException());
      }
    }
  }
}
