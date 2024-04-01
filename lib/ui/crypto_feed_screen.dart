// ignore_for_file: library_private_types_in_public_api

import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:crypto_app/presentation/crypto_feed_notifier.dart';
import 'package:crypto_app/presentation/crypto_feed_viewmodel.dart';
import 'package:crypto_app/ui/widgets/cardview_crypto.dart';
import 'package:flutter/material.dart';

class CryptoFeedScreen extends StatefulWidget {
  const CryptoFeedScreen({super.key});

  @override
  _CryptoFeedScreenState createState() => _CryptoFeedScreenState();
}

class _CryptoFeedScreenState extends State<CryptoFeedScreen> {
  // Menyimpan data yang diambil dari objek penerbit
  List<CryptoFeedModelDomain>? _cryptoFeeds;
  String? _error;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Langganan (subscribe) ke objek penerbit
    CryptoFeedNotifier().addListener(_updateUI);
    // Memuat data pertama kali
    _loadData();
  }

  @override
  void dispose() {
    // Batalkan langganan (unsubscribe) dari objek penerbit
    CryptoFeedNotifier().removeListener(_updateUI);
    super.dispose();
  }

  Future<void> _loadData() async {
    CryptoFeedViewModel viewModel =
        CryptoFeedViewModelFactory.createCryptoFeedViewModel();
    await viewModel.loadCryptoFeed();
  }

  // Fungsi untuk memperbarui tampilan sesuai dengan data dari objek penerbit
  void _updateUI() {
    setState(() {
      _cryptoFeeds = CryptoFeedNotifier().cryptoFeeds;
      _error = CryptoFeedNotifier().error;
      _isLoading = CryptoFeedNotifier().isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Feed'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (_error != null) {
      return Center(child: Text(_error!));
    } else {
      return _buildCryptoFeedList();
    }
  }

  Widget _buildCryptoFeedList() {
    if (_cryptoFeeds != null) {
      return CryptoFeedList(items: _cryptoFeeds!);
    } else {
      // Tampilkan pesan atau widget lain ketika _cryptoFeeds bernilai null
      return const Center(child: Text('Error, No data available'));
    }
  }
}
