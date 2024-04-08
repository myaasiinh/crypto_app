import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CryptoFeedList extends StatelessWidget {
  final List<CryptoFeedModelDomain> items;

  const CryptoFeedList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: items.map((cryptoFeed) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildIcon(cryptoFeed),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 5,
                      child: _buildTexts(cryptoFeed),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 3,
                      child: _buildPrices(cryptoFeed),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildIcon(CryptoFeedModelDomain cryptoFeed) {
  return Column(
    children: cryptoFeed.data.map((feedItem) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl:
                "https://cryptocompare.com/${feedItem.coinInfo.imageUrl}",
            width: 50,
            height: 50,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      );
    }).toList(),
  );
}


  Widget _buildTexts(CryptoFeedModelDomain cryptoFeed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var feedItem in cryptoFeed.data)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feedItem.coinInfo.fullName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                feedItem.coinInfo.name,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildPrices(CryptoFeedModelDomain cryptoFeed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var feedItem in cryptoFeed.data)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${feedItem.raw.usd.price}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${feedItem.raw.usd.changepctday}%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: feedItem.raw.usd.changepctday < 0
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
