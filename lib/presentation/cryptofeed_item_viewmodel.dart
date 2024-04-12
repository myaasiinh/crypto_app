import 'package:crypto_app/domain/crypto_feed.dart';

class CryptoFeedItemViewModel {
  final String coinFullName;
  final String coinName;
  final double price;
  final double changePctDay;

  CryptoFeedItemViewModel({
    required this.coinFullName,
    required this.coinName,
    required this.price,
    required this.changePctDay,
  });
  
  factory CryptoFeedItemViewModel.fromDomain(Datum datum) {
    return CryptoFeedItemViewModel(
      coinFullName: datum.coinInfo.fullName,
      coinName: datum.coinInfo.name,
      price: datum.raw.usd.price,
      changePctDay: datum.raw.usd.changepctday,
    );
  }
}
