import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:flutter/material.dart';

class CryptoFeedNotifier extends ChangeNotifier {
  // Menyimpan data yang akan diobservasi
  List<CryptoFeedModelDomain>? _cryptoFeeds;
  String? _error;
  bool _isLoading = false;

  // Getter untuk mendapatkan data yang akan diobservasi
  List<CryptoFeedModelDomain>? get cryptoFeeds => _cryptoFeeds;
  String? get error => _error;
  bool get isLoading => _isLoading;

  // Fungsi untuk memperbarui data dan memberi tahu semua observer
  Future<void> updateCryptoFeed(List<CryptoFeedModelDomain>? cryptoFeeds, String? error, bool isLoading) async {
    _cryptoFeeds = cryptoFeeds;
    _error = error;
    _isLoading = isLoading;
    notifyListeners();
  }
}
