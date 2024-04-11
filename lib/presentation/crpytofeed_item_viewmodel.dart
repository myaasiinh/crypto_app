// ignore_for_file: avoid_print

import 'package:crypto_app/api/crypto_feed_client.dart';
import 'package:crypto_app/api/remote_crpyto_feed.dart';
import 'package:crypto_app/domain/crypto_feed.dart';
import 'package:crypto_app/domain/load_crpyto_feed_use_case.dart';
import 'package:crypto_app/main/remote_crpyto_feed_loader_factory.dart';
import 'package:flutter/foundation.dart';

class CryptoFeedViewModel extends ChangeNotifier {
  final LoadCryptoFeedUseCases loadCryptoFeedUseCases;
  CryptoFeedViewModel({required this.loadCryptoFeedUseCases}) {
    loadCryptoFeed();
  }
  CryptoFeedUiState _cryptoFeedUiState = const CryptoFeedUiState.noCryptoFeed(
    isLoading: true,
    failed: '',
  );
  CryptoFeedUiState get cryptoFeedUiState => _cryptoFeedUiState;
  void loadCryptoFeed() {
    loadCryptoFeedUseCases.load().listen((result) {
      if (result is CryptoFeedClienttSuccess) {
        _cryptoFeedUiState = CryptoFeedUiState.hasCryptoFeed(
          isLoading: false,
          cryptoFeeds: result.data,
          failed: '',
        );
        print(
            'CryptoFeedViewModel: ${result.data.map((e) => e.data.map((e) => e.coinInfo.name).toList()).toList()}');
        print(
            'CryptoFeedViewModel: ${result.data.map((e) => e.data.map((e) => e.display.usd.price).toList()).toList()}');
        print(
            'CryptoFeedViewModel: ${result.data.map((e) => e.data.map((e) => e.raw.usd.changepctday).toList()).toList()}');
      } else if (result is CryptoFeedClientFailure) {
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
      return 'Unknown Error';
    }
  }

  static CryptoFeedViewModel create() {
    return CryptoFeedViewModel(
      loadCryptoFeedUseCases:
          RemoteCryptoFeedLoaderFactory.createRemoteCryptoFeedLoader(),
    );
  }
}


class CryptoFeedViewModelState {
  final bool isLoading;
  final List<CryptoFeedModelDomain> cryptoFeeds;
  final String failed;

  CryptoFeedViewModelState({
    this.isLoading = false,
    this.cryptoFeeds = const [],
    this.failed = '',
  });

  CryptoFeedUiState toCryptoFeedUiState() {
    if (cryptoFeeds.isEmpty) {
      return CryptoFeedUiState.noCryptoFeed(
        isLoading: isLoading,
        failed: failed,
      );
    } else {
      return CryptoFeedUiState.hasCryptoFeed(
        isLoading: isLoading,
        cryptoFeeds: cryptoFeeds,
        failed: failed,
      );
    }
  }
}

@immutable
abstract class CryptoFeedUiState {
  const CryptoFeedUiState();

  const factory CryptoFeedUiState.noCryptoFeed({
    required bool isLoading,
    required String failed,
  }) = NoCryptoFeed;

  const factory CryptoFeedUiState.hasCryptoFeed({
    required bool isLoading,
    required List<CryptoFeedModelDomain> cryptoFeeds,
    required String failed,
  }) = HasCryptoFeed;
}

@immutable
class NoCryptoFeed extends CryptoFeedUiState {
  final bool isLoading;
  final String failed;

  const NoCryptoFeed({
    required this.isLoading,
    required this.failed,
  });
}

@immutable
class HasCryptoFeed extends CryptoFeedUiState {
  final bool isLoading;
  final List<CryptoFeedModelDomain> cryptoFeeds;
  final String failed;

  const HasCryptoFeed({
    required this.isLoading,
    required this.cryptoFeeds,
    required this.failed,
  });
}
