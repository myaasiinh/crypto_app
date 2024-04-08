// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/domain/crypto_feed_domain.dart';

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
      separatorBuilder: (BuildContext context, int index) => Divider(
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
          padding:
              const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIcon(feedItem.coinInfo),
                  const SizedBox(width: 8), // Add some space between icon and texts
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildTexts(feedItem.coinInfo),
                    ),
                  ),
                  Expanded(
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
      Text(
        "${usd.changepctday}%",
      ),
    ];
  }
}
