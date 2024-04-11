import 'package:crypto_app/api/crypto_feed_client.dart';
import 'package:crypto_app/api/remote_crpyto_feed.dart';
import 'package:crypto_app/domain/crypto_feed_mapper_extension.dart';
import 'package:crypto_app/domain/load_crpyto_feed_use_case.dart';
import 'package:flutter/foundation.dart';

class LoadCryptoFeedRemoteUseCases implements LoadCryptoFeedUseCases {
  final RemoteCryptoFeed _remoteCryptoFeed;

  LoadCryptoFeedRemoteUseCases(this._remoteCryptoFeed);

  @override
  Stream<CryptoFeedClient> load() async* {
    await for (var result in _remoteCryptoFeed.get()) {
      if (result is RemoteCryptoFeedSuccess) {
        final cryptoFeed = result.data;
        if (cryptoFeed.data.isNotEmpty) {
          yield CryptoFeedClienttSuccess(cryptoFeed.toDomain());
          if (kDebugMode) {
            print(
                'LoadCryptoFeedRemoteUseCases Sukses Mapped Data: $cryptoFeed');
          }
        } else {
          yield CryptoFeedClienttSuccess([]);
        }
      } else {
        if (result is ConnectivityException) {
          yield CryptoFeedClientFailure(ConnectivityException());
          if (kDebugMode) {
            print(
                'LoadCryptoFeedRemoteUseCases Error Mapped Data Connectivity: $ConnectivityException');
          }
        } else if (result is InvalidDataException) {
          yield CryptoFeedClientFailure(InvalidDataException());
          if (kDebugMode) {
            print(
                'LoadCryptoFeedRemoteUseCases Error Mapped Data Invalid Data: $InvalidDataException');
          }
        }
      }
    }
  }
}
