import 'dart:convert';

class Quotes {
  Quotes({
    required this.finance,
  });

  Finance finance;

  factory Quotes.fromRawJson(String str) => Quotes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        finance: Finance.fromJson(json["finance"]),
      );

  Map<String, dynamic> toJson() => {
        "finance": finance.toJson(),
      };
}

class Finance {
  Finance({
    required this.result,
    this.error,
  });

  List<Result> result;
  dynamic error;

  factory Finance.fromRawJson(String str) => Finance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Finance.fromJson(Map<String, dynamic> json) => Finance(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "error": error,
      };
}

class Result {
  Result({
    required this.id,
    required this.title,
    required this.description,
    required this.canonicalName,
    required this.criteriaMeta,
    required this.rawCriteria,
    required this.start,
    required this.count,
    required this.total,
    required this.quotes,
    required this.useRecords,
    required this.predefinedScr,
    required this.versionId,
    required this.creationDate,
    required this.lastUpdated,
    required this.isPremium,
    required this.iconUrl,
  });

  String id;
  String title;
  String description;
  String canonicalName;
  CriteriaMeta criteriaMeta;
  String rawCriteria;
  int start;
  int count;
  int total;
  List<Quote> quotes;
  bool useRecords;
  bool predefinedScr;
  int versionId;
  int creationDate;
  int lastUpdated;
  bool isPremium;
  String iconUrl;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        canonicalName: json["canonicalName"],
        criteriaMeta: CriteriaMeta.fromJson(json["criteriaMeta"]),
        rawCriteria: json["rawCriteria"],
        start: json["start"],
        count: json["count"],
        total: json["total"],
        quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromJson(x))),
        useRecords: json["useRecords"],
        predefinedScr: json["predefinedScr"],
        versionId: json["versionId"],
        creationDate: json["creationDate"],
        lastUpdated: json["lastUpdated"],
        isPremium: json["isPremium"],
        iconUrl: json["iconUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "canonicalName": canonicalName,
        "criteriaMeta": criteriaMeta.toJson(),
        "rawCriteria": rawCriteria,
        "start": start,
        "count": count,
        "total": total,
        "quotes": List<dynamic>.from(quotes.map((x) => x.toJson())),
        "useRecords": useRecords,
        "predefinedScr": predefinedScr,
        "versionId": versionId,
        "creationDate": creationDate,
        "lastUpdated": lastUpdated,
        "isPremium": isPremium,
        "iconUrl": iconUrl,
      };
}

class CriteriaMeta {
  CriteriaMeta({
    required this.size,
    required this.offset,
    required this.sortField,
    required this.sortType,
    required this.quoteType,
    required this.criteria,
    required this.topOperator,
  });

  int size;
  int offset;
  String sortField;
  String sortType;
  QuoteType quoteType;
  List<Criterion> criteria;
  String topOperator;

  factory CriteriaMeta.fromRawJson(String str) =>
      CriteriaMeta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CriteriaMeta.fromJson(Map<String, dynamic> json) => CriteriaMeta(
        size: json["size"],
        offset: json["offset"],
        sortField: json["sortField"],
        sortType: json["sortType"],
        quoteType: quoteTypeValues.map[json["quoteType"]]!,
        criteria: List<Criterion>.from(
            json["criteria"].map((x) => Criterion.fromJson(x))),
        topOperator: json["topOperator"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "offset": offset,
        "sortField": sortField,
        "sortType": sortType,
        "quoteType": quoteTypeValues.reverse[quoteType],
        "criteria": List<dynamic>.from(criteria.map((x) => x.toJson())),
        "topOperator": topOperator,
      };
}

class Criterion {
  Criterion({
    required this.field,
    required this.operators,
    required this.values,
    required this.labelsSelected,
    required this.dependentValues,
  });

  String field;
  List<String> operators;
  List<dynamic> values;
  List<int> labelsSelected;
  List<dynamic> dependentValues;

  factory Criterion.fromRawJson(String str) =>
      Criterion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Criterion.fromJson(Map<String, dynamic> json) => Criterion(
        field: json["field"],
        operators: List<String>.from(json["operators"].map((x) => x)),
        values: List<dynamic>.from(json["values"].map((x) => x)),
        labelsSelected: List<int>.from(json["labelsSelected"].map((x) => x)),
        dependentValues:
            List<dynamic>.from(json["dependentValues"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "field": field,
        "operators": List<dynamic>.from(operators.map((x) => x)),
        "values": List<dynamic>.from(values.map((x) => x)),
        "labelsSelected": List<dynamic>.from(labelsSelected.map((x) => x)),
        "dependentValues": List<dynamic>.from(dependentValues.map((x) => x)),
      };
}

enum QuoteType { EQUITY }

final quoteTypeValues = EnumValues({"EQUITY": QuoteType.EQUITY});

class Quote {
  Quote({
    required this.symbol,
    this.twoHundredDayAverageChangePercent,
    this.fiftyTwoWeekLowChangePercent,
    this.averageAnalystRating,
    required this.language,
    required this.regularMarketDayRange,
    this.earningsTimestampEnd,
    this.epsForward,
    required this.regularMarketDayHigh,
    this.twoHundredDayAverageChange,
    this.twoHundredDayAverage,
    this.bookValue,
    this.marketCap,
    required this.fiftyTwoWeekHighChange,
    required this.fiftyTwoWeekRange,
    this.fiftyDayAverageChange,
    this.averageDailyVolume3Month,
    required this.exchangeDataDelayedBy,
    this.firstTradeDateMilliseconds,
    this.trailingAnnualDividendRate,
    required this.fiftyTwoWeekLow,
    required this.market,
    required this.regularMarketVolume,
    required this.quoteSourceName,
    required this.messageBoardId,
    required this.priceHint,
    required this.regularMarketDayLow,
    required this.sourceInterval,
    required this.exchange,
    required this.region,
    required this.shortName,
    this.fiftyDayAverageChangePercent,
    required this.fullExchangeName,
    this.earningsTimestampStart,
    this.financialCurrency,
    required this.gmtOffSetMilliseconds,
    required this.regularMarketOpen,
    required this.regularMarketTime,
    required this.regularMarketChangePercent,
    this.trailingAnnualDividendYield,
    required this.quoteType,
    this.averageDailyVolume10Day,
    required this.fiftyTwoWeekLowChange,
    this.fiftyTwoWeekHighChangePercent,
    required this.typeDisp,
    required this.tradeable,
    required this.currency,
    this.sharesOutstanding,
    required this.regularMarketPreviousClose,
    required this.fiftyTwoWeekHigh,
    required this.exchangeTimezoneName,
    required this.regularMarketChange,
    this.priceEpsCurrentYear,
    required this.cryptoTradeable,
    this.fiftyDayAverage,
    this.epsCurrentYear,
    required this.exchangeTimezoneShortName,
    required this.regularMarketPrice,
    required this.customPriceAlertConfidence,
    this.forwardPe,
    this.earningsTimestamp,
    required this.ask,
    this.epsTrailingTwelveMonths,
    this.priceToBook,
    required this.triggerable,
    required this.longName,
    this.askSize,
    this.bidSize,
    this.trailingPe,
    this.ipoExpectedDate,
    this.prevName,
    this.nameChangeDate,
    required this.marketState,
  });

  String symbol;
  Ask? twoHundredDayAverageChangePercent;
  Ask? fiftyTwoWeekLowChangePercent;
  String? averageAnalystRating;
  Language language;
  Range regularMarketDayRange;
  RegularMarketVolume? earningsTimestampEnd;
  Ask? epsForward;
  Ask regularMarketDayHigh;
  Ask? twoHundredDayAverageChange;
  Ask? twoHundredDayAverage;
  Ask? bookValue;
  RegularMarketVolume? marketCap;
  Ask fiftyTwoWeekHighChange;
  Range fiftyTwoWeekRange;
  Ask? fiftyDayAverageChange;
  RegularMarketVolume? averageDailyVolume3Month;
  int exchangeDataDelayedBy;
  int? firstTradeDateMilliseconds;
  Ask? trailingAnnualDividendRate;
  Ask fiftyTwoWeekLow;
  Market market;
  RegularMarketVolume regularMarketVolume;
  QuoteSourceName quoteSourceName;
  String messageBoardId;
  int priceHint;
  Ask regularMarketDayLow;
  int sourceInterval;
  Exchange exchange;
  Region region;
  String shortName;
  Ask? fiftyDayAverageChangePercent;
  String fullExchangeName;
  RegularMarketVolume? earningsTimestampStart;
  Currency? financialCurrency;
  int gmtOffSetMilliseconds;
  Ask regularMarketOpen;
  Ask regularMarketTime;
  Ask regularMarketChangePercent;
  Ask? trailingAnnualDividendYield;
  QuoteType quoteType;
  RegularMarketVolume? averageDailyVolume10Day;
  Ask fiftyTwoWeekLowChange;
  Ask? fiftyTwoWeekHighChangePercent;
  TypeDisp typeDisp;
  bool tradeable;
  Currency currency;
  RegularMarketVolume? sharesOutstanding;
  Ask regularMarketPreviousClose;
  Ask fiftyTwoWeekHigh;
  ExchangeTimezoneName exchangeTimezoneName;
  Ask regularMarketChange;
  Ask? priceEpsCurrentYear;
  bool cryptoTradeable;
  Ask? fiftyDayAverage;
  Ask? epsCurrentYear;
  ExchangeTimezoneShortName exchangeTimezoneShortName;
  Ask regularMarketPrice;

  CustomPriceAlertConfidence customPriceAlertConfidence;
  String marketState;

  Ask? forwardPe;
  RegularMarketVolume? earningsTimestamp;
  Ask ask;
  Ask? epsTrailingTwelveMonths;

  Ask? priceToBook;
  bool triggerable;
  String longName;
  RegularMarketVolume? askSize;
  RegularMarketVolume? bidSize;
  Ask? trailingPe;
  DateTime? ipoExpectedDate;
  String? prevName;
  DateTime? nameChangeDate;

  factory Quote.fromRawJson(String str) => Quote.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        symbol: json["symbol"],
        marketState: json["marketState"],
        twoHundredDayAverageChangePercent:
            json["twoHundredDayAverageChangePercent"] == null
                ? null
                : Ask.fromJson(json["twoHundredDayAverageChangePercent"]),
        fiftyTwoWeekLowChangePercent:
            json["fiftyTwoWeekLowChangePercent"] == null
                ? null
                : Ask.fromJson(json["fiftyTwoWeekLowChangePercent"]),
        averageAnalystRating: json["averageAnalystRating"],
        language: languageValues.map[json["language"]]!,
        regularMarketDayRange: Range.fromJson(json["regularMarketDayRange"]),
        earningsTimestampEnd: json["earningsTimestampEnd"] == null
            ? null
            : RegularMarketVolume.fromJson(json["earningsTimestampEnd"]),
        epsForward: json["epsForward"] == null
            ? null
            : Ask.fromJson(json["epsForward"]),
        regularMarketDayHigh: Ask.fromJson(json["regularMarketDayHigh"]),
        twoHundredDayAverageChange: json["twoHundredDayAverageChange"] == null
            ? null
            : Ask.fromJson(json["twoHundredDayAverageChange"]),
        twoHundredDayAverage: json["twoHundredDayAverage"] == null
            ? null
            : Ask.fromJson(json["twoHundredDayAverage"]),
        bookValue:
            json["bookValue"] == null ? null : Ask.fromJson(json["bookValue"]),
        marketCap: json["marketCap"] == null
            ? null
            : RegularMarketVolume.fromJson(json["marketCap"]),
        fiftyTwoWeekHighChange: Ask.fromJson(json["fiftyTwoWeekHighChange"]),
        fiftyTwoWeekRange: Range.fromJson(json["fiftyTwoWeekRange"]),
        fiftyDayAverageChange: json["fiftyDayAverageChange"] == null
            ? null
            : Ask.fromJson(json["fiftyDayAverageChange"]),
        averageDailyVolume3Month: json["averageDailyVolume3Month"] == null
            ? null
            : RegularMarketVolume.fromJson(json["averageDailyVolume3Month"]),
        exchangeDataDelayedBy: json["exchangeDataDelayedBy"],
        firstTradeDateMilliseconds: json["firstTradeDateMilliseconds"],
        trailingAnnualDividendRate: json["trailingAnnualDividendRate"] == null
            ? null
            : Ask.fromJson(json["trailingAnnualDividendRate"]),
        fiftyTwoWeekLow: Ask.fromJson(json["fiftyTwoWeekLow"]),
        market: marketValues.map[json["market"]]!,
        regularMarketVolume:
            RegularMarketVolume.fromJson(json["regularMarketVolume"]),
        quoteSourceName: quoteSourceNameValues.map[json["quoteSourceName"]]!,
        messageBoardId: json["messageBoardId"] ?? '',
        priceHint: json["priceHint"],
        regularMarketDayLow: Ask.fromJson(json["regularMarketDayLow"]),
        sourceInterval: json["sourceInterval"],
        exchange: exchangeValues.map[json["exchange"]]!,
        region: regionValues.map[json["region"]]!,
        shortName: json["shortName"] ?? '',
        fiftyDayAverageChangePercent:
            json["fiftyDayAverageChangePercent"] == null
                ? null
                : Ask.fromJson(json["fiftyDayAverageChangePercent"]),
        fullExchangeName: json["fullExchangeName"],
        earningsTimestampStart: json["earningsTimestampStart"] == null
            ? null
            : RegularMarketVolume.fromJson(json["earningsTimestampStart"]),
        financialCurrency: currencyValues.map[json["financialCurrency"]],
        gmtOffSetMilliseconds: json["gmtOffSetMilliseconds"],
        regularMarketOpen: Ask.fromJson(json["regularMarketOpen"]),
        regularMarketTime: Ask.fromJson(json["regularMarketTime"]),
        regularMarketChangePercent:
            Ask.fromJson(json["regularMarketChangePercent"]),
        trailingAnnualDividendYield: json["trailingAnnualDividendYield"] == null
            ? null
            : Ask.fromJson(json["trailingAnnualDividendYield"]),
        quoteType: quoteTypeValues.map[json["quoteType"]]!,
        averageDailyVolume10Day: json["averageDailyVolume10Day"] == null
            ? null
            : RegularMarketVolume.fromJson(json["averageDailyVolume10Day"]),
        fiftyTwoWeekLowChange: Ask.fromJson(json["fiftyTwoWeekLowChange"]),
        fiftyTwoWeekHighChangePercent:
            json["fiftyTwoWeekHighChangePercent"] == null
                ? null
                : Ask.fromJson(json["fiftyTwoWeekHighChangePercent"]),
        typeDisp: typeDispValues.map[json["typeDisp"]]!,
        tradeable: json["tradeable"],
        currency: currencyValues.map[json["currency"]]!,
        sharesOutstanding: json["sharesOutstanding"] == null
            ? null
            : RegularMarketVolume.fromJson(json["sharesOutstanding"]),
        regularMarketPreviousClose:
            Ask.fromJson(json["regularMarketPreviousClose"]),
        fiftyTwoWeekHigh: Ask.fromJson(json["fiftyTwoWeekHigh"]),
        exchangeTimezoneName:
            exchangeTimezoneNameValues.map[json["exchangeTimezoneName"]]!,
        regularMarketChange: Ask.fromJson(json["regularMarketChange"]),
        priceEpsCurrentYear: json["priceEpsCurrentYear"] == null
            ? null
            : Ask.fromJson(json["priceEpsCurrentYear"]),
        cryptoTradeable: json["cryptoTradeable"],
        fiftyDayAverage: json["fiftyDayAverage"] == null
            ? null
            : Ask.fromJson(json["fiftyDayAverage"]),
        epsCurrentYear: json["epsCurrentYear"] == null
            ? null
            : Ask.fromJson(json["epsCurrentYear"]),
        exchangeTimezoneShortName: exchangeTimezoneShortNameValues
            .map[json["exchangeTimezoneShortName"]]!,
        regularMarketPrice: Ask.fromJson(json["regularMarketPrice"]),
        customPriceAlertConfidence: customPriceAlertConfidenceValues
            .map[json["customPriceAlertConfidence"]]!,
        forwardPe:
            json["forwardPE"] == null ? null : Ask.fromJson(json["forwardPE"]),
        earningsTimestamp: json["earningsTimestamp"] == null
            ? null
            : RegularMarketVolume.fromJson(json["earningsTimestamp"]),
        ask: Ask.fromJson(json["ask"]),
        epsTrailingTwelveMonths: json["epsTrailingTwelveMonths"] == null
            ? null
            : Ask.fromJson(json["epsTrailingTwelveMonths"]),
        priceToBook: json["priceToBook"] == null
            ? null
            : Ask.fromJson(json["priceToBook"]),
        triggerable: json["triggerable"],
        longName: json["longName"] ?? '',
        askSize: json["askSize"] == null
            ? null
            : RegularMarketVolume.fromJson(json["askSize"]),
        bidSize: json["bidSize"] == null
            ? null
            : RegularMarketVolume.fromJson(json["bidSize"]),
        trailingPe: json["trailingPE"] == null
            ? null
            : Ask.fromJson(json["trailingPE"]),
        ipoExpectedDate: json["ipoExpectedDate"] == null
            ? null
            : DateTime.parse(json["ipoExpectedDate"]),
        prevName: json["prevName"],
        nameChangeDate: json["nameChangeDate"] == null
            ? null
            : DateTime.parse(json["nameChangeDate"]),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "marketState": marketState,
        "twoHundredDayAverageChangePercent":
            twoHundredDayAverageChangePercent?.toJson(),
        "fiftyTwoWeekLowChangePercent": fiftyTwoWeekLowChangePercent?.toJson(),
        "averageAnalystRating": averageAnalystRating,
        "language": languageValues.reverse[language],
        "regularMarketDayRange": regularMarketDayRange.toJson(),
        "earningsTimestampEnd": earningsTimestampEnd?.toJson(),
        "epsForward": epsForward?.toJson(),
        "regularMarketDayHigh": regularMarketDayHigh.toJson(),
        "twoHundredDayAverageChange": twoHundredDayAverageChange?.toJson(),
        "twoHundredDayAverage": twoHundredDayAverage?.toJson(),
        "bookValue": bookValue?.toJson(),
        "marketCap": marketCap?.toJson(),
        "fiftyTwoWeekHighChange": fiftyTwoWeekHighChange.toJson(),
        "fiftyTwoWeekRange": fiftyTwoWeekRange.toJson(),
        "fiftyDayAverageChange": fiftyDayAverageChange?.toJson(),
        "averageDailyVolume3Month": averageDailyVolume3Month?.toJson(),
        "exchangeDataDelayedBy": exchangeDataDelayedBy,
        "firstTradeDateMilliseconds": firstTradeDateMilliseconds,
        "trailingAnnualDividendRate": trailingAnnualDividendRate?.toJson(),
        "fiftyTwoWeekLow": fiftyTwoWeekLow.toJson(),
        "market": marketValues.reverse[market],
        "regularMarketVolume": regularMarketVolume.toJson(),
        "quoteSourceName": quoteSourceNameValues.reverse[quoteSourceName],
        "messageBoardId": messageBoardId,
        "priceHint": priceHint,
        "regularMarketDayLow": regularMarketDayLow.toJson(),
        "sourceInterval": sourceInterval,
        "exchange": exchangeValues.reverse[exchange],
        "region": regionValues.reverse[region],
        "shortName": shortName,
        "fiftyDayAverageChangePercent": fiftyDayAverageChangePercent?.toJson(),
        "fullExchangeName": fullExchangeName,
        "earningsTimestampStart": earningsTimestampStart?.toJson(),
        "financialCurrency": currencyValues.reverse[financialCurrency],
        "gmtOffSetMilliseconds": gmtOffSetMilliseconds,
        "regularMarketOpen": regularMarketOpen.toJson(),
        "regularMarketTime": regularMarketTime.toJson(),
        "regularMarketChangePercent": regularMarketChangePercent.toJson(),
        "trailingAnnualDividendYield": trailingAnnualDividendYield?.toJson(),
        "quoteType": quoteTypeValues.reverse[quoteType],
        "averageDailyVolume10Day": averageDailyVolume10Day?.toJson(),
        "fiftyTwoWeekLowChange": fiftyTwoWeekLowChange.toJson(),
        "fiftyTwoWeekHighChangePercent":
            fiftyTwoWeekHighChangePercent?.toJson(),
        "typeDisp": typeDispValues.reverse[typeDisp],
        "tradeable": tradeable,
        "currency": currencyValues.reverse[currency],
        "sharesOutstanding": sharesOutstanding?.toJson(),
        "regularMarketPreviousClose": regularMarketPreviousClose.toJson(),
        "fiftyTwoWeekHigh": fiftyTwoWeekHigh.toJson(),
        "exchangeTimezoneName":
            exchangeTimezoneNameValues.reverse[exchangeTimezoneName],
        "regularMarketChange": regularMarketChange.toJson(),
        "priceEpsCurrentYear": priceEpsCurrentYear?.toJson(),
        "cryptoTradeable": cryptoTradeable,
        "fiftyDayAverage": fiftyDayAverage?.toJson(),
        "epsCurrentYear": epsCurrentYear?.toJson(),
        "exchangeTimezoneShortName":
            exchangeTimezoneShortNameValues.reverse[exchangeTimezoneShortName],
        "regularMarketPrice": regularMarketPrice.toJson(),
        "customPriceAlertConfidence": customPriceAlertConfidenceValues
            .reverse[customPriceAlertConfidence],
        "forwardPE": forwardPe?.toJson(),
        "earningsTimestamp": earningsTimestamp?.toJson(),
        "ask": ask.toJson(),
        "epsTrailingTwelveMonths": epsTrailingTwelveMonths?.toJson(),
        "priceToBook": priceToBook?.toJson(),
        "triggerable": triggerable,
        "longName": longName,
        "askSize": askSize?.toJson(),
        "bidSize": bidSize?.toJson(),
        "trailingPE": trailingPe?.toJson(),
        "ipoExpectedDate":
            "${ipoExpectedDate!.year.toString().padLeft(4, '0')}-${ipoExpectedDate!.month.toString().padLeft(2, '0')}-${ipoExpectedDate!.day.toString().padLeft(2, '0')}",
        "prevName": prevName,
        "nameChangeDate":
            "${nameChangeDate!.year.toString().padLeft(4, '0')}-${nameChangeDate!.month.toString().padLeft(2, '0')}-${nameChangeDate!.day.toString().padLeft(2, '0')}",
      };
}

class Ask {
  Ask({
    required this.raw,
    required this.fmt,
  });

  double raw;
  String fmt;

  factory Ask.fromRawJson(String str) => Ask.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ask.fromJson(Map<String, dynamic> json) => Ask(
        raw: json["raw"]?.toDouble(),
        fmt: json["fmt"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "fmt": fmt,
      };
}

class RegularMarketVolume {
  RegularMarketVolume({
    required this.raw,
    required this.fmt,
    required this.longFmt,
  });

  int raw;
  String fmt;
  String longFmt;

  factory RegularMarketVolume.fromRawJson(String str) =>
      RegularMarketVolume.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegularMarketVolume.fromJson(Map<String, dynamic> json) =>
      RegularMarketVolume(
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

enum Currency { BRL }

final currencyValues = EnumValues({"BRL": Currency.BRL});

enum CustomPriceAlertConfidence { NONE }

final customPriceAlertConfidenceValues =
    EnumValues({"NONE": CustomPriceAlertConfidence.NONE});

enum Exchange { SAO }

final exchangeValues = EnumValues({"SAO": Exchange.SAO});

enum ExchangeTimezoneName { AMERICA_SAO_PAULO }

final exchangeTimezoneNameValues =
    EnumValues({"America/Sao_Paulo": ExchangeTimezoneName.AMERICA_SAO_PAULO});

enum ExchangeTimezoneShortName { BRT }

final exchangeTimezoneShortNameValues =
    EnumValues({"BRT": ExchangeTimezoneShortName.BRT});

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

enum Language { PT_BR }

final languageValues = EnumValues({"pt-BR": Language.PT_BR});

enum Market { BR_MARKET }

final marketValues = EnumValues({"br_market": Market.BR_MARKET});

enum MarketState { POST }

final marketStateValues = EnumValues({"POST": MarketState.POST});

enum QuoteSourceName { DELAYED_QUOTE }

final quoteSourceNameValues =
    EnumValues({"Delayed Quote": QuoteSourceName.DELAYED_QUOTE});

enum Region { BR }

final regionValues = EnumValues({"BR": Region.BR});

enum TypeDisp { AO }

final typeDispValues = EnumValues({"Ação": TypeDisp.AO});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
