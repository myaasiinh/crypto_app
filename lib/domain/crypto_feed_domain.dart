class CryptoFeedModelDomain {
    final String message;
    final int type;
    final MetaData metaData;
    final List<dynamic> sponsoredData;
    final List<Datum> data;
    final RateLimit rateLimit;
    final bool hasWarning;

    CryptoFeedModelDomain({
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
    final CoinInfo coinInfo;
    final Raw raw;
    final Display display;

    Datum({
        required this.coinInfo,
        required this.raw,
        required this.display,
    });
}

class CoinInfo {
    final String id;
    final String name;
    final String fullName;
    final String internal;
    final String imageUrl;
    final String url;
    final String algorithm;
    final String proofType;
    final Rating rating;
    final double netHashesPerSecond;
    final int blockNumber;
    final double blockTime;
    final double blockReward;
    final DateTime assetLaunchDate;
    final double maxSupply;
    final int type;
    final String documentType;

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
    final Weiss weiss;

    Rating({
        required this.weiss,
    });

}

class Weiss {
    final String rating;
    final String technologyAdoptionRating;
    final String marketPerformanceRating;

    Weiss({
        required this.rating,
        required this.technologyAdoptionRating,
        required this.marketPerformanceRating,
    });

}

class Display {
    final DisplayUsd usd;

    Display({
        required this.usd,
    });

}

class DisplayUsd {
    final String fromsymbol;
    final String tosymbol;
    final String market;
    final String lastmarket;
    final String toptiervolume24Hour;
    final String toptiervolume24Hourto;
    final String lasttradeid;
    final String price;
    final String lastupdate;
    final String lastvolume;
    final String lastvolumeto;
    final String volumehour;
    final String volumehourto;
    final String openhour;
    final String highhour;
    final String lowhour;
    final String volumeday;
    final String volumedayto;
    final String openday;
    final String highday;
    final String lowday;
    final String volume24Hour;
    final String volume24Hourto;
    final String open24Hour;
    final String high24Hour;
    final String low24Hour;
    final String change24Hour;
    final String changepct24Hour;
    final String changeday;
    final String changepctday;
    final String changehour;
    final String changepcthour;
    final String conversiontype;
    final String conversionsymbol;
    final String conversionlastupdate;
    final String supply;
    final String mktcap;
    final String mktcappenalty;
    final String circulatingsupply;
    final String circulatingsupplymktcap;
    final String totalvolume24H;
    final String totalvolume24Hto;
    final String totaltoptiervolume24H;
    final String totaltoptiervolume24Hto;
    final String imageurl;

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
    final RawUsd usd;

    Raw({
        required this.usd,
    });

}

class RawUsd {
    final String type;
    final String market;
    final String fromsymbol;
    final String tosymbol;
    final String flags;
    final String lastmarket;
    final double median;
    final double toptiervolume24Hour;
    final double toptiervolume24Hourto;
    final String lasttradeid;
    final double price;
    final int lastupdate;
    final double lastvolume;
    final double lastvolumeto;
    final double volumehour;
    final double volumehourto;
    final double openhour;
    final double highhour;
    final double lowhour;
    final double volumeday;
    final double volumedayto;
    final double openday;
    final double highday;
    final double lowday;
    final double volume24Hour;
    final double volume24Hourto;
    final double open24Hour;
    final double high24Hour;
    final double low24Hour;
    final double change24Hour;
    final double changepct24Hour;
    final double changeday;
    final double changepctday;
    final double changehour;
    final double changepcthour;
    final String conversiontype;
    final String conversionsymbol;
    final int conversionlastupdate;
    final double supply;
    final double mktcap;
    final int mktcappenalty;
    final double circulatingsupply;
    final double circulatingsupplymktcap;
    final double totalvolume24H;
    final double totalvolume24Hto;
    final double totaltoptiervolume24H;
    final double totaltoptiervolume24Hto;
    final String imageurl;

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
    final int count;

    MetaData({
        required this.count,
    });

}

class RateLimit {
    RateLimit();
}
