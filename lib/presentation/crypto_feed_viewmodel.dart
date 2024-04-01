// CryptoFeedViewModel.dart
// ignore_for_file: unrelated_type_equality_checks

import 'package:crypto_app/api/load_crypto_feed_remote_use_case.dart';
import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:crypto_app/main/crypto_feed_dio_client_factory%20.dart';
import 'package:crypto_app/main/remote_crpyto_feed_loader_factory.dart';
import 'package:flutter/material.dart';



class CryptoFeedViewModel extends ChangeNotifier {
  final LoadCryptoFeedRemoteUseCases _cryptoFeedUseCase;

  CryptoFeedViewModel(this._cryptoFeedUseCase) {
    loadCryptoFeed();
  }

  List<CryptoFeedModelDomain> _cryptoFeeds = [];
  List<CryptoFeedModelDomain> get cryptoFeeds => _cryptoFeeds;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> loadCryptoFeed() async {
    try {
      _isLoading = true;
      notifyListeners();

      final result = await _cryptoFeedUseCase.load();

      if (result.type == CryptoFeedResult.success) {
        _cryptoFeeds = result.data!;
        _error = null;
      } else {
        _error = result.error;
      }
    } catch (e) {
      _error = 'Error loading data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

// Buat sebuah factory untuk menginisialisasi ViewModel
class CryptoFeedViewModelFactory {
  static CryptoFeedViewModel createCryptoFeedViewModel() {
    return CryptoFeedViewModel(
      LoadCryptoFeedRemoteUseCases(CryptoFeedDioClientFactory.createCryptoFeedDioClient()),
    );
  }
}

