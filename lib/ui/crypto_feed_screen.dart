// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:crypto_app/presentation/crypto_feed_viewmodel.dart';
import 'package:crypto_app/presentation/crypto_feed_viewmodel_state.dart';
import 'package:crypto_app/ui/widgets/cardview_crypto.dart';

class CryptoFeedScreen extends StatefulWidget {
  const CryptoFeedScreen({Key? key}) : super(key: key);

  @override
  _CryptoFeedScreenState createState() => _CryptoFeedScreenState();
}

class _CryptoFeedScreenState extends State<CryptoFeedScreen> {
  late CryptoFeedViewModel _viewModel;
  late Stream<CryptoFeedUiState> _stream;

  @override
  void initState() {
    super.initState();
    _viewModel = CryptoFeedViewModel.create();
    _stream = _viewModel.cryptoFeedUiState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Feed'),
      ),
      body: StreamBuilder<CryptoFeedUiState>(
        stream: _stream,
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
    );
  }

  Widget _buildBody(CryptoFeedUiState state) {
    final viewModelState = _viewModel.viewModelState;
    if (state == CryptoFeedUiState.noCryptoFeed) {
      return Center(child: Text(viewModelState.failed));
    } else if (state == CryptoFeedUiState.hasCryptoFeed) {
      return CryptoFeedList(items: viewModelState.cryptoFeeds);
    } else {
      return const Center(child: Text('Unknown state'));
    }
  }
}
