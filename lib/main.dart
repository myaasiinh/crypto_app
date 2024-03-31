import 'package:crypto_app/main/crypto_feed_dio_client_factory%20.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/api/load_crypto_feed_remote_use_case.dart';
import 'package:crypto_app/presentation/crypto_feed_viewmodel.dart';
import 'package:crypto_app/ui/crypto_feed_screen.dart';

void main() {
  final cryptoFeedUseCase = LoadCryptoFeedRemoteUseCases(
    CryptoFeedHttpClientFactory.createCryptoFeedHttpClient()
  ); // Instantiate the use case
  final viewModel = CryptoFeedViewModel(cryptoFeedUseCase); // Instantiate the ViewModel

  runApp(MyApp(viewModel: viewModel)); // Pass ViewModel instance to MyApp
}

class MyApp extends StatelessWidget {
  final CryptoFeedViewModel viewModel;

  const MyApp({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CryptoFeedScreen(viewModel: viewModel), // Pass ViewModel instance to CryptoFeedScreen
    );
  }
}
