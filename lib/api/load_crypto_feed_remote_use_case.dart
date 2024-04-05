
// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:crypto_app/api/crypto_feed_result.dart';
import 'package:crypto_app/api/crypto_feed_loader.dart';
import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:crypto_app/domain/item_mapper_crypto_feed.dart';
import 'package:crypto_app/infra/crypto_feed_response.dart';
import 'package:crypto_app/infra/dio_client.dart';
import 'package:crypto_app/utils/error_handling.dart';
import 'package:crypto_app/utils/status_network.dart';
import 'package:flutter/foundation.dart';

class LoadCryptoFeedRemoteUseCases implements CryptoFeedLoader {
  final DioClient _dioClient;

  LoadCryptoFeedRemoteUseCases(this._dioClient);

  @override
  Stream<CryptoFeedResult> load() async* {
    try {
      await for (var result in _dioClient.get()) {
        if (result.type == StatusNetworkType.success) {
          final cryptoFeed = result.data;
          if (cryptoFeed!.data.isNotEmpty) {
            final mappedData = CryptoFeedMapper.fromModelResponseMapDomain(cryptoFeed.data as CryptoFeedModelResponses);
            yield CryptoFeedResult.success(mappedData as List<CryptoFeedModelDomain>?);
            if (kDebugMode) {
              print('LoadCryptoFeedRemoteUseCases Sukses Mapped Data: $mappedData');
            }
          } else {
            yield CryptoFeedResult.success([]);
          }
        } else {
          if (result.error is ConnectivityException) {
            yield CryptoFeedResult.failure(ConnectivityException());
             if (kDebugMode) {
              print('LoadCryptoFeedRemoteUseCases Sukses Mapped Data: $ConnectivityException');
            }
          } else if (result.error is InvalidDataException) {
            yield CryptoFeedResult.failure(InvalidDataException());
             if (kDebugMode) {
              print('LoadCryptoFeedRemoteUseCases Sukses Mapped Data: $InvalidDataException');
            }
          } else {
            yield CryptoFeedResult.failure(UnknownError());
            print('LoadCryptoFeedRemoteUseCases Sukses Mapped Data: $UnknownError');

          }
        }
      }
    } catch (e) {
      yield CryptoFeedResult.failure(UnknownError());
    }
  }
}
