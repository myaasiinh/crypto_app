// ignore_for_file: library_prefixes

import 'package:crypto_app/domain/crypto_feed_domain.dart' as modelDomain;
import 'package:crypto_app/infra/crypto_feed_response.dart' as modelResponses;
class CryptoFeedMapper {
  static List<modelDomain.CryptoFeedModelDomain> fromModelResponseMapDomain(modelResponses.CryptoFeedModelResponses response) {
    final data = _mapData(response.data);
    return [modelDomain.CryptoFeedModelDomain(
      message: response.message,
      type: response.type,
      hasWarning: response.hasWarning,
      metaData: modelDomain.MetaData(
        count: response.metaData.count,
      ),
      rateLimit: modelDomain.RateLimit(),
      sponsoredData: response.sponsoredData,
      data: data,
    )];
  }

  static List<modelDomain.Datum> _mapData(List<modelResponses.Datum> dataList) {
    return dataList.map(_mapDatum).toList();
  }

  static modelDomain.Datum _mapDatum(modelResponses.Datum datum) {
    return modelDomain.Datum(
      coinInfo: _mapCoinInfo(datum.coinInfo),
      raw: _mapRaw(datum.raw),
      display: _mapDisplay(datum.display),
    );
  }

  static modelDomain.CoinInfo _mapCoinInfo(modelResponses.CoinInfo coinInfo) {
    return modelDomain.CoinInfo(
      id: coinInfo.id,
      name: coinInfo.name,
      fullName: coinInfo.fullName,
      internal: coinInfo.internal,
      imageUrl: coinInfo.imageUrl,
      url: coinInfo.url,
      algorithm: coinInfo.algorithm,
      proofType: coinInfo.proofType,
      rating: modelDomain.Rating(
        weiss: modelDomain.Weiss(
          rating: coinInfo.rating.weiss.rating,
          technologyAdoptionRating: coinInfo.rating.weiss.technologyAdoptionRating,
          marketPerformanceRating: coinInfo.rating.weiss.marketPerformanceRating,
        ),
      ),
      netHashesPerSecond: coinInfo.netHashesPerSecond,
      blockNumber: coinInfo.blockNumber,
      blockTime: coinInfo.blockTime,
      blockReward: coinInfo.blockReward,
      assetLaunchDate: coinInfo.assetLaunchDate,
      maxSupply: coinInfo.maxSupply,
      type: coinInfo.type,
      documentType: coinInfo.documentType,
    );
  }

  static modelDomain.Raw _mapRaw(modelResponses.Raw raw) {
    return modelDomain.Raw(
      usd: modelDomain.RawUsd(
        type: raw.usd.type,
        market: raw.usd.market,
        fromsymbol: raw.usd.fromsymbol,
        tosymbol: raw.usd.tosymbol,
        flags: raw.usd.flags,
        lastmarket: raw.usd.lastmarket,
        median: raw.usd.median,
        toptiervolume24Hour: raw.usd.toptiervolume24Hour,
        toptiervolume24Hourto: raw.usd.toptiervolume24Hourto,
        lasttradeid: raw.usd.lasttradeid,
        price: raw.usd.price,
        lastupdate: raw.usd.lastupdate,
        lastvolume: raw.usd.lastvolume,
        lastvolumeto: raw.usd.lastvolumeto,
        volumehour: raw.usd.volumehour,
        volumehourto: raw.usd.volumehourto,
        openhour: raw.usd.openhour,
        highhour: raw.usd.highhour,
        lowhour: raw.usd.lowhour,
        volumeday: raw.usd.volumeday,
        volumedayto: raw.usd.volumedayto,
        openday: raw.usd.openday,
        highday: raw.usd.highday,
        lowday: raw.usd.lowday,
        volume24Hour: raw.usd.volume24Hour,
        volume24Hourto: raw.usd.volume24Hourto,
        open24Hour: raw.usd.open24Hour,
        high24Hour: raw.usd.high24Hour,
        low24Hour: raw.usd.low24Hour,
        change24Hour: raw.usd.change24Hour,
        changepct24Hour: raw.usd.changepct24Hour,
        changeday: raw.usd.changeday,
        changepctday: raw.usd.changepctday,
        changehour: raw.usd.changehour,
        changepcthour: raw.usd.changepcthour,
        conversiontype: raw.usd.conversiontype,
        conversionsymbol: raw.usd.conversionsymbol,
        conversionlastupdate: raw.usd.conversionlastupdate,
        supply: raw.usd.supply,
        mktcap: raw.usd.mktcap,
        mktcappenalty: raw.usd.mktcappenalty,
        circulatingsupply: raw.usd.circulatingsupply,
        circulatingsupplymktcap: raw.usd.circulatingsupplymktcap,
        totalvolume24H: raw.usd.totalvolume24H,
        totalvolume24Hto: raw.usd.totalvolume24Hto,
        totaltoptiervolume24H: raw.usd.totaltoptiervolume24H,
        totaltoptiervolume24Hto: raw.usd.totaltoptiervolume24Hto,
        imageurl: raw.usd.imageurl,
      ),
    );
  }

  static modelDomain.Display _mapDisplay(modelResponses.Display display) {
    return modelDomain.Display(
      usd: modelDomain.DisplayUsd(
        fromsymbol: display.usd.fromsymbol,
        tosymbol: display.usd.tosymbol,
        market: display.usd.market,
        lastmarket: display.usd.lastmarket,
        toptiervolume24Hour: display.usd.toptiervolume24Hour,
        toptiervolume24Hourto: display.usd.toptiervolume24Hourto,
        volumeday: display.usd.volumeday,
        volumedayto: display.usd.volumedayto,
        volume24Hour: display.usd.volume24Hour,
        volume24Hourto: display.usd.volume24Hourto,
        open24Hour: display.usd.open24Hour,
        high24Hour: display.usd.high24Hour,
        low24Hour: display.usd.low24Hour,
        lasttradeid: display.usd.lasttradeid,
        change24Hour: display.usd.change24Hour,
        changepct24Hour: display.usd.changepct24Hour,
        changeday: display.usd.changeday,
        changepctday: display.usd.changepctday,
        supply: display.usd.supply,
        mktcap: display.usd.mktcap,
        totalvolume24H: display.usd.totalvolume24H,
        totalvolume24Hto: display.usd.totalvolume24Hto,
        imageurl: display.usd.imageurl,
        price: display.usd.price,
        lastupdate: display.usd.lastupdate,
        lastvolume: display.usd.lastvolume,
        lastvolumeto: display.usd.lastvolumeto,
        volumehour: display.usd.volumehour,
        volumehourto: display.usd.volumehourto,
        openhour: display.usd.openhour,
        highhour: display.usd.highhour,
        lowhour: display.usd.lowhour,
        changehour: display.usd.changehour,
        changepcthour: display.usd.changepcthour,
        conversiontype: display.usd.conversiontype,
        conversionsymbol: display.usd.conversionsymbol,
        conversionlastupdate: display.usd.conversionlastupdate,
        openday: display.usd.openday,
        highday: display.usd.highday,
        lowday: display.usd.lowday,
        mktcappenalty: display.usd.mktcappenalty,
        circulatingsupply: display.usd.circulatingsupply,
        circulatingsupplymktcap: display.usd.circulatingsupplymktcap,
        totaltoptiervolume24H: display.usd.totaltoptiervolume24H,
        totaltoptiervolume24Hto: display.usd.totaltoptiervolume24Hto,
      ),
    );
  }
}