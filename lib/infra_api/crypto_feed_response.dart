import 'package:crypto_app/domain/crypto_feed.dart';

class CoinItemResponse {
  final String id;
  final String symbol;
  final String coinName;
  final String image;
  final double? currentPrice;
  final double? marketCap;
  final int? marketCapRank;
  final double? fullyDilutedValuation;
  final double? totalVolume;
  final double? high24h;
  final double? low24h;
  final double? priceChange24h;
  final double? priceChangePercentage24h;
  final double? marketCapChange24h;
  final double? marketCapChangePercentage24h;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double? ath;
  final double? athChangePercentage;
  final String? athDate;
  final double? atl;
  final double? atlChangePercentage;
  final String? atlDate;
  final RoiItemResponse? roi;
  final String? lastUpdated;
  final double? priceChangePercentage24hInCurrency;

  CoinItemResponse({
    required this.id,
    required this.symbol,
    required this.coinName,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.marketCapChange24h,
    required this.marketCapChangePercentage24h,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.roi,
    required this.lastUpdated,
    required this.priceChangePercentage24hInCurrency,
  });

  CoinItem toModel() {
    return CoinItem(
      id: id,
      symbol: symbol,
      coinName: coinName,
      image: image,
      currentPrice: currentPrice ?? 0.0,
      marketCap: marketCap ?? 0.0,
      marketCapRank: marketCapRank ?? 0,
      fullyDilutedValuation: fullyDilutedValuation ?? 0.0,
      totalVolume: totalVolume ?? 0.0,
      high24h: high24h ?? 0.0,
      low24h: low24h ?? 0.0,
      priceChange24h: priceChange24h ?? 0.0,
      priceChangePercentage24h: priceChangePercentage24h ?? 0.0,
      marketCapChange24h: marketCapChange24h ?? 0.0,
      marketCapChangePercentage24h: marketCapChangePercentage24h ?? 0.0,
      circulatingSupply: circulatingSupply ?? 0.0,
      totalSupply: totalSupply ?? 0.0,
      maxSupply: maxSupply ?? 0.0,
      ath: ath ?? 0.0,
      athChangePercentage: athChangePercentage ?? 0.0,
      athDate: athDate ?? "",
      atl: atl ?? 0.0,
      atlChangePercentage: atlChangePercentage ?? 0.0,
      atlDate: atlDate ?? "",
      roi: roi != null
          ? RoiItem(
              times: roi!.times ?? 0.0,
              currency: roi!.currency ?? "",
              percentage: roi!.percentage ?? 0.0,
            )
          : RoiItem(times: 0.0, currency: "", percentage: 0.0),
      lastUpdated: lastUpdated ?? "",
      priceChangePercentage24hInCurrency:
          priceChangePercentage24hInCurrency ?? 0.0,
    );
  }
}

class RoiItemResponse {
  final double? times;
  final String? currency;
  final double? percentage;

  RoiItemResponse({
    required this.times,
    required this.currency,
    required this.percentage,
  });
}