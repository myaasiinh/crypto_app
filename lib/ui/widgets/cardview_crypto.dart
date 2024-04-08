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
    return SingleChildScrollView(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 15,),
        itemBuilder: (BuildContext context, int index) {
          return _buildCryptoFeedItem(items[index]);
        },
      ),
    );
  }

  Widget _buildCryptoFeedItem(CryptoFeedModelDomain cryptoFeed) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var feedItem in cryptoFeed.data)
                ..._buildIcon(feedItem.coinInfo)
            ],
          ),
        ),
        
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var feedItem in cryptoFeed.data)
                ..._buildTexts(feedItem.coinInfo),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var feedItem in cryptoFeed.data)
                ..._buildPrices(feedItem.raw.usd),
            ],
          ),
        ),
      ],
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

  List<Widget> _buildIcon(CoinInfo coinInfo) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: "https://cryptocompare.com/${coinInfo.imageUrl}",
            width: 50,
            height: 50,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    ];
  }
}
