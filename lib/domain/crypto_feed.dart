
class CoinItem {
  final String id;
  final String symbol;
  final String coinName;
  final String image;
  final double currentPrice;
  final double marketCap;
  final int marketCapRank;
  final double fullyDilutedValuation;
  final double totalVolume;
  final double high24h;
  final double low24h;
  final double priceChange24h;
  final double priceChangePercentage24h;
  final double marketCapChange24h;
  final double marketCapChangePercentage24h;
  final double circulatingSupply;
  final double totalSupply;
  final double maxSupply;
  final double ath;
  final double athChangePercentage;
  final String athDate;
  final double atl;
  final double atlChangePercentage;
  final String atlDate;
  final RoiItem roi;
  final String lastUpdated;
  final double priceChangePercentage24hInCurrency;

  CoinItem({
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
}

class RoiItem {
  final double times;
  final String currency;
  final double percentage;

  RoiItem({
    required this.times,
    required this.currency,
    required this.percentage,
  });
}
