// ignore_for_file: unnecessary_type_check, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:crypto_app/presentation/crypto_feed_viewmodel_state.dart';
import 'package:crypto_app/presentation/crypto_feed_viewmodel.dart';
import 'package:crypto_app/ui/widgets/cardview_crypto.dart';

class CryptoFeedScreen extends StatefulWidget {
  const CryptoFeedScreen({super.key});

  @override
  _CryptoFeedScreenState createState() => _CryptoFeedScreenState();
}

class _CryptoFeedScreenState extends State<CryptoFeedScreen> {
  late CryptoFeedViewModel _viewModel;
  late StreamController<CryptoFeedUiState> _streamController;

  @override
  void initState() {
    super.initState();
    _viewModel = CryptoFeedViewModel.create();
    _streamController = StreamController<CryptoFeedUiState>();
    _streamController.add(_viewModel.cryptoFeedUiState);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Feed'),
      ),
      body: StreamBuilder<CryptoFeedUiState>(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final state = snapshot.data!;
            return _buildBody(state as CryptoFeedViewModelState);
          }
        },
      ),
    );
  }

  Widget _buildBody(CryptoFeedViewModelState state) {
    if (state is CryptoFeedViewModelState) {
      if (state.cryptoFeeds.isEmpty) {
        return Center(child: Text(state.failed));
      } else {
        return CryptoFeedList(items: state.cryptoFeeds);
      }
    } else {
      return const Center(child: Text('Unknown state'));
    }
  }
}
