import 'package:crypto_app/api/remote_crypto_feed.dart';
import 'package:crypto_app/infra_api/crypto_feed_services.dart';
import 'package:crypto_app/presentation/crypto_feed_item_viewmodel.dart';
import 'package:crypto_app/presentation/crypto_feed_viewmodel.dart';
import 'package:flutter/material.dart';


class CryptoFeedScreen extends StatefulWidget {
  @override
  _CryptoFeedScreenState createState() => _CryptoFeedScreenState();
}

class _CryptoFeedScreenState extends State<CryptoFeedScreen> {
  final CryptoFeedViewModel viewModel = CryptoFeedViewModel(
    // Inject dependencies
    loadCryptoFeedRemoteUseCases: LoadCryptoFeedRemoteUseCases(
      remoteCryptoFeed: RemoteCryptoFeed(
        cryptoFeedService: CryptoFeedService(
          ),
        ),
      ),
    ),
  ); // Instantiate view model

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when screen is initialized
  }

  Future<void> fetchData() async {
    await viewModel.fetchCryptoFeed(); // Call method to fetch crypto feed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Feed'),
      ),
      body: Center(
        child: FutureBuilder(
          future: viewModel.fetchCryptoFeed(), // Call method to fetch crypto feed
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show loading indicator while waiting for data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // Show error message if data fetching fails
            } else {
              // Display fetched data
              return ListView.builder(
                itemCount: viewModel.cryptoFeedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildCryptoFeedItem(viewModel.cryptoFeedItems[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildCryptoFeedItem(CryptoFeedItemViewModel item) {
    return ListTile(
      leading: Image.network(item.image), // Show coin image
      title: Text(item.coinName), // Show coin name
      subtitle: Text(item.symbol), // Show coin symbol
      trailing: Text('\$${item.currentPrice.toStringAsFixed(2)}'), // Show current price
      // Add other details as needed
    );
  }
}
