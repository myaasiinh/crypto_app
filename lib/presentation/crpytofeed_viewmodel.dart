// ignore_for_file: avoid_print, dead_code

import 'package:crypto_app/api/crypto_feed_client.dart';
import 'package:crypto_app/api/remote_crpyto_feed.dart';
import 'package:crypto_app/domain/load_crpyto_feed_use_case.dart';
import 'package:crypto_app/main/remote_crpyto_feed_loader_factory.dart';
import 'package:crypto_app/presentation/cryptofeed_item_viewmodel.dart';
import 'package:crypto_app/presentation/cryptofeed_viewmodel_state.dart';
import 'package:flutter/foundation.dart';

class CryptoFeedViewModel extends ChangeNotifier {
  final LoadCryptoFeedUseCases loadCryptoFeedUseCases;
  CryptoFeedViewModel({required this.loadCryptoFeedUseCases}) {
    loadCryptoFeed();
  }
  CryptoFeedViewModelState _cryptoFeedViewModelState = CryptoFeedViewModelState(
    isLoading: true,
    failed: '',
  );
  CryptoFeedViewModelState get cryptoFeedViewModelState =>
      _cryptoFeedViewModelState;
  void loadCryptoFeed() {
    loadCryptoFeedUseCases.load().listen((result) {
      if (result is CryptoFeedClienttSuccess) {
        _cryptoFeedViewModelState = CryptoFeedViewModelState(
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
        _cryptoFeedViewModelState = CryptoFeedViewModelState(
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

  List<CryptoFeedItemViewModel> get cryptoFeedItems {
    if (_cryptoFeedViewModelState.cryptoFeeds.isNotEmpty) {
      final hasCryptoFeedState = _cryptoFeedViewModelState;
      return hasCryptoFeedState.cryptoFeeds
          .expand((feed) => feed.data
              .map((datum) => CryptoFeedItemViewModel.fromDomain(datum)))
          .toList();
          print('CryptoFeedViewModel item: ${hasCryptoFeedState.cryptoFeeds.map((e) => e.data.map((e) => e.coinInfo.name).toList()).toList()}');
    } else {
      return [];
    }
  }

  static CryptoFeedViewModel create() {
    return CryptoFeedViewModel(
      loadCryptoFeedUseCases:
          RemoteCryptoFeedLoaderFactory.createRemoteCryptoFeedLoader(),
    );
  }
}
