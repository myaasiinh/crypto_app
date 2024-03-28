import 'package:crypto_app/api/load_crypto_feed_remote_use_case.dart';
import 'package:crypto_app/domain/crypto_feed.dart';
import 'package:crypto_app/presentation/crypto_feed_item_viewmodel.dart';
import 'package:flutter/material.dart';


class CryptoFeedViewModel extends ChangeNotifier {
  final LoadCryptoFeedRemoteUseCases loadCryptoFeedRemoteUseCases;

  CryptoFeedViewModel({required this.loadCryptoFeedRemoteUseCases});

  List<CryptoFeedItemViewModel> cryptoFeedItems = [];

  Future<void> fetchCryptoFeed() async {
    try {
      final List<CoinItem> cryptoFeed = await loadCryptoFeedRemoteUseCases();
      cryptoFeedItems = cryptoFeed.map((coinItem) => CryptoFeedItemViewModel(coinItem)).toList();
      notifyListeners();
    } catch (e) {
      // Handle error
    }
  }
}
