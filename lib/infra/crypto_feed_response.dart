import 'package:json_annotation/json_annotation.dart';

part 'crypto_feed_response.g.dart';

@JsonSerializable()
class CryptoFeedModelResponses {
    @JsonKey(name: "Message")
    String message;
    @JsonKey(name: "Type")
    int type;
    @JsonKey(name: "MetaData")
    MetaData metaData;
    @JsonKey(name: "SponsoredData")
    List<dynamic> sponsoredData;
    @JsonKey(name: "Data")
    List<Datum> data;
    @JsonKey(name: "RateLimit")
    RateLimit rateLimit;
    @JsonKey(name: "HasWarning")
    bool hasWarning;

    CryptoFeedModelResponses({
        required this.message,
        required this.type,
        required this.metaData,
        required this.sponsoredData,
        required this.data,
        required this.rateLimit,
        required this.hasWarning,
    });

    factory CryptoFeedModelResponses.fromJson(Map<String, dynamic> json) => _$CryptoFeedModelResponsesFromJson(json);

    Map<String, dynamic> toJson() => _$CryptoFeedModelResponsesToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "CoinInfo")
    CoinInfo coinInfo;
    @JsonKey(name: "RAW")
    Raw raw;
    @JsonKey(name: "DISPLAY")
    Display display;

    Datum({
        required this.coinInfo,
        required this.raw,
        required this.display,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class CoinInfo {
    @JsonKey(name: "Id")
    String id;
    @JsonKey(name: "Name")
    String name;
    @JsonKey(name: "FullName")
    String fullName;
    @JsonKey(name: "Internal")
    String internal;
    @JsonKey(name: "ImageUrl")
    String imageUrl;
    @JsonKey(name: "Url")
    String url;
    @JsonKey(name: "Algorithm")
    String algorithm;
    @JsonKey(name: "ProofType")
    String proofType;
    @JsonKey(name: "Rating")
    Rating rating;
    @JsonKey(name: "NetHashesPerSecond")
    double netHashesPerSecond;
    @JsonKey(name: "BlockNumber")
    int blockNumber;
    @JsonKey(name: "BlockTime")
    double blockTime;
    @JsonKey(name: "BlockReward")
    double blockReward;
    @JsonKey(name: "AssetLaunchDate")
    DateTime assetLaunchDate;
    @JsonKey(name: "MaxSupply")
    double maxSupply;
    @JsonKey(name: "Type")
    int type;
    @JsonKey(name: "DocumentType")
    String documentType;

    CoinInfo({
        required this.id,
        required this.name,
        required this.fullName,
        required this.internal,
        required this.imageUrl,
        required this.url,
        required this.algorithm,
        required this.proofType,
        required this.rating,
        required this.netHashesPerSecond,
        required this.blockNumber,
        required this.blockTime,
        required this.blockReward,
        required this.assetLaunchDate,
        required this.maxSupply,
        required this.type,
        required this.documentType,
    });

    factory CoinInfo.fromJson(Map<String, dynamic> json) => _$CoinInfoFromJson(json);

    Map<String, dynamic> toJson() => _$CoinInfoToJson(this);
}

@JsonSerializable()
class Rating {
    @JsonKey(name: "Weiss")
    Weiss weiss;

    Rating({
        required this.weiss,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

    Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class Weiss {
    @JsonKey(name: "Rating")
    String rating;
    @JsonKey(name: "TechnologyAdoptionRating")
    String technologyAdoptionRating;
    @JsonKey(name: "MarketPerformanceRating")
    String marketPerformanceRating;

    Weiss({
        required this.rating,
        required this.technologyAdoptionRating,
        required this.marketPerformanceRating,
    });

    factory Weiss.fromJson(Map<String, dynamic> json) => _$WeissFromJson(json);

    Map<String, dynamic> toJson() => _$WeissToJson(this);
}

@JsonSerializable()
class Display {
    @JsonKey(name: "USD")
    DisplayUsd usd;

    Display({
        required this.usd,
    });

    factory Display.fromJson(Map<String, dynamic> json) => _$DisplayFromJson(json);

    Map<String, dynamic> toJson() => _$DisplayToJson(this);
}

@JsonSerializable()
class DisplayUsd {
    @JsonKey(name: "FROMSYMBOL")
    String fromsymbol;
    @JsonKey(name: "TOSYMBOL")
    String tosymbol;
    @JsonKey(name: "MARKET")
    String market;
    @JsonKey(name: "LASTMARKET")
    String lastmarket;
    @JsonKey(name: "TOPTIERVOLUME24HOUR")
    String toptiervolume24Hour;
    @JsonKey(name: "TOPTIERVOLUME24HOURTO")
    String toptiervolume24Hourto;
    @JsonKey(name: "LASTTRADEID")
    String lasttradeid;
    @JsonKey(name: "PRICE")
    String price;
    @JsonKey(name: "LASTUPDATE")
    String lastupdate;
    @JsonKey(name: "LASTVOLUME")
    String lastvolume;
    @JsonKey(name: "LASTVOLUMETO")
    String lastvolumeto;
    @JsonKey(name: "VOLUMEHOUR")
    String volumehour;
    @JsonKey(name: "VOLUMEHOURTO")
    String volumehourto;
    @JsonKey(name: "OPENHOUR")
    String openhour;
    @JsonKey(name: "HIGHHOUR")
    String highhour;
    @JsonKey(name: "LOWHOUR")
    String lowhour;
    @JsonKey(name: "VOLUMEDAY")
    String volumeday;
    @JsonKey(name: "VOLUMEDAYTO")
    String volumedayto;
    @JsonKey(name: "OPENDAY")
    String openday;
    @JsonKey(name: "HIGHDAY")
    String highday;
    @JsonKey(name: "LOWDAY")
    String lowday;
    @JsonKey(name: "VOLUME24HOUR")
    String volume24Hour;
    @JsonKey(name: "VOLUME24HOURTO")
    String volume24Hourto;
    @JsonKey(name: "OPEN24HOUR")
    String open24Hour;
    @JsonKey(name: "HIGH24HOUR")
    String high24Hour;
    @JsonKey(name: "LOW24HOUR")
    String low24Hour;
    @JsonKey(name: "CHANGE24HOUR")
    String change24Hour;
    @JsonKey(name: "CHANGEPCT24HOUR")
    String changepct24Hour;
    @JsonKey(name: "CHANGEDAY")
    String changeday;
    @JsonKey(name: "CHANGEPCTDAY")
    String changepctday;
    @JsonKey(name: "CHANGEHOUR")
    String changehour;
    @JsonKey(name: "CHANGEPCTHOUR")
    String changepcthour;
    @JsonKey(name: "CONVERSIONTYPE")
    String conversiontype;
    @JsonKey(name: "CONVERSIONSYMBOL")
    String conversionsymbol;
    @JsonKey(name: "CONVERSIONLASTUPDATE")
    String conversionlastupdate;
    @JsonKey(name: "SUPPLY")
    String supply;
    @JsonKey(name: "MKTCAP")
    String mktcap;
    @JsonKey(name: "MKTCAPPENALTY")
    String mktcappenalty;
    @JsonKey(name: "CIRCULATINGSUPPLY")
    String circulatingsupply;
    @JsonKey(name: "CIRCULATINGSUPPLYMKTCAP")
    String circulatingsupplymktcap;
    @JsonKey(name: "TOTALVOLUME24H")
    String totalvolume24H;
    @JsonKey(name: "TOTALVOLUME24HTO")
    String totalvolume24Hto;
    @JsonKey(name: "TOTALTOPTIERVOLUME24H")
    String totaltoptiervolume24H;
    @JsonKey(name: "TOTALTOPTIERVOLUME24HTO")
    String totaltoptiervolume24Hto;
    @JsonKey(name: "IMAGEURL")
    String imageurl;

    DisplayUsd({
        required this.fromsymbol,
        required this.tosymbol,
        required this.market,
        required this.lastmarket,
        required this.toptiervolume24Hour,
        required this.toptiervolume24Hourto,
        required this.lasttradeid,
        required this.price,
        required this.lastupdate,
        required this.lastvolume,
        required this.lastvolumeto,
        required this.volumehour,
        required this.volumehourto,
        required this.openhour,
        required this.highhour,
        required this.lowhour,
        required this.volumeday,
        required this.volumedayto,
        required this.openday,
        required this.highday,
        required this.lowday,
        required this.volume24Hour,
        required this.volume24Hourto,
        required this.open24Hour,
        required this.high24Hour,
        required this.low24Hour,
        required this.change24Hour,
        required this.changepct24Hour,
        required this.changeday,
        required this.changepctday,
        required this.changehour,
        required this.changepcthour,
        required this.conversiontype,
        required this.conversionsymbol,
        required this.conversionlastupdate,
        required this.supply,
        required this.mktcap,
        required this.mktcappenalty,
        required this.circulatingsupply,
        required this.circulatingsupplymktcap,
        required this.totalvolume24H,
        required this.totalvolume24Hto,
        required this.totaltoptiervolume24H,
        required this.totaltoptiervolume24Hto,
        required this.imageurl,
    });

    factory DisplayUsd.fromJson(Map<String, dynamic> json) => _$DisplayUsdFromJson(json);

    Map<String, dynamic> toJson() => _$DisplayUsdToJson(this);
}

@JsonSerializable()
class Raw {
    @JsonKey(name: "USD")
    RawUsd usd;

    Raw({
        required this.usd,
    });

    factory Raw.fromJson(Map<String, dynamic> json) => _$RawFromJson(json);

    Map<String, dynamic> toJson() => _$RawToJson(this);
}

@JsonSerializable()
class RawUsd {
    @JsonKey(name: "TYPE")
    String type;
    @JsonKey(name: "MARKET")
    String market;
    @JsonKey(name: "FROMSYMBOL")
    String fromsymbol;
    @JsonKey(name: "TOSYMBOL")
    String tosymbol;
    @JsonKey(name: "FLAGS")
    String flags;
    @JsonKey(name: "LASTMARKET")
    String lastmarket;
    @JsonKey(name: "MEDIAN")
    double median;
    @JsonKey(name: "TOPTIERVOLUME24HOUR")
    double toptiervolume24Hour;
    @JsonKey(name: "TOPTIERVOLUME24HOURTO")
    double toptiervolume24Hourto;
    @JsonKey(name: "LASTTRADEID")
    String lasttradeid;
    @JsonKey(name: "PRICE")
    double price;
    @JsonKey(name: "LASTUPDATE")
    int lastupdate;
    @JsonKey(name: "LASTVOLUME")
    double lastvolume;
    @JsonKey(name: "LASTVOLUMETO")
    double lastvolumeto;
    @JsonKey(name: "VOLUMEHOUR")
    double volumehour;
    @JsonKey(name: "VOLUMEHOURTO")
    double volumehourto;
    @JsonKey(name: "OPENHOUR")
    double openhour;
    @JsonKey(name: "HIGHHOUR")
    double highhour;
    @JsonKey(name: "LOWHOUR")
    double lowhour;
    @JsonKey(name: "VOLUMEDAY")
    double volumeday;
    @JsonKey(name: "VOLUMEDAYTO")
    double volumedayto;
    @JsonKey(name: "OPENDAY")
    double openday;
    @JsonKey(name: "HIGHDAY")
    double highday;
    @JsonKey(name: "LOWDAY")
    double lowday;
    @JsonKey(name: "VOLUME24HOUR")
    double volume24Hour;
    @JsonKey(name: "VOLUME24HOURTO")
    double volume24Hourto;
    @JsonKey(name: "OPEN24HOUR")
    double open24Hour;
    @JsonKey(name: "HIGH24HOUR")
    double high24Hour;
    @JsonKey(name: "LOW24HOUR")
    double low24Hour;
    @JsonKey(name: "CHANGE24HOUR")
    double change24Hour;
    @JsonKey(name: "CHANGEPCT24HOUR")
    double changepct24Hour;
    @JsonKey(name: "CHANGEDAY")
    double changeday;
    @JsonKey(name: "CHANGEPCTDAY")
    double changepctday;
    @JsonKey(name: "CHANGEHOUR")
    double changehour;
    @JsonKey(name: "CHANGEPCTHOUR")
    double changepcthour;
    @JsonKey(name: "CONVERSIONTYPE")
    String conversiontype;
    @JsonKey(name: "CONVERSIONSYMBOL")
    String conversionsymbol;
    @JsonKey(name: "CONVERSIONLASTUPDATE")
    int conversionlastupdate;
    @JsonKey(name: "SUPPLY")
    double supply;
    @JsonKey(name: "MKTCAP")
    double mktcap;
    @JsonKey(name: "MKTCAPPENALTY")
    int mktcappenalty;
    @JsonKey(name: "CIRCULATINGSUPPLY")
    double circulatingsupply;
    @JsonKey(name: "CIRCULATINGSUPPLYMKTCAP")
    double circulatingsupplymktcap;
    @JsonKey(name: "TOTALVOLUME24H")
    double totalvolume24H;
    @JsonKey(name: "TOTALVOLUME24HTO")
    double totalvolume24Hto;
    @JsonKey(name: "TOTALTOPTIERVOLUME24H")
    double totaltoptiervolume24H;
    @JsonKey(name: "TOTALTOPTIERVOLUME24HTO")
    double totaltoptiervolume24Hto;
    @JsonKey(name: "IMAGEURL")
    String imageurl;

    RawUsd({
        required this.type,
        required this.market,
        required this.fromsymbol,
        required this.tosymbol,
        required this.flags,
        required this.lastmarket,
        required this.median,
        required this.toptiervolume24Hour,
        required this.toptiervolume24Hourto,
        required this.lasttradeid,
        required this.price,
        required this.lastupdate,
        required this.lastvolume,
        required this.lastvolumeto,
        required this.volumehour,
        required this.volumehourto,
        required this.openhour,
        required this.highhour,
        required this.lowhour,
        required this.volumeday,
        required this.volumedayto,
        required this.openday,
        required this.highday,
        required this.lowday,
        required this.volume24Hour,
        required this.volume24Hourto,
        required this.open24Hour,
        required this.high24Hour,
        required this.low24Hour,
        required this.change24Hour,
        required this.changepct24Hour,
        required this.changeday,
        required this.changepctday,
        required this.changehour,
        required this.changepcthour,
        required this.conversiontype,
        required this.conversionsymbol,
        required this.conversionlastupdate,
        required this.supply,
        required this.mktcap,
        required this.mktcappenalty,
        required this.circulatingsupply,
        required this.circulatingsupplymktcap,
        required this.totalvolume24H,
        required this.totalvolume24Hto,
        required this.totaltoptiervolume24H,
        required this.totaltoptiervolume24Hto,
        required this.imageurl,
    });

    factory RawUsd.fromJson(Map<String, dynamic> json) => _$RawUsdFromJson(json);

    Map<String, dynamic> toJson() => _$RawUsdToJson(this);
}

@JsonSerializable()
class MetaData {
    @JsonKey(name: "Count")
    int count;

    MetaData({
        required this.count,
    });

    factory MetaData.fromJson(Map<String, dynamic> json) => _$MetaDataFromJson(json);

    Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}

@JsonSerializable()
class RateLimit {
    RateLimit();

    factory RateLimit.fromJson(Map<String, dynamic> json) => _$RateLimitFromJson(json);

    Map<String, dynamic> toJson() => _$RateLimitToJson(this);
}
