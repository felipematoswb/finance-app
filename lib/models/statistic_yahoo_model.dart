import 'dart:convert';

class Statistic {
  Statistic({
    required this.quoteResponse,
  });

  QuoteResponse quoteResponse;

  factory Statistic.fromRawJson(String str) =>
      Statistic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        quoteResponse: QuoteResponse.fromJson(json["quoteResponse"]),
      );

  Map<String, dynamic> toJson() => {
        "quoteResponse": quoteResponse.toJson(),
      };
}

class QuoteResponse {
  QuoteResponse({
    required this.result,
    this.error,
  });

  List<StatisticResult> result;
  dynamic error;

  factory QuoteResponse.fromRawJson(String str) =>
      QuoteResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuoteResponse.fromJson(Map<String, dynamic> json) => QuoteResponse(
        result: List<StatisticResult>.from(
            json["result"].map((x) => StatisticResult.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "error": error,
      };
}

class StatisticResult {
  StatisticResult({
    required this.fullExchangeName,
    required this.symbol,
    this.fiftyTwoWeekLowChangePercent,
    required this.gmtOffSetMilliseconds,
    required this.regularMarketOpen,
    required this.language,
    required this.regularMarketTime,
    required this.regularMarketChangePercent,
    required this.quoteType,
    required this.uuid,
    required this.regularMarketDayRange,
    required this.fiftyTwoWeekLowChange,
    required this.fiftyTwoWeekHighChangePercent,
    required this.typeDisp,
    required this.regularMarketDayHigh,
    required this.tradeable,
    required this.currency,
    this.sharesOutstanding,
    required this.fiftyTwoWeekHigh,
    required this.regularMarketPreviousClose,
    required this.exchangeTimezoneName,
    required this.fiftyTwoWeekHighChange,
    this.marketCap,
    required this.regularMarketChange,
    required this.fiftyTwoWeekRange,
    required this.cryptoTradeable,
    this.firstTradeDateMilliseconds,
    required this.exchangeDataDelayedBy,
    required this.exchangeTimezoneShortName,
    required this.regularMarketPrice,
    required this.fiftyTwoWeekLow,
    required this.marketState,
    required this.customPriceAlertConfidence,
    required this.regularMarketVolume,
    required this.market,
    required this.quoteSourceName,
    required this.messageBoardId,
    required this.priceHint,
    required this.exchange,
    required this.sourceInterval,
    required this.regularMarketDayLow,
    required this.region,
    required this.shortName,
    required this.triggerable,
    required this.corporateActions,
    required this.longName,
  });

  String fullExchangeName;
  String symbol;
  FiftyTwoWeekHigh? fiftyTwoWeekLowChangePercent;
  int gmtOffSetMilliseconds;
  FiftyTwoWeekHigh regularMarketOpen;
  String language;
  FiftyTwoWeekHigh regularMarketTime;
  FiftyTwoWeekHigh regularMarketChangePercent;
  String quoteType;
  String uuid;
  Range regularMarketDayRange;
  FiftyTwoWeekHigh fiftyTwoWeekLowChange;
  FiftyTwoWeekHigh fiftyTwoWeekHighChangePercent;
  String typeDisp;
  FiftyTwoWeekHigh regularMarketDayHigh;
  bool tradeable;
  String currency;
  MarketCap? sharesOutstanding;
  FiftyTwoWeekHigh fiftyTwoWeekHigh;
  FiftyTwoWeekHigh regularMarketPreviousClose;
  String exchangeTimezoneName;
  FiftyTwoWeekHigh fiftyTwoWeekHighChange;
  MarketCap? marketCap;
  FiftyTwoWeekHigh regularMarketChange;
  Range fiftyTwoWeekRange;
  bool cryptoTradeable;
  int? firstTradeDateMilliseconds;
  int exchangeDataDelayedBy;
  String exchangeTimezoneShortName;
  FiftyTwoWeekHigh regularMarketPrice;
  FiftyTwoWeekHigh fiftyTwoWeekLow;
  String marketState;
  String customPriceAlertConfidence;
  MarketCap regularMarketVolume;
  String market;
  String quoteSourceName;
  String messageBoardId;
  int priceHint;
  String exchange;
  int sourceInterval;
  FiftyTwoWeekHigh regularMarketDayLow;
  String region;
  String shortName;
  bool triggerable;
  List<CorporateAction> corporateActions;
  String longName;

  factory StatisticResult.fromRawJson(String str) =>
      StatisticResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StatisticResult.fromJson(Map<String, dynamic> json) =>
      StatisticResult(
        fullExchangeName: json["fullExchangeName"],
        symbol: json["symbol"],
        fiftyTwoWeekLowChangePercent: json["fiftyTwoWeekLowChangePercent"] ==
                null
            ? null
            : FiftyTwoWeekHigh.fromJson(json["fiftyTwoWeekLowChangePercent"]),
        gmtOffSetMilliseconds: json["gmtOffSetMilliseconds"],
        regularMarketOpen: FiftyTwoWeekHigh.fromJson(json["regularMarketOpen"]),
        language: json["language"],
        regularMarketTime: FiftyTwoWeekHigh.fromJson(json["regularMarketTime"]),
        regularMarketChangePercent:
            FiftyTwoWeekHigh.fromJson(json["regularMarketChangePercent"]),
        quoteType: json["quoteType"],
        uuid: json["uuid"],
        regularMarketDayRange: Range.fromJson(json["regularMarketDayRange"]),
        fiftyTwoWeekLowChange:
            FiftyTwoWeekHigh.fromJson(json["fiftyTwoWeekLowChange"]),
        fiftyTwoWeekHighChangePercent:
            FiftyTwoWeekHigh.fromJson(json["fiftyTwoWeekHighChangePercent"]),
        typeDisp: json["typeDisp"],
        regularMarketDayHigh:
            FiftyTwoWeekHigh.fromJson(json["regularMarketDayHigh"]),
        tradeable: json["tradeable"],
        currency: json["currency"],
        sharesOutstanding: json["sharesOutstanding"] == null
            ? null
            : MarketCap.fromJson(json["sharesOutstanding"]),
        fiftyTwoWeekHigh: FiftyTwoWeekHigh.fromJson(json["fiftyTwoWeekHigh"]),
        regularMarketPreviousClose:
            FiftyTwoWeekHigh.fromJson(json["regularMarketPreviousClose"]),
        exchangeTimezoneName: json["exchangeTimezoneName"],
        fiftyTwoWeekHighChange:
            FiftyTwoWeekHigh.fromJson(json["fiftyTwoWeekHighChange"]),
        marketCap: json["marketCap"] == null
            ? null
            : MarketCap.fromJson(json["marketCap"]),
        regularMarketChange:
            FiftyTwoWeekHigh.fromJson(json["regularMarketChange"]),
        fiftyTwoWeekRange: Range.fromJson(json["fiftyTwoWeekRange"]),
        cryptoTradeable: json["cryptoTradeable"],
        firstTradeDateMilliseconds: json["firstTradeDateMilliseconds"],
        exchangeDataDelayedBy: json["exchangeDataDelayedBy"],
        exchangeTimezoneShortName: json["exchangeTimezoneShortName"],
        regularMarketPrice:
            FiftyTwoWeekHigh.fromJson(json["regularMarketPrice"]),
        fiftyTwoWeekLow: FiftyTwoWeekHigh.fromJson(json["fiftyTwoWeekLow"]),
        marketState: json["marketState"],
        customPriceAlertConfidence: json["customPriceAlertConfidence"],
        regularMarketVolume: MarketCap.fromJson(json["regularMarketVolume"]),
        market: json["market"],
        quoteSourceName: json["quoteSourceName"] ?? '',
        messageBoardId: json["messageBoardId"],
        priceHint: json["priceHint"],
        exchange: json["exchange"],
        sourceInterval: json["sourceInterval"],
        regularMarketDayLow:
            FiftyTwoWeekHigh.fromJson(json["regularMarketDayLow"]),
        region: json["region"],
        shortName: json["shortName"],
        triggerable: json["triggerable"],
        corporateActions: List<CorporateAction>.from(
            json["corporateActions"].map((x) => CorporateAction.fromJson(x))),
        longName: json["longName"],
      );

  Map<String, dynamic> toJson() => {
        "fullExchangeName": fullExchangeName,
        "symbol": symbol,
        "fiftyTwoWeekLowChangePercent": fiftyTwoWeekLowChangePercent?.toJson(),
        "gmtOffSetMilliseconds": gmtOffSetMilliseconds,
        "regularMarketOpen": regularMarketOpen.toJson(),
        "language": language,
        "regularMarketTime": regularMarketTime.toJson(),
        "regularMarketChangePercent": regularMarketChangePercent.toJson(),
        "quoteType": quoteType,
        "uuid": uuid,
        "regularMarketDayRange": regularMarketDayRange.toJson(),
        "fiftyTwoWeekLowChange": fiftyTwoWeekLowChange.toJson(),
        "fiftyTwoWeekHighChangePercent": fiftyTwoWeekHighChangePercent.toJson(),
        "typeDisp": typeDisp,
        "regularMarketDayHigh": regularMarketDayHigh.toJson(),
        "tradeable": tradeable,
        "currency": currency,
        "sharesOutstanding": sharesOutstanding!.toJson(),
        "fiftyTwoWeekHigh": fiftyTwoWeekHigh.toJson(),
        "regularMarketPreviousClose": regularMarketPreviousClose.toJson(),
        "exchangeTimezoneName": exchangeTimezoneName,
        "fiftyTwoWeekHighChange": fiftyTwoWeekHighChange.toJson(),
        "marketCap": marketCap!.toJson(),
        "regularMarketChange": regularMarketChange.toJson(),
        "fiftyTwoWeekRange": fiftyTwoWeekRange.toJson(),
        "cryptoTradeable": cryptoTradeable,
        "firstTradeDateMilliseconds": firstTradeDateMilliseconds,
        "exchangeDataDelayedBy": exchangeDataDelayedBy,
        "exchangeTimezoneShortName": exchangeTimezoneShortName,
        "regularMarketPrice": regularMarketPrice.toJson(),
        "fiftyTwoWeekLow": fiftyTwoWeekLow.toJson(),
        "marketState": marketState,
        "customPriceAlertConfidence": customPriceAlertConfidence,
        "regularMarketVolume": regularMarketVolume.toJson(),
        "market": market,
        "quoteSourceName": quoteSourceName,
        "messageBoardId": messageBoardId,
        "priceHint": priceHint,
        "exchange": exchange,
        "sourceInterval": sourceInterval,
        "regularMarketDayLow": regularMarketDayLow.toJson(),
        "region": region,
        "shortName": shortName,
        "triggerable": triggerable,
        "corporateActions":
            List<dynamic>.from(corporateActions.map((x) => x.toJson())),
        "longName": longName,
      };
}

class CorporateAction {
  CorporateAction({
    required this.header,
    required this.message,
    required this.meta,
  });

  String header;
  String message;
  Meta meta;

  factory CorporateAction.fromRawJson(String str) =>
      CorporateAction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CorporateAction.fromJson(Map<String, dynamic> json) =>
      CorporateAction(
        header: json["header"],
        message: json["message"],
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "header": header,
        "message": message,
        "meta": meta.toJson(),
      };
}

class Meta {
  Meta({
    required this.eventType,
    required this.dateEpochMs,
  });

  String eventType;
  int dateEpochMs;

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        eventType: json["eventType"],
        dateEpochMs: json["dateEpochMs"],
      );

  Map<String, dynamic> toJson() => {
        "eventType": eventType,
        "dateEpochMs": dateEpochMs,
      };
}

class FiftyTwoWeekHigh {
  FiftyTwoWeekHigh({
    required this.raw,
    required this.fmt,
  });

  double raw;
  String fmt;

  factory FiftyTwoWeekHigh.fromRawJson(String str) =>
      FiftyTwoWeekHigh.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FiftyTwoWeekHigh.fromJson(Map<String, dynamic> json) =>
      FiftyTwoWeekHigh(
        raw: json["raw"]?.toDouble(),
        fmt: json["fmt"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "fmt": fmt,
      };
}

class Range {
  Range({
    required this.raw,
    required this.fmt,
  });

  String raw;
  String fmt;

  factory Range.fromRawJson(String str) => Range.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Range.fromJson(Map<String, dynamic> json) => Range(
        raw: json["raw"],
        fmt: json["fmt"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "fmt": fmt,
      };
}

class MarketCap {
  MarketCap({
    required this.raw,
    required this.fmt,
    required this.longFmt,
  });

  int raw;
  String fmt;
  String longFmt;

  factory MarketCap.fromRawJson(String str) =>
      MarketCap.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MarketCap.fromJson(Map<String, dynamic> json) => MarketCap(
        raw: json["raw"],
        fmt: json["fmt"],
        longFmt: json["longFmt"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "fmt": fmt,
        "longFmt": longFmt,
      };
}
