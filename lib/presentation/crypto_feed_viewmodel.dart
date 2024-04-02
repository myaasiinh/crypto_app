// ignore_for_file: avoid_print

import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/main/remote_crpyto_feed_loader_factory.dart';
import 'package:crypto_app/presentation/crypto_feed_viewmodel_state.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/domain/load_crypto_feed_usecase.dart';
import 'package:crypto_app/utils/http_client.dart';
import 'package:crypto_app/utils/status_network.dart';

class CryptoFeedViewModel extends ChangeNotifier {
  final CryptoFeedLoader cryptoFeedLoader;
  CryptoFeedViewModelState _viewModelState =
      CryptoFeedViewModelState(
        cryptoFeeds:  [],
        isLoading: false, 
        failed: ''
      );

  CryptoFeedViewModel(this.cryptoFeedLoader) {
    loadCryptoFeed();
  }

  CryptoFeedUiState get cryptoFeedUiState {
    return _viewModelState.toCryptoFeedUiState();
  }

  Future<void> loadCryptoFeed() async {
    try {
      final result = await cryptoFeedLoader.load().first;
      print("loadCryptoFeed: $result");
      if (result is LoadCryptoFeedUseCase) {
        if (result.type == StatusNetworkType.success) {
          _viewModelState = _viewModelState.copyWith(
            cryptoFeeds: result.cryptoFeedItems!,
            isLoading: false,
          );
        } else {
          _viewModelState = _viewModelState.copyWith(
            failed: result.error is ConnectivityException
                ? "Connectivity"
                : result.error is InvalidDataException
                    ? "Invalid Data"
                    : "Something Went Wrong",
            isLoading: false,
          );
        }
      }
      notifyListeners();
    } catch (e) {
      print("Unknown error: $e");
    }
  }

  static CryptoFeedViewModel create() {
    return CryptoFeedViewModel(
      RemoteCryptoFeedLoaderFactory.createRemoteCryptoFeedLoader() as CryptoFeedLoader,
    );
  }
}
