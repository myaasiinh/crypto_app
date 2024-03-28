import 'package:crypto_app/domain/crypto_feed.dart';


class CryptoFeedItemViewModel {
  final CoinItem coinItem;

  CryptoFeedItemViewModel(this.coinItem);

  String get id => coinItem.id;
  String get symbol => coinItem.symbol;
  String get coinName => coinItem.coinName;
  String get image => coinItem.image;
  double get currentPrice => coinItem.currentPrice;
  double get marketCap => coinItem.marketCap;
  int get marketCapRank => coinItem.marketCapRank;
  double get fullyDilutedValuation => coinItem.fullyDilutedValuation;
  double get totalVolume => coinItem.totalVolume;
  double get high24h => coinItem.high24h;
  double get low24h => coinItem.low24h;
  double get priceChange24h => coinItem.priceChange24h;
  double get priceChangePercentage24h => coinItem.priceChangePercentage24h;
  double get marketCapChange24h => coinItem.marketCapChange24h;
  double get marketCapChangePercentage24h => coinItem.marketCapChangePercentage24h;
  double get circulatingSupply => coinItem.circulatingSupply;
  double get totalSupply => coinItem.totalSupply;
  double get maxSupply => coinItem.maxSupply;
  double get ath => coinItem.ath;
  double get athChangePercentage => coinItem.athChangePercentage;
  String get athDate => coinItem.athDate;
  double get atl => coinItem.atl;
  double get atlChangePercentage => coinItem.atlChangePercentage;
  String get atlDate => coinItem.atlDate;
  RoiItem get roi => coinItem.roi;
  String get lastUpdated => coinItem.lastUpdated;
  double get priceChangePercentage24hInCurrency => coinItem.priceChangePercentage24hInCurrency;
  
}
