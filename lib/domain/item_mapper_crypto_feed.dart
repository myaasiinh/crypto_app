import 'package:crypto_app/domain/crypto_feed_domain.dart' as domain;
import 'package:crypto_app/infra_api/crypto_feed_response.dart' as response;

class CryptoFeedItemsMapper {
  static List<domain.CryptoFeedModelDomain> map(List<response.CryptoFeedModelResponses> items) {
    return items.map((item) => _mapResponseToDomain(item)).toList();
  }

  static domain.CryptoFeedModelDomain _mapResponseToDomain(response.CryptoFeedModelResponses response) {
    return domain.CryptoFeedModelDomain(
      message: response.message,
      type: response.type,
      metaData: _mapMetaDataToDomain(response.metaData),
      sponsoredData: response.sponsoredData,
      data: response.data.map((datum) => _mapDatumToDomain(datum)).toList(),
      rateLimit: _mapRateLimitToDomain(response.rateLimit),
      hasWarning: response.hasWarning,
    );
  }

  static domain.MetaData _mapMetaDataToDomain(response.MetaData metaData) {
    return domain.MetaData(count: metaData.count);
  }

  static domain.RateLimit _mapRateLimitToDomain(response.RateLimit rateLimit) {
    // Anda mungkin perlu memodifikasi metode ini tergantung pada implementasi RateLimit yang sebenarnya.
    return domain.RateLimit(); 
  }

  static domain.Datum _mapDatumToDomain(response.Datum datum) {
    return domain.Datum(
      coinInfo: _mapCoinInfoToDomain(datum.coinInfo),
      raw: _mapRawToDomain(datum.raw),
      display: _mapDisplayToDomain(datum.display),
    );
  }

  static domain.CoinInfo _mapCoinInfoToDomain(response.CoinInfo coinInfo) {
    // Melakukan konversi antara CoinInfo dari infra_api ke CoinInfo dari domain
    // Anda perlu menyesuaikan logika ini sesuai dengan struktur CoinInfo yang sesuai.
    return domain.CoinInfo(
      id: coinInfo.id,
      name: coinInfo.name,
      url: coinInfo.url,
      fullName: coinInfo.fullName,
      internal: coinInfo.internal,
      imageUrl: coinInfo.imageUrl,
      algorithm: coinInfo.algorithm,  
      proofType: coinInfo.proofType,
      rating: _mapRatingToDomain(coinInfo.rating),
      netHashesPerSecond: coinInfo.netHashesPerSecond,
      blockReward: coinInfo.blockReward,
      blockTime: coinInfo.blockTime,
      blockNumber: coinInfo.blockNumber,
      assetLaunchDate: coinInfo.assetLaunchDate,
      maxSupply: coinInfo.maxSupply,
      type: coinInfo.type,
      documentType: coinInfo.documentType,
      
    );
  }

  static domain.Raw _mapRawToDomain(response.Raw raw) {
    // Melakukan konversi antara Raw dari infra_api ke Raw dari domain
    // Anda perlu menyesuaikan logika ini sesuai dengan struktur Raw yang sesuai.
    return domain.Raw(
       usd: _mapRawUsdtoDomain(raw.usd),
      
    );
  }

  static domain.Display _mapDisplayToDomain(response.Display display) {
    // Melakukan konversi antara Display dari infra_api ke Display dari domain
    // Anda perlu menyesuaikan logika ini sesuai dengan struktur Display yang sesuai.
    return domain.Display(
      usd: _mapDisplayUsdtoDomain(display.usd),
    );
  }
  
  static _mapRatingToDomain(response.Rating rating) {
    // Melakukan konversi antara Rating dari infra_api ke Rating dari domain
    // Anda perlu menyesuaikan logika ini sesuai dengan struktur Rating yang sesuai.
    return domain.Rating(
      weiss: _mapRatingWeissToDomain(rating.weiss),
    );
  }
  
  static _mapRawUsdtoDomain(response.RawUsd usd) {}
  
  static _mapDisplayUsdtoDomain(response.DisplayUsd usd) {}
  
  static _mapRatingWeissToDomain(response.Weiss weiss) {}
}
