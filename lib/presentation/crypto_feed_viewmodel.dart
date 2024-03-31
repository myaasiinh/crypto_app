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
  bool _isLoading = true;

  List<CryptoFeedModelDomain>? get cryptoFeeds => _cryptoFeeds;
  String? get error => _error;
  bool get isLoading => _isLoading;

  Future<void> loadCryptoFeed() async {
    _isLoading = true;
    notifyListeners();

    final result = await _cryptoFeedUseCase.load();
    if (result.type == CryptoFeedResult.success) {
      _cryptoFeeds = result.data;
    } else {
      _error = result.type.name;
    }
    
    _isLoading = false;
    notifyListeners();
  }
}