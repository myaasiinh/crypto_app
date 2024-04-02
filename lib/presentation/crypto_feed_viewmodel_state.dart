import 'package:crypto_app/domain/crypto_feed_domain.dart';


class CryptoFeedViewModelState {
  final bool isLoading;
  final List<CryptoFeedModelDomain> cryptoFeeds;
  final String failed;

  CryptoFeedViewModelState({
    required this.isLoading,
    required this.cryptoFeeds,
    required this.failed,
  });

  CryptoFeedViewModelState copyWith({
    bool? isLoading,
    List<CryptoFeedModelDomain>? cryptoFeeds,
    String? failed,
  }) {
    return CryptoFeedViewModelState(
      isLoading: isLoading ?? this.isLoading,
      cryptoFeeds: cryptoFeeds ?? this.cryptoFeeds,
      failed: failed ?? this.failed,
    );
  }

  CryptoFeedUiState toCryptoFeedUiState() {
    if (cryptoFeeds.isEmpty) {
      return CryptoFeedUiState.noCryptoFeed;
    } else {
      return CryptoFeedUiState.hasCryptoFeed;
    }
  }
}

enum CryptoFeedUiState { hasCryptoFeed, noCryptoFeed }
