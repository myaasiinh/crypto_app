// ignore_for_file: avoid_print

import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/main/remote_crpyto_feed_loader_factory.dart';
import 'package:crypto_app/presentation/crypto_feed_viewmodel_state.dart';
import 'package:crypto_app/utils/http_client.dart';
import 'package:crypto_app/utils/status_network.dart';
import 'package:flutter/foundation.dart';

class CryptoFeedViewModel extends ChangeNotifier {
  final CryptoFeedLoader cryptoFeedLoader;

  CryptoFeedViewModel({required this.cryptoFeedLoader}) {
    loadCryptoFeed();
  }

  CryptoFeedUiState _cryptoFeedUiState = const CryptoFeedUiState.noCryptoFeed(
    isLoading: true,
    failed: '',
  );

  CryptoFeedUiState get cryptoFeedUiState => _cryptoFeedUiState;

  void loadCryptoFeed() {
    cryptoFeedLoader.load().listen((result) {
      if (result.type == StatusNetworkType.success) {
        _cryptoFeedUiState = CryptoFeedUiState.hasCryptoFeed(
          isLoading: false,
          cryptoFeeds: result.cryptoFeedItems!,
          failed: '',
        );
        print('CryptoFeedViewModel: ${result.cryptoFeedItems!.length}');
      } else if (result.type == StatusNetworkType.failure) {
        _cryptoFeedUiState = CryptoFeedUiState.noCryptoFeed(
          isLoading: false,
          failed: _getFailedMessage(result.error),
        );
        print('CryptoFeedViewModel: ${result.error}');
      }
      notifyListeners();
    });
  }

  String _getFailedMessage(dynamic error) {
    if (error is ConnectivityException) {
      return 'Connectivity';
    } else if (error is InvalidDataException) {
      return 'Invalid Data';
    } else {
      return 'Something Went Wrong';
    }
  }

  static CryptoFeedViewModel create() {
    return CryptoFeedViewModel(
      cryptoFeedLoader: RemoteCryptoFeedLoaderFactory.createRemoteCryptoFeedLoader(),
    );
  }
}
