// ignore_for_file: prefer_interpolation_to_compose_strings, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:crypto_app/domain/crypto_feed_domain.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CryptoFeedList extends StatelessWidget {
  final List<CryptoFeedModelDomain> items;

  CryptoFeedList({
    required this.items,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final cryptoFeed = items[index].data.isNotEmpty ? items[index] : null;
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildIcon(cryptoFeed!),
              const SizedBox(width: 20),
              _buildTexts(cryptoFeed),
              const SizedBox(width: 20),
              _buildPrices(cryptoFeed),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIcon(CryptoFeedModelDomain cryptoFeed) {
    return ClipOval(
      child: Column(
        children: cryptoFeed.data
            .map((feedItem) => CachedNetworkImage(
                  imageUrl:
                      "https://cryptocompare.com/${feedItem.coinInfo.imageUrl}",
                  width: 50,
                  height: 50,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildTexts(CryptoFeedModelDomain cryptoFeed) {
    return Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: cryptoFeed.data
            .map((feedItem) => Column(
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
                ))
            .toList(),
      ),
    );
  }

  Widget _buildPrices(CryptoFeedModelDomain cryptoFeed) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: cryptoFeed.data
            .map((feedItem) => Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$" + feedItem.raw.usd.price.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      feedItem.raw.usd.changepctday.toString() + "%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: feedItem.raw.usd.changepctday < 0
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
