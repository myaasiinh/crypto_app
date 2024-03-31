import 'package:crypto_app/presentation/crypto_feed_viewmodel.dart';
import 'package:crypto_app/ui/widgets/cardview_crypto.dart';
import 'package:flutter/material.dart';

class CryptoFeedScreen extends StatelessWidget {
  final CryptoFeedViewModel viewModel; // ViewModel instance

  const CryptoFeedScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    // Use viewModel directly
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Feed'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (viewModel.error != null) {
      return Center(child: Text(viewModel.error!));
    } else {
      return _buildCryptoFeedList();
    }
  }

  Widget _buildCryptoFeedList() {
    return CryptoFeedList(items: viewModel.cryptoFeeds!); // Pass viewModel.cryptoFeeds to CryptoFeedList
  }
}
