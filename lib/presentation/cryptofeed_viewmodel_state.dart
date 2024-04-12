
import 'package:crypto_app/domain/crypto_feed.dart';
import 'package:flutter/foundation.dart';

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
