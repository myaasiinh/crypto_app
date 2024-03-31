// ignore_for_file: unrelated_type_equality_checks

import 'package:crypto_app/api/load_crypto_feed_remote_use_case.dart';
import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:flutter/material.dart';

class CryptoFeedViewModel extends ChangeNotifier {
  final LoadCryptoFeedRemoteUseCases _cryptoFeedUseCase;

  CryptoFeedViewModel(this._cryptoFeedUseCase) {
    loadCryptoFeed();
  }

  List<CryptoFeedModelDomain>? _cryptoFeeds;
  String? _error;
  bool _isLoading = false;

  List<CryptoFeedModelDomain>? get cryptoFeeds => _cryptoFeeds;
  String? get error => _error;
  bool get isLoading => _isLoading;

  Future<void> loadCryptoFeed() async {
    try {
      _isLoading = true; // Set isLoading to true before fetching data
      notifyListeners();

      final result = await _cryptoFeedUseCase.load();
      if (result.type == CryptoFeedResult.success) {
        _cryptoFeeds = result.data;
        _error = null; // Reset error if data is loaded successfully
      } else {
        _error = result.type.name;
        _cryptoFeeds = null; // Reset data if there's an error
      }
    } catch (e) {
      _error = 'Error loading data'; // Handle exception/error
      _cryptoFeeds = null; // Reset data in case of error
    } finally {
      _isLoading = false; // Update isLoading after data fetching completes
      notifyListeners(); // Notify listeners after data fetching is completed
    }
  }
}
