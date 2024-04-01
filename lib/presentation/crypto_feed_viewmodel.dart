// ignore_for_file: unrelated_type_equality_checks

import 'package:crypto_app/api/load_crypto_feed_remote_use_case.dart';
import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/main/crypto_feed_dio_client_factory%20.dart';
import 'package:crypto_app/presentation/crypto_feed_notifier.dart';

class CryptoFeedViewModel {
  final LoadCryptoFeedRemoteUseCases _cryptoFeedUseCase;

  CryptoFeedViewModel(this._cryptoFeedUseCase) {
    loadCryptoFeed();
  }

  // Fungsi untuk memuat data dan memperbarui objek penerbit
  Future<void> loadCryptoFeed() async {
    // Menampilkan loading indicator
    CryptoFeedNotifier().updateCryptoFeed(null, null, true);

    try {
      final result = await _cryptoFeedUseCase.load();

      if (result.type == CryptoFeedResult.success) {
        // Jika sukses, update data dan hapus error
        CryptoFeedNotifier().updateCryptoFeed(result.data, null, false);
      } else {
        // Jika gagal, update error dan hapus data
        CryptoFeedNotifier().updateCryptoFeed(null, result.error, false);
      }
    } catch (e) {
      // Jika terjadi exception, update error dan hapus data
      CryptoFeedNotifier().updateCryptoFeed(null, 'Error loading data', false);
    }
  }
}

class CryptoFeedViewModelFactory {
  static CryptoFeedViewModel createCryptoFeedViewModel() {
    return CryptoFeedViewModel(
      LoadCryptoFeedRemoteUseCases(
        CryptoFeedDioClientFactory.createCryptoFeedDioClient(),
      ),
    );
  }
}