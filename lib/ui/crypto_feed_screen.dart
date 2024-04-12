// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/domain/crypto_feed.dart';
import 'package:crypto_app/presentation/cryptofeed_viewmodel_state.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/presentation/crpytofeed_viewmodel.dart';

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
      _streamController
          .add(viewModel.cryptoFeedViewModelState.toCryptoFeedUiState());
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    viewModel.loadCryptoFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(95, 93, 156, 1.0),
          centerTitle: true,
          title: const Text(
            'Crypto Feed',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: RefreshIndicator(
        key: _pullRefreshState,
        onRefresh: _handleRefresh,
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
              viewModel.cryptoFeedItems;
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

class CryptoFeedList extends StatelessWidget {
  final List<CryptoFeedModelDomain> items;

  const CryptoFeedList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 100,
        height: 2,
        color: Colors.amber,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _buildCryptoFeedItem(items[index]);
      },
    );
  }

  Widget _buildCryptoFeedItem(CryptoFeedModelDomain cryptoFeed) {
    return Column(
      children: cryptoFeed.data.map((feedItem) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: _buildIcon(feedItem.coinInfo),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildTexts(feedItem.coinInfo),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: _buildPrices(feedItem.raw.usd),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildIcon(CoinInfo coinInfo) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: "https://cryptocompare.com/${coinInfo.imageUrl}",
        width: 50,
        height: 50,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  List<Widget> _buildTexts(CoinInfo coinInfo) {
    return [
      Text(
        coinInfo.fullName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(
        coinInfo.name,
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ];
  }

  List<Widget> _buildPrices(RawUsd usd) {
    return [
      Text(
        "\$${usd.price}",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Text("${usd.changepctday}%",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: usd.changepctday < 0 ? Colors.red : Colors.green,
          )),
    ];
  }
}
