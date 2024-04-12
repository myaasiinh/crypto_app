// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoFeedModelResponses _$CryptoFeedModelResponsesFromJson(
        Map<String, dynamic> json) =>
    CryptoFeedModelResponses(
      message: json['Message'] as String,
      type: json['Type'] as int,
      metaData: MetaData.fromJson(json['MetaData'] as Map<String, dynamic>),
      sponsoredData: json['SponsoredData'] as List<dynamic>,
      data: (json['Data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      rateLimit: RateLimit.fromJson(json['RateLimit'] as Map<String, dynamic>),
      hasWarning: json['HasWarning'] as bool,
    );

Map<String, dynamic> _$CryptoFeedModelResponsesToJson(
        CryptoFeedModelResponses instance) =>
    <String, dynamic>{
      'Message': instance.message,
      'Type': instance.type,
      'MetaData': instance.metaData,
      'SponsoredData': instance.sponsoredData,
      'Data': instance.data,
      'RateLimit': instance.rateLimit,
      'HasWarning': instance.hasWarning,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      coinInfo: CoinInfo.fromJson(json['CoinInfo'] as Map<String, dynamic>),
      raw: Raw.fromJson(json['RAW'] as Map<String, dynamic>),
      display: Display.fromJson(json['DISPLAY'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'CoinInfo': instance.coinInfo,
      'RAW': instance.raw,
      'DISPLAY': instance.display,
    };

CoinInfo _$CoinInfoFromJson(Map<String, dynamic> json) => CoinInfo(
      id: json['Id'] as String,
      name: json['Name'] as String,
      fullName: json['FullName'] as String,
      internal: json['Internal'] as String,
      imageUrl: json['ImageUrl'] as String,
      url: json['Url'] as String,
      algorithm: json['Algorithm'] as String,
      proofType: json['ProofType'] as String,
      rating: Rating.fromJson(json['Rating'] as Map<String, dynamic>),
      netHashesPerSecond: (json['NetHashesPerSecond'] as num).toDouble(),
      blockNumber: json['BlockNumber'] as int,
      blockTime: (json['BlockTime'] as num).toDouble(),
      blockReward: (json['BlockReward'] as num).toDouble(),
      assetLaunchDate: DateTime.parse(json['AssetLaunchDate'] as String),
      maxSupply: (json['MaxSupply'] as num).toDouble(),
      type: json['Type'] as int,
      documentType: json['DocumentType'] as String,
    );

Map<String, dynamic> _$CoinInfoToJson(CoinInfo instance) => <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'FullName': instance.fullName,
      'Internal': instance.internal,
      'ImageUrl': instance.imageUrl,
      'Url': instance.url,
      'Algorithm': instance.algorithm,
      'ProofType': instance.proofType,
      'Rating': instance.rating,
      'NetHashesPerSecond': instance.netHashesPerSecond,
      'BlockNumber': instance.blockNumber,
      'BlockTime': instance.blockTime,
      'BlockReward': instance.blockReward,
      'AssetLaunchDate': instance.assetLaunchDate.toIso8601String(),
      'MaxSupply': instance.maxSupply,
      'Type': instance.type,
      'DocumentType': instance.documentType,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      weiss: Weiss.fromJson(json['Weiss'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'Weiss': instance.weiss,
    };

Weiss _$WeissFromJson(Map<String, dynamic> json) => Weiss(
      rating: json['Rating'] as String,
      technologyAdoptionRating: json['TechnologyAdoptionRating'] as String,
      marketPerformanceRating: json['MarketPerformanceRating'] as String,
    );

Map<String, dynamic> _$WeissToJson(Weiss instance) => <String, dynamic>{
      'Rating': instance.rating,
      'TechnologyAdoptionRating': instance.technologyAdoptionRating,
      'MarketPerformanceRating': instance.marketPerformanceRating,
    };

Display _$DisplayFromJson(Map<String, dynamic> json) => Display(
      usd: DisplayUsd.fromJson(json['USD'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DisplayToJson(Display instance) => <String, dynamic>{
      'USD': instance.usd,
    };

DisplayUsd _$DisplayUsdFromJson(Map<String, dynamic> json) => DisplayUsd(
      fromsymbol: json['FROMSYMBOL'] as String,
      tosymbol: json['TOSYMBOL'] as String,
      market: json['MARKET'] as String,
      lastmarket: json['LASTMARKET'] as String,
      toptiervolume24Hour: json['TOPTIERVOLUME24HOUR'] as String,
      toptiervolume24Hourto: json['TOPTIERVOLUME24HOURTO'] as String,
      lasttradeid: json['LASTTRADEID'] as String,
      price: json['PRICE'] as String,
      lastupdate: json['LASTUPDATE'] as String,
      lastvolume: json['LASTVOLUME'] as String,
      lastvolumeto: json['LASTVOLUMETO'] as String,
      volumehour: json['VOLUMEHOUR'] as String,
      volumehourto: json['VOLUMEHOURTO'] as String,
      openhour: json['OPENHOUR'] as String,
      highhour: json['HIGHHOUR'] as String,
      lowhour: json['LOWHOUR'] as String,
      volumeday: json['VOLUMEDAY'] as String,
      volumedayto: json['VOLUMEDAYTO'] as String,
      openday: json['OPENDAY'] as String,
      highday: json['HIGHDAY'] as String,
      lowday: json['LOWDAY'] as String,
      volume24Hour: json['VOLUME24HOUR'] as String,
      volume24Hourto: json['VOLUME24HOURTO'] as String,
      open24Hour: json['OPEN24HOUR'] as String,
      high24Hour: json['HIGH24HOUR'] as String,
      low24Hour: json['LOW24HOUR'] as String,
      change24Hour: json['CHANGE24HOUR'] as String,
      changepct24Hour: json['CHANGEPCT24HOUR'] as String,
      changeday: json['CHANGEDAY'] as String,
      changepctday: json['CHANGEPCTDAY'] as String,
      changehour: json['CHANGEHOUR'] as String,
      changepcthour: json['CHANGEPCTHOUR'] as String,
      conversiontype: json['CONVERSIONTYPE'] as String,
      conversionsymbol: json['CONVERSIONSYMBOL'] as String,
      conversionlastupdate: json['CONVERSIONLASTUPDATE'] as String,
      supply: json['SUPPLY'] as String,
      mktcap: json['MKTCAP'] as String,
      mktcappenalty: json['MKTCAPPENALTY'] as String,
      circulatingsupply: json['CIRCULATINGSUPPLY'] as String,
      circulatingsupplymktcap: json['CIRCULATINGSUPPLYMKTCAP'] as String,
      totalvolume24H: json['TOTALVOLUME24H'] as String,
      totalvolume24Hto: json['TOTALVOLUME24HTO'] as String,
      totaltoptiervolume24H: json['TOTALTOPTIERVOLUME24H'] as String,
      totaltoptiervolume24Hto: json['TOTALTOPTIERVOLUME24HTO'] as String,
      imageurl: json['IMAGEURL'] as String,
    );

Map<String, dynamic> _$DisplayUsdToJson(DisplayUsd instance) =>
    <String, dynamic>{
      'FROMSYMBOL': instance.fromsymbol,
      'TOSYMBOL': instance.tosymbol,
      'MARKET': instance.market,
      'LASTMARKET': instance.lastmarket,
      'TOPTIERVOLUME24HOUR': instance.toptiervolume24Hour,
      'TOPTIERVOLUME24HOURTO': instance.toptiervolume24Hourto,
      'LASTTRADEID': instance.lasttradeid,
      'PRICE': instance.price,
      'LASTUPDATE': instance.lastupdate,
      'LASTVOLUME': instance.lastvolume,
      'LASTVOLUMETO': instance.lastvolumeto,
      'VOLUMEHOUR': instance.volumehour,
      'VOLUMEHOURTO': instance.volumehourto,
      'OPENHOUR': instance.openhour,
      'HIGHHOUR': instance.highhour,
      'LOWHOUR': instance.lowhour,
      'VOLUMEDAY': instance.volumeday,
      'VOLUMEDAYTO': instance.volumedayto,
      'OPENDAY': instance.openday,
      'HIGHDAY': instance.highday,
      'LOWDAY': instance.lowday,
      'VOLUME24HOUR': instance.volume24Hour,
      'VOLUME24HOURTO': instance.volume24Hourto,
      'OPEN24HOUR': instance.open24Hour,
      'HIGH24HOUR': instance.high24Hour,
      'LOW24HOUR': instance.low24Hour,
      'CHANGE24HOUR': instance.change24Hour,
      'CHANGEPCT24HOUR': instance.changepct24Hour,
      'CHANGEDAY': instance.changeday,
      'CHANGEPCTDAY': instance.changepctday,
      'CHANGEHOUR': instance.changehour,
      'CHANGEPCTHOUR': instance.changepcthour,
      'CONVERSIONTYPE': instance.conversiontype,
      'CONVERSIONSYMBOL': instance.conversionsymbol,
      'CONVERSIONLASTUPDATE': instance.conversionlastupdate,
      'SUPPLY': instance.supply,
      'MKTCAP': instance.mktcap,
      'MKTCAPPENALTY': instance.mktcappenalty,
      'CIRCULATINGSUPPLY': instance.circulatingsupply,
      'CIRCULATINGSUPPLYMKTCAP': instance.circulatingsupplymktcap,
      'TOTALVOLUME24H': instance.totalvolume24H,
      'TOTALVOLUME24HTO': instance.totalvolume24Hto,
      'TOTALTOPTIERVOLUME24H': instance.totaltoptiervolume24H,
      'TOTALTOPTIERVOLUME24HTO': instance.totaltoptiervolume24Hto,
      'IMAGEURL': instance.imageurl,
    };

Raw _$RawFromJson(Map<String, dynamic> json) => Raw(
      usd: RawUsd.fromJson(json['USD'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RawToJson(Raw instance) => <String, dynamic>{
      'USD': instance.usd,
    };

RawUsd _$RawUsdFromJson(Map<String, dynamic> json) => RawUsd(
      type: json['TYPE'] as String,
      market: json['MARKET'] as String,
      fromsymbol: json['FROMSYMBOL'] as String,
      tosymbol: json['TOSYMBOL'] as String,
      flags: json['FLAGS'] as String,
      lastmarket: json['LASTMARKET'] as String,
      median: (json['MEDIAN'] as num).toDouble(),
      toptiervolume24Hour: (json['TOPTIERVOLUME24HOUR'] as num).toDouble(),
      toptiervolume24Hourto: (json['TOPTIERVOLUME24HOURTO'] as num).toDouble(),
      lasttradeid: json['LASTTRADEID'] as String,
      price: (json['PRICE'] as num).toDouble(),
      lastupdate: json['LASTUPDATE'] as int,
      lastvolume: (json['LASTVOLUME'] as num).toDouble(),
      lastvolumeto: (json['LASTVOLUMETO'] as num).toDouble(),
      volumehour: (json['VOLUMEHOUR'] as num).toDouble(),
      volumehourto: (json['VOLUMEHOURTO'] as num).toDouble(),
      openhour: (json['OPENHOUR'] as num).toDouble(),
      highhour: (json['HIGHHOUR'] as num).toDouble(),
      lowhour: (json['LOWHOUR'] as num).toDouble(),
      volumeday: (json['VOLUMEDAY'] as num).toDouble(),
      volumedayto: (json['VOLUMEDAYTO'] as num).toDouble(),
      openday: (json['OPENDAY'] as num).toDouble(),
      highday: (json['HIGHDAY'] as num).toDouble(),
      lowday: (json['LOWDAY'] as num).toDouble(),
      volume24Hour: (json['VOLUME24HOUR'] as num).toDouble(),
      volume24Hourto: (json['VOLUME24HOURTO'] as num).toDouble(),
      open24Hour: (json['OPEN24HOUR'] as num).toDouble(),
      high24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      low24Hour: (json['LOW24HOUR'] as num).toDouble(),
      change24Hour: (json['CHANGE24HOUR'] as num).toDouble(),
      changepct24Hour: (json['CHANGEPCT24HOUR'] as num).toDouble(),
      changeday: (json['CHANGEDAY'] as num).toDouble(),
      changepctday: (json['CHANGEPCTDAY'] as num).toDouble(),
      changehour: (json['CHANGEHOUR'] as num).toDouble(),
      changepcthour: (json['CHANGEPCTHOUR'] as num).toDouble(),
      conversiontype: json['CONVERSIONTYPE'] as String,
      conversionsymbol: json['CONVERSIONSYMBOL'] as String,
      conversionlastupdate: json['CONVERSIONLASTUPDATE'] as int,
      supply: (json['SUPPLY'] as num).toDouble(),
      mktcap: (json['MKTCAP'] as num).toDouble(),
      mktcappenalty: json['MKTCAPPENALTY'] as int,
      circulatingsupply: (json['CIRCULATINGSUPPLY'] as num).toDouble(),
      circulatingsupplymktcap:
          (json['CIRCULATINGSUPPLYMKTCAP'] as num).toDouble(),
      totalvolume24H: (json['TOTALVOLUME24H'] as num).toDouble(),
      totalvolume24Hto: (json['TOTALVOLUME24HTO'] as num).toDouble(),
      totaltoptiervolume24H: (json['TOTALTOPTIERVOLUME24H'] as num).toDouble(),
      totaltoptiervolume24Hto:
          (json['TOTALTOPTIERVOLUME24HTO'] as num).toDouble(),
      imageurl: json['IMAGEURL'] as String,
    );

Map<String, dynamic> _$RawUsdToJson(RawUsd instance) => <String, dynamic>{
      'TYPE': instance.type,
      'MARKET': instance.market,
      'FROMSYMBOL': instance.fromsymbol,
      'TOSYMBOL': instance.tosymbol,
      'FLAGS': instance.flags,
      'LASTMARKET': instance.lastmarket,
      'MEDIAN': instance.median,
      'TOPTIERVOLUME24HOUR': instance.toptiervolume24Hour,
      'TOPTIERVOLUME24HOURTO': instance.toptiervolume24Hourto,
      'LASTTRADEID': instance.lasttradeid,
      'PRICE': instance.price,
      'LASTUPDATE': instance.lastupdate,
      'LASTVOLUME': instance.lastvolume,
      'LASTVOLUMETO': instance.lastvolumeto,
      'VOLUMEHOUR': instance.volumehour,
      'VOLUMEHOURTO': instance.volumehourto,
      'OPENHOUR': instance.openhour,
      'HIGHHOUR': instance.highhour,
      'LOWHOUR': instance.lowhour,
      'VOLUMEDAY': instance.volumeday,
      'VOLUMEDAYTO': instance.volumedayto,
      'OPENDAY': instance.openday,
      'HIGHDAY': instance.highday,
      'LOWDAY': instance.lowday,
      'VOLUME24HOUR': instance.volume24Hour,
      'VOLUME24HOURTO': instance.volume24Hourto,
      'OPEN24HOUR': instance.open24Hour,
      'HIGH24HOUR': instance.high24Hour,
      'LOW24HOUR': instance.low24Hour,
      'CHANGE24HOUR': instance.change24Hour,
      'CHANGEPCT24HOUR': instance.changepct24Hour,
      'CHANGEDAY': instance.changeday,
      'CHANGEPCTDAY': instance.changepctday,
      'CHANGEHOUR': instance.changehour,
      'CHANGEPCTHOUR': instance.changepcthour,
      'CONVERSIONTYPE': instance.conversiontype,
      'CONVERSIONSYMBOL': instance.conversionsymbol,
      'CONVERSIONLASTUPDATE': instance.conversionlastupdate,
      'SUPPLY': instance.supply,
      'MKTCAP': instance.mktcap,
      'MKTCAPPENALTY': instance.mktcappenalty,
      'CIRCULATINGSUPPLY': instance.circulatingsupply,
      'CIRCULATINGSUPPLYMKTCAP': instance.circulatingsupplymktcap,
      'TOTALVOLUME24H': instance.totalvolume24H,
      'TOTALVOLUME24HTO': instance.totalvolume24Hto,
      'TOTALTOPTIERVOLUME24H': instance.totaltoptiervolume24H,
      'TOTALTOPTIERVOLUME24HTO': instance.totaltoptiervolume24Hto,
      'IMAGEURL': instance.imageurl,
    };

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      count: json['Count'] as int,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'Count': instance.count,
    };

RateLimit _$RateLimitFromJson(Map<String, dynamic> json) => RateLimit();

Map<String, dynamic> _$RateLimitToJson(RateLimit instance) =>
    <String, dynamic>{};
