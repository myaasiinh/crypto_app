class CryptoFeedModel {
    String message;
    int type;
    MetaData metaData;
    List<dynamic> sponsoredData;
    List<Datum> data;
    RateLimit rateLimit;
    bool hasWarning;

    CryptoFeedModel({
        required this.message,
        required this.type,
        required this.metaData,
        required this.sponsoredData,
        required this.data,
        required this.rateLimit,
        required this.hasWarning,
    });

}

class Datum {
    CoinInfo coinInfo;
    Raw raw;
    Display display;

    Datum({
        required this.coinInfo,
        required this.raw,
        required this.display,
    });

}

class CoinInfo {
    String id;
    String name;
    String fullName;
    String internal;
    String imageUrl;
    String url;
    String algorithm;
    String proofType;
    Rating rating;
    double netHashesPerSecond;
    int blockNumber;
    double blockTime;
    double blockReward;
    DateTime assetLaunchDate;
    double maxSupply;
    int type;
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

}

class Rating {
    Weiss weiss;

    Rating({
        required this.weiss,
    });

}

class Weiss {
    String rating;
    String technologyAdoptionRating;
    String marketPerformanceRating;

    Weiss({
        required this.rating,
        required this.technologyAdoptionRating,
        required this.marketPerformanceRating,
    });

}

class Display {
    DisplayUsd usd;

    Display({
        required this.usd,
    });

}

class DisplayUsd {
    String fromsymbol;
    String tosymbol;
    String market;
    String lastmarket;
    String toptiervolume24Hour;
    String toptiervolume24Hourto;
    String lasttradeid;
    String price;
    String lastupdate;
    String lastvolume;
    String lastvolumeto;
    String volumehour;
    String volumehourto;
    String openhour;
    String highhour;
    String lowhour;
    String volumeday;
    String volumedayto;
    String openday;
    String highday;
    String lowday;
    String volume24Hour;
    String volume24Hourto;
    String open24Hour;
    String high24Hour;
    String low24Hour;
    String change24Hour;
    String changepct24Hour;
    String changeday;
    String changepctday;
    String changehour;
    String changepcthour;
    String conversiontype;
    String conversionsymbol;
    String conversionlastupdate;
    String supply;
    String mktcap;
    String mktcappenalty;
    String circulatingsupply;
    String circulatingsupplymktcap;
    String totalvolume24H;
    String totalvolume24Hto;
    String totaltoptiervolume24H;
    String totaltoptiervolume24Hto;
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

}

class Raw {
    RawUsd usd;

    Raw({
        required this.usd,
    });

}

class RawUsd {
    String type;
    String market;
    String fromsymbol;
    String tosymbol;
    String flags;
    String lastmarket;
    double median;
    double toptiervolume24Hour;
    double toptiervolume24Hourto;
    String lasttradeid;
    double price;
    int lastupdate;
    double lastvolume;
    double lastvolumeto;
    double volumehour;
    double volumehourto;
    double openhour;
    double highhour;
    double lowhour;
    double volumeday;
    double volumedayto;
    double openday;
    double highday;
    double lowday;
    double volume24Hour;
    double volume24Hourto;
    double open24Hour;
    double high24Hour;
    double low24Hour;
    double change24Hour;
    double changepct24Hour;
    double changeday;
    double changepctday;
    double changehour;
    double changepcthour;
    String conversiontype;
    String conversionsymbol;
    int conversionlastupdate;
    double supply;
    double mktcap;
    int mktcappenalty;
    double circulatingsupply;
    double circulatingsupplymktcap;
    double totalvolume24H;
    double totalvolume24Hto;
    double totaltoptiervolume24H;
    double totaltoptiervolume24Hto;
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

}

class MetaData {
    int count;

    MetaData({
        required this.count,
    });

}

class RateLimit {
    RateLimit();
}
