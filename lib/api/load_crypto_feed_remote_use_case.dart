import 'package:crypto_app/api/crypto_feed_client.dart';
import 'package:crypto_app/api/remote_crpyto_feed.dart';
import 'package:crypto_app/domain/item_mapper_crypto_feed.dart';
import 'package:crypto_app/domain/load_crpyto_feed_use_case.dart';
import 'package:flutter/foundation.dart';

class LoadCryptoFeedRemoteUseCases implements LoadCryptoFeedUseCases {
  final DioClient _dioClient;

  LoadCryptoFeedRemoteUseCases(this._dioClient);

  @override
  Stream<CryptoFeedResult> load() async* {
    await for (var result in _dioClient.get()) {
      if (result is DioClientResultSuccess) {
        final cryptoFeed = result.data;
        if (cryptoFeed.data.isNotEmpty) {
          yield CryptoFeedResultSuccess(cryptoFeed.toDomain());
          if (kDebugMode) {
            print(
                'LoadCryptoFeedRemoteUseCases Sukses Mapped Data: $cryptoFeed');
          }
        } else {
          yield CryptoFeedResultSuccess([]);
        }
      } else {
        if (result is ConnectivityException) {
          yield CryptoFeedResultFailure(ConnectivityException());
          if (kDebugMode) {
            print(
                'LoadCryptoFeedRemoteUseCases Error Mapped Data Connectivity: $ConnectivityException');
          }
        } else if (result is InvalidDataException) {
          yield CryptoFeedResultFailure(InvalidDataException());
          if (kDebugMode) {
            print(
                'LoadCryptoFeedRemoteUseCases Error Mapped Data Invalid Data: $InvalidDataException');
          }
        }
      }
    }
  }
}
