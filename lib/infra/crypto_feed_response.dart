// To parse this JSON data, do
//
//     final cryptoFeedModelResponses = cryptoFeedModelResponsesFromMap(jsonString);

import 'dart:convert';

CryptoFeedModelResponses cryptoFeedModelResponsesFromMap(String str) => CryptoFeedModelResponses.fromMap(json.decode(str));

String cryptoFeedModelResponsesToMap(CryptoFeedModelResponses data) => json.encode(data.toMap());

class CryptoFeedModelResponses {
    String message;
    int type;
    MetaData metaData;
    List<dynamic> sponsoredData;
    List<Datum> data;
    RateLimit rateLimit;
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

    factory CryptoFeedModelResponses.fromMap(Map<String, dynamic> json) => CryptoFeedModelResponses(
        message: json["Message"],
        type: json["Type"],
        metaData: MetaData.fromMap(json["MetaData"]),
        sponsoredData: List<dynamic>.from(json["SponsoredData"].map((x) => x)),
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromMap(x))),
        rateLimit: RateLimit.fromMap(json["RateLimit"]),
        hasWarning: json["HasWarning"],
    );

    Map<String, dynamic> toMap() => {
        "Message": message,
        "Type": type,
        "MetaData": metaData.toMap(),
        "SponsoredData": List<dynamic>.from(sponsoredData.map((x) => x)),
        "Data": List<dynamic>.from(data.map((x) => x.toMap())),
        "RateLimit": rateLimit.toMap(),
        "HasWarning": hasWarning,
    };
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

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        coinInfo: CoinInfo.fromMap(json["CoinInfo"]),
        raw: Raw.fromMap(json["RAW"]),
        display: Display.fromMap(json["DISPLAY"]),
    );

    Map<String, dynamic> toMap() => {
        "CoinInfo": coinInfo.toMap(),
        "RAW": raw.toMap(),
        "DISPLAY": display.toMap(),
    };
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

    factory CoinInfo.fromMap(Map<String, dynamic> json) => CoinInfo(
        id: json["Id"],
        name: json["Name"],
        fullName: json["FullName"],
        internal: json["Internal"],
        imageUrl: json["ImageUrl"],
        url: json["Url"],
        algorithm: json["Algorithm"],
        proofType: json["ProofType"],
        rating: Rating.fromMap(json["Rating"]),
        netHashesPerSecond: json["NetHashesPerSecond"]?.toDouble(),
        blockNumber: json["BlockNumber"],
        blockTime: json["BlockTime"]?.toDouble(),
        blockReward: json["BlockReward"]?.toDouble(),
        assetLaunchDate: DateTime.parse(json["AssetLaunchDate"]),
        maxSupply: json["MaxSupply"]?.toDouble(),
        type: json["Type"],
        documentType: json["DocumentType"],
    );

    Map<String, dynamic> toMap() => {
        "Id": id,
        "Name": name,
        "FullName": fullName,
        "Internal": internal,
        "ImageUrl": imageUrl,
        "Url": url,
        "Algorithm": algorithm,
        "ProofType": proofType,
        "Rating": rating.toMap(),
        "NetHashesPerSecond": netHashesPerSecond,
        "BlockNumber": blockNumber,
        "BlockTime": blockTime,
        "BlockReward": blockReward,
        "AssetLaunchDate": "${assetLaunchDate.year.toString().padLeft(4, '0')}-${assetLaunchDate.month.toString().padLeft(2, '0')}-${assetLaunchDate.day.toString().padLeft(2, '0')}",
        "MaxSupply": maxSupply,
        "Type": type,
        "DocumentType": documentType,
    };
}

class Rating {
    Weiss weiss;

    Rating({
        required this.weiss,
    });

    factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        weiss: Weiss.fromMap(json["Weiss"]),
    );

    Map<String, dynamic> toMap() => {
        "Weiss": weiss.toMap(),
    };
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

    factory Weiss.fromMap(Map<String, dynamic> json) => Weiss(
        rating: json["Rating"],
        technologyAdoptionRating: json["TechnologyAdoptionRating"],
        marketPerformanceRating: json["MarketPerformanceRating"],
    );

    Map<String, dynamic> toMap() => {
        "Rating": rating,
        "TechnologyAdoptionRating": technologyAdoptionRating,
        "MarketPerformanceRating": marketPerformanceRating,
    };
}

class Display {
    DisplayUsd usd;

    Display({
        required this.usd,
    });

    factory Display.fromMap(Map<String, dynamic> json) => Display(
        usd: DisplayUsd.fromMap(json["USD"]),
    );

    Map<String, dynamic> toMap() => {
        "USD": usd.toMap(),
    };
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

    factory DisplayUsd.fromMap(Map<String, dynamic> json) => DisplayUsd(
        fromsymbol: json["FROMSYMBOL"],
        tosymbol: json["TOSYMBOL"],
        market: json["MARKET"],
        lastmarket: json["LASTMARKET"],
        toptiervolume24Hour: json["TOPTIERVOLUME24HOUR"],
        toptiervolume24Hourto: json["TOPTIERVOLUME24HOURTO"],
        lasttradeid: json["LASTTRADEID"],
        price: json["PRICE"],
        lastupdate: json["LASTUPDATE"],
        lastvolume: json["LASTVOLUME"],
        lastvolumeto: json["LASTVOLUMETO"],
        volumehour: json["VOLUMEHOUR"],
        volumehourto: json["VOLUMEHOURTO"],
        openhour: json["OPENHOUR"],
        highhour: json["HIGHHOUR"],
        lowhour: json["LOWHOUR"],
        volumeday: json["VOLUMEDAY"],
        volumedayto: json["VOLUMEDAYTO"],
        openday: json["OPENDAY"],
        highday: json["HIGHDAY"],
        lowday: json["LOWDAY"],
        volume24Hour: json["VOLUME24HOUR"],
        volume24Hourto: json["VOLUME24HOURTO"],
        open24Hour: json["OPEN24HOUR"],
        high24Hour: json["HIGH24HOUR"],
        low24Hour: json["LOW24HOUR"],
        change24Hour: json["CHANGE24HOUR"],
        changepct24Hour: json["CHANGEPCT24HOUR"],
        changeday: json["CHANGEDAY"],
        changepctday: json["CHANGEPCTDAY"],
        changehour: json["CHANGEHOUR"],
        changepcthour: json["CHANGEPCTHOUR"],
        conversiontype: json["CONVERSIONTYPE"],
        conversionsymbol: json["CONVERSIONSYMBOL"],
        conversionlastupdate: json["CONVERSIONLASTUPDATE"],
        supply: json["SUPPLY"],
        mktcap: json["MKTCAP"],
        mktcappenalty: json["MKTCAPPENALTY"],
        circulatingsupply: json["CIRCULATINGSUPPLY"],
        circulatingsupplymktcap: json["CIRCULATINGSUPPLYMKTCAP"],
        totalvolume24H: json["TOTALVOLUME24H"],
        totalvolume24Hto: json["TOTALVOLUME24HTO"],
        totaltoptiervolume24H: json["TOTALTOPTIERVOLUME24H"],
        totaltoptiervolume24Hto: json["TOTALTOPTIERVOLUME24HTO"],
        imageurl: json["IMAGEURL"],
    );

    Map<String, dynamic> toMap() => {
        "FROMSYMBOL": fromsymbol,
        "TOSYMBOL": tosymbol,
        "MARKET": market,
        "LASTMARKET": lastmarket,
        "TOPTIERVOLUME24HOUR": toptiervolume24Hour,
        "TOPTIERVOLUME24HOURTO": toptiervolume24Hourto,
        "LASTTRADEID": lasttradeid,
        "PRICE": price,
        "LASTUPDATE": lastupdate,
        "LASTVOLUME": lastvolume,
        "LASTVOLUMETO": lastvolumeto,
        "VOLUMEHOUR": volumehour,
        "VOLUMEHOURTO": volumehourto,
        "OPENHOUR": openhour,
        "HIGHHOUR": highhour,
        "LOWHOUR": lowhour,
        "VOLUMEDAY": volumeday,
        "VOLUMEDAYTO": volumedayto,
        "OPENDAY": openday,
        "HIGHDAY": highday,
        "LOWDAY": lowday,
        "VOLUME24HOUR": volume24Hour,
        "VOLUME24HOURTO": volume24Hourto,
        "OPEN24HOUR": open24Hour,
        "HIGH24HOUR": high24Hour,
        "LOW24HOUR": low24Hour,
        "CHANGE24HOUR": change24Hour,
        "CHANGEPCT24HOUR": changepct24Hour,
        "CHANGEDAY": changeday,
        "CHANGEPCTDAY": changepctday,
        "CHANGEHOUR": changehour,
        "CHANGEPCTHOUR": changepcthour,
        "CONVERSIONTYPE": conversiontype,
        "CONVERSIONSYMBOL": conversionsymbol,
        "CONVERSIONLASTUPDATE": conversionlastupdate,
        "SUPPLY": supply,
        "MKTCAP": mktcap,
        "MKTCAPPENALTY": mktcappenalty,
        "CIRCULATINGSUPPLY": circulatingsupply,
        "CIRCULATINGSUPPLYMKTCAP": circulatingsupplymktcap,
        "TOTALVOLUME24H": totalvolume24H,
        "TOTALVOLUME24HTO": totalvolume24Hto,
        "TOTALTOPTIERVOLUME24H": totaltoptiervolume24H,
        "TOTALTOPTIERVOLUME24HTO": totaltoptiervolume24Hto,
        "IMAGEURL": imageurl,
    };
}

class Raw {
    RawUsd usd;

    Raw({
        required this.usd,
    });

    factory Raw.fromMap(Map<String, dynamic> json) => Raw(
        usd: RawUsd.fromMap(json["USD"]),
    );

    Map<String, dynamic> toMap() => {
        "USD": usd.toMap(),
    };
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

    factory RawUsd.fromMap(Map<String, dynamic> json) => RawUsd(
        type: json["TYPE"],
        market: json["MARKET"],
        fromsymbol: json["FROMSYMBOL"],
        tosymbol: json["TOSYMBOL"],
        flags: json["FLAGS"],
        lastmarket: json["LASTMARKET"],
        median: json["MEDIAN"]?.toDouble(),
        toptiervolume24Hour: json["TOPTIERVOLUME24HOUR"]?.toDouble(),
        toptiervolume24Hourto: json["TOPTIERVOLUME24HOURTO"]?.toDouble(),
        lasttradeid: json["LASTTRADEID"],
        price: json["PRICE"]?.toDouble(),
        lastupdate: json["LASTUPDATE"],
        lastvolume: json["LASTVOLUME"]?.toDouble(),
        lastvolumeto: json["LASTVOLUMETO"]?.toDouble(),
        volumehour: json["VOLUMEHOUR"]?.toDouble(),
        volumehourto: json["VOLUMEHOURTO"]?.toDouble(),
        openhour: json["OPENHOUR"]?.toDouble(),
        highhour: json["HIGHHOUR"]?.toDouble(),
        lowhour: json["LOWHOUR"]?.toDouble(),
        volumeday: json["VOLUMEDAY"]?.toDouble(),
        volumedayto: json["VOLUMEDAYTO"]?.toDouble(),
        openday: json["OPENDAY"]?.toDouble(),
        highday: json["HIGHDAY"]?.toDouble(),
        lowday: json["LOWDAY"]?.toDouble(),
        volume24Hour: json["VOLUME24HOUR"]?.toDouble(),
        volume24Hourto: json["VOLUME24HOURTO"]?.toDouble(),
        open24Hour: json["OPEN24HOUR"]?.toDouble(),
        high24Hour: json["HIGH24HOUR"]?.toDouble(),
        low24Hour: json["LOW24HOUR"]?.toDouble(),
        change24Hour: json["CHANGE24HOUR"]?.toDouble(),
        changepct24Hour: json["CHANGEPCT24HOUR"]?.toDouble(),
        changeday: json["CHANGEDAY"]?.toDouble(),
        changepctday: json["CHANGEPCTDAY"]?.toDouble(),
        changehour: json["CHANGEHOUR"]?.toDouble(),
        changepcthour: json["CHANGEPCTHOUR"]?.toDouble(),
        conversiontype: json["CONVERSIONTYPE"],
        conversionsymbol: json["CONVERSIONSYMBOL"],
        conversionlastupdate: json["CONVERSIONLASTUPDATE"],
        supply: json["SUPPLY"]?.toDouble(),
        mktcap: json["MKTCAP"]?.toDouble(),
        mktcappenalty: json["MKTCAPPENALTY"],
        circulatingsupply: json["CIRCULATINGSUPPLY"]?.toDouble(),
        circulatingsupplymktcap: json["CIRCULATINGSUPPLYMKTCAP"]?.toDouble(),
        totalvolume24H: json["TOTALVOLUME24H"]?.toDouble(),
        totalvolume24Hto: json["TOTALVOLUME24HTO"]?.toDouble(),
        totaltoptiervolume24H: json["TOTALTOPTIERVOLUME24H"]?.toDouble(),
        totaltoptiervolume24Hto: json["TOTALTOPTIERVOLUME24HTO"]?.toDouble(),
        imageurl: json["IMAGEURL"],
    );

    Map<String, dynamic> toMap() => {
        "TYPE": type,
        "MARKET": market,
        "FROMSYMBOL": fromsymbol,
        "TOSYMBOL": tosymbol,
        "FLAGS": flags,
        "LASTMARKET": lastmarket,
        "MEDIAN": median,
        "TOPTIERVOLUME24HOUR": toptiervolume24Hour,
        "TOPTIERVOLUME24HOURTO": toptiervolume24Hourto,
        "LASTTRADEID": lasttradeid,
        "PRICE": price,
        "LASTUPDATE": lastupdate,
        "LASTVOLUME": lastvolume,
        "LASTVOLUMETO": lastvolumeto,
        "VOLUMEHOUR": volumehour,
        "VOLUMEHOURTO": volumehourto,
        "OPENHOUR": openhour,
        "HIGHHOUR": highhour,
        "LOWHOUR": lowhour,
        "VOLUMEDAY": volumeday,
        "VOLUMEDAYTO": volumedayto,
        "OPENDAY": openday,
        "HIGHDAY": highday,
        "LOWDAY": lowday,
        "VOLUME24HOUR": volume24Hour,
        "VOLUME24HOURTO": volume24Hourto,
        "OPEN24HOUR": open24Hour,
        "HIGH24HOUR": high24Hour,
        "LOW24HOUR": low24Hour,
        "CHANGE24HOUR": change24Hour,
        "CHANGEPCT24HOUR": changepct24Hour,
        "CHANGEDAY": changeday,
        "CHANGEPCTDAY": changepctday,
        "CHANGEHOUR": changehour,
        "CHANGEPCTHOUR": changepcthour,
        "CONVERSIONTYPE": conversiontype,
        "CONVERSIONSYMBOL": conversionsymbol,
        "CONVERSIONLASTUPDATE": conversionlastupdate,
        "SUPPLY": supply,
        "MKTCAP": mktcap,
        "MKTCAPPENALTY": mktcappenalty,
        "CIRCULATINGSUPPLY": circulatingsupply,
        "CIRCULATINGSUPPLYMKTCAP": circulatingsupplymktcap,
        "TOTALVOLUME24H": totalvolume24H,
        "TOTALVOLUME24HTO": totalvolume24Hto,
        "TOTALTOPTIERVOLUME24H": totaltoptiervolume24H,
        "TOTALTOPTIERVOLUME24HTO": totaltoptiervolume24Hto,
        "IMAGEURL": imageurl,
    };
}

class MetaData {
    int count;

    MetaData({
        required this.count,
    });

    factory MetaData.fromMap(Map<String, dynamic> json) => MetaData(
        count: json["Count"],
    );

    Map<String, dynamic> toMap() => {
        "Count": count,
    };
}

class RateLimit {
    RateLimit();

    factory RateLimit.fromMap(Map<String, dynamic> json) => RateLimit(
    );

    Map<String, dynamic> toMap() => {
    };
}
