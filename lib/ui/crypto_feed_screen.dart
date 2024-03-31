import 'package:crypto_app/presentation/crypto_feed_viewmodel.dart';
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
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewModel.error != null
              ? Center(child: Text(viewModel.error!))
              : ListView.builder(
                  itemCount: viewModel.cryptoFeeds!.length,
                  itemBuilder: (context, index) {
                    final cryptoFeed = viewModel.cryptoFeeds![index];
                    return ListTile(
                      title: Text(cryptoFeed.data.first.coinInfo.fullName),
                      subtitle:
                          Text(cryptoFeed.data.first.coinInfo.documentType),
                      // Add navigation logic here
                    );
                  },
                ),
    );
  }
}
