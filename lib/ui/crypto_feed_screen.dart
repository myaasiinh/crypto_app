// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:crypto_app/presentation/crypto_feed_viewmodel.dart';
import 'package:crypto_app/presentation/crypto_feed_viewmodel_state.dart';
import 'package:crypto_app/ui/widgets/cardview_crypto.dart';

class CryptoFeedScreen extends StatefulWidget {
  const CryptoFeedScreen({super.key});

  @override
  _CryptoFeedScreenState createState() => _CryptoFeedScreenState();
}

class _CryptoFeedScreenState extends State<CryptoFeedScreen> {
  late final CryptoFeedViewModel viewModel;
  late final _pullRefreshState = GlobalKey<RefreshIndicatorState>();
  late StreamController<CryptoFeedUiState> _streamController;
  late Stream<CryptoFeedUiState> _stream;

  @override
  void initState() {
    super.initState();
    viewModel = CryptoFeedViewModel.create();
    _streamController = StreamController<CryptoFeedUiState>();
    _stream = _streamController.stream;
    viewModel.addListener(() {
      _streamController.add(viewModel.cryptoFeedUiState);
    });
    viewModel.loadCryptoFeed();
  }

  Future<void> _handleRefresh() async {
    // Panggil fungsi loadCryptoFeed pada viewModel
    viewModel.loadCryptoFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Feed'),
      ),
      body: RefreshIndicator(
        key: _pullRefreshState,
        onRefresh: _handleRefresh, // Ganti pemanggilan fungsi refresh
        child: StreamBuilder<CryptoFeedUiState>(
          stream: _stream,
          initialData:
              const CryptoFeedUiState.noCryptoFeed(isLoading: true, failed: ''),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final state = snapshot.data!;
              return _buildBody(state);
            }
          },
        ),
      ),
    );
  }

  Widget _buildBody(CryptoFeedUiState state) {
    if (state is NoCryptoFeed) {
      return Center(child: Text(state.failed));
    } else if (state is HasCryptoFeed) {
      return CryptoFeedList(
        items: state.cryptoFeeds,
      );
    } else {
      return const Center(child: Text('Unknown state'));
    }
  }
}
