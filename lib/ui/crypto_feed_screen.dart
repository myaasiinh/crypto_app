import 'dart:async';
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
  late StreamController<CryptoFeedUiState> _streamController;
  late Stream<CryptoFeedUiState> _stream;

  @override
  void initState() {
    super.initState();
    _viewModel = CryptoFeedViewModel.create();
    _streamController = StreamController<CryptoFeedUiState>();
    _stream = _streamController.stream;
    _viewModel.addListener(() {
      _streamController.add(_viewModel.cryptoFeedUiState);
    });
    _viewModel.loadCryptoFeed();
  }

  @override
  void dispose() {
    _streamController.close();
    _viewModel.dispose();
    super.dispose();
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
    if (state is NoCryptoFeed) {
      return Center(child: Text(state.failed));
    } else if (state is HasCryptoFeed) {
      // If there is data, display the CryptoFeedList
      return CryptoFeedList(items: state.cryptoFeeds);
    } else {
      return const Center(child: Text('Unknown state'));
    }
  }
}
