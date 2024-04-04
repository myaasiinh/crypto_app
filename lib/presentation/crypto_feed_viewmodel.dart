// ignore_for_file: avoid_print

import 'package:crypto_app/utils/http_client.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/presentation/crypto_feed_viewmodel_state.dart';
import 'package:crypto_app/domain/load_crypto_feed_usecase.dart';
import 'package:crypto_app/utils/status_network.dart';
import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/main/remote_crpyto_feed_loader_factory.dart';

class CryptoFeedViewModel extends ChangeNotifier {
  final CryptoFeedLoader cryptoFeedLoader;
  CryptoFeedViewModelState _viewModelState =
      CryptoFeedViewModelState(
        cryptoFeeds: [],
        isLoading: true,
        failed: '',
      );

  CryptoFeedViewModel(this.cryptoFeedLoader) {
    loadCryptoFeed();
  }

  CryptoFeedViewModelState get viewModelState => _viewModelState;

  Stream<CryptoFeedUiState> get cryptoFeedUiState async* {
    yield* cryptoFeedLoader.load().map((result) {
      if (result is LoadCryptoFeedUseCase) {
        if (result.type == StatusNetworkType.success) {
          return CryptoFeedUiState.hasCryptoFeed;
        } else {
          return CryptoFeedUiState.noCryptoFeed;
        }
      } else {
        return CryptoFeedUiState.noCryptoFeed;
      }
    });
  }

  Future<void> loadCryptoFeed() async {
    try {
      final result = await cryptoFeedLoader.load().single;
      print("loadCryptoFeed: $result");
      if (result is LoadCryptoFeedUseCase) {
        if (result.type == StatusNetworkType.success) {
          _viewModelState = CryptoFeedViewModelState(
            cryptoFeeds: result.cryptoFeedItems!,
            isLoading: false,
            failed: '',
          );
          print("loadCryptoFeed: $result");
        } else {
          _viewModelState = CryptoFeedViewModelState(
            cryptoFeeds: [],
            isLoading: false,
            failed: result.error is ConnectivityException
              ? "Connectivity"
              : result.error is InvalidDataException
                ? "Invalid Data"
                : "Something Went Wrong",
          );
        }
      }
    } catch (e) {
      _viewModelState = CryptoFeedViewModelState(
        cryptoFeeds: [],
        isLoading: false,
        failed: "Unknown error: $e",
      );
    }
    notifyListeners();
  }

  static CryptoFeedViewModel create() {
    return CryptoFeedViewModel(
      RemoteCryptoFeedLoaderFactory.createRemoteCryptoFeedLoader(),
    );
  }
}
