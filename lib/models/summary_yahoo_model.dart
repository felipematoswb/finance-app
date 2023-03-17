import 'dart:convert';

class Summary {
  Summary({
    required this.quoteSummary,
  });

  QuoteSummary quoteSummary;

  factory Summary.fromRawJson(String str) => Summary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        quoteSummary: QuoteSummary.fromJson(json["quoteSummary"]),
      );

  Map<String, dynamic> toJson() => {
        "quoteSummary": quoteSummary.toJson(),
      };
}

class QuoteSummary {
  QuoteSummary({
    required this.result,
    this.error,
  });

  List<Result> result;
  dynamic error;

  factory QuoteSummary.fromRawJson(String str) =>
      QuoteSummary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuoteSummary.fromJson(Map<String, dynamic> json) => QuoteSummary(
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
    required this.recommendationTrend,
    required this.earnings,
    required this.calendarEvents,
    required this.esgScores,
    required this.defaultKeyStatistics,
    required this.summaryProfile,
    required this.financialData,
  });

  RecommendationTrend recommendationTrend;
  ResultEarnings earnings;
  CalendarEvents calendarEvents;
  EsgScores esgScores;
  DefaultKeyStatistics defaultKeyStatistics;
  SummaryProfile summaryProfile;
  FinancialData financialData;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        recommendationTrend:
            RecommendationTrend.fromJson(json["recommendationTrend"]),
        earnings: ResultEarnings.fromJson(json["earnings"]),
        calendarEvents: CalendarEvents.fromJson(json["calendarEvents"]),
        esgScores: EsgScores.fromJson(json["esgScores"]),
        defaultKeyStatistics:
            DefaultKeyStatistics.fromJson(json["defaultKeyStatistics"]),
        summaryProfile: SummaryProfile.fromJson(json["summaryProfile"]),
        financialData: FinancialData.fromJson(json["financialData"]),
      );

  Map<String, dynamic> toJson() => {
        "recommendationTrend": recommendationTrend.toJson(),
        "earnings": earnings.toJson(),
        "calendarEvents": calendarEvents.toJson(),
        "esgScores": esgScores.toJson(),
        "defaultKeyStatistics": defaultKeyStatistics.toJson(),
        "summaryProfile": summaryProfile.toJson(),
        "financialData": financialData.toJson(),
      };
}

class CalendarEvents {
  CalendarEvents({
    required this.maxAge,
    required this.earnings,
    required this.exDividendDate,
    required this.dividendDate,
  });

  int maxAge;
  CalendarEventsEarnings earnings;
  ExDividendDate exDividendDate;
  DividendDate dividendDate;

  factory CalendarEvents.fromRawJson(String str) =>
      CalendarEvents.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CalendarEvents.fromJson(Map<String, dynamic> json) => CalendarEvents(
        maxAge: json["maxAge"],
        earnings: CalendarEventsEarnings.fromJson(json["earnings"]),
        exDividendDate: ExDividendDate.fromJson(json["exDividendDate"]),
        dividendDate: DividendDate.fromJson(json["dividendDate"]),
      );

  Map<String, dynamic> toJson() => {
        "maxAge": maxAge,
        "earnings": earnings.toJson(),
        "exDividendDate": exDividendDate.toJson(),
        "dividendDate": dividendDate.toJson(),
      };
}

class DividendDate {
  DividendDate();

  factory DividendDate.fromRawJson(String str) =>
      DividendDate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DividendDate.fromJson(Map<String, dynamic> json) => DividendDate();

  Map<String, dynamic> toJson() => {};
}

class CalendarEventsEarnings {
  CalendarEventsEarnings({
    required this.earningsDate,
    required this.earningsAverage,
    required this.earningsLow,
    required this.earningsHigh,
    required this.revenueAverage,
    required this.revenueLow,
    required this.revenueHigh,
  });

  List<ExDividendDate> earningsDate;
  ExDividendDate earningsAverage;
  ExDividendDate earningsLow;
  ExDividendDate earningsHigh;
  EnterpriseValue revenueAverage;
  EnterpriseValue revenueLow;
  EnterpriseValue revenueHigh;

  factory CalendarEventsEarnings.fromRawJson(String str) =>
      CalendarEventsEarnings.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CalendarEventsEarnings.fromJson(Map<String, dynamic> json) =>
      CalendarEventsEarnings(
        earningsDate: List<ExDividendDate>.from(
            json["earningsDate"].map((x) => ExDividendDate.fromJson(x))),
        earningsAverage: ExDividendDate.fromJson(json["earningsAverage"]),
        earningsLow: ExDividendDate.fromJson(json["earningsLow"]),
        earningsHigh: ExDividendDate.fromJson(json["earningsHigh"]),
        revenueAverage: EnterpriseValue.fromJson(json["revenueAverage"]),
        revenueLow: EnterpriseValue.fromJson(json["revenueLow"]),
        revenueHigh: EnterpriseValue.fromJson(json["revenueHigh"]),
      );

  Map<String, dynamic> toJson() => {
        "earningsDate": List<dynamic>.from(earningsDate.map((x) => x.toJson())),
        "earningsAverage": earningsAverage.toJson(),
        "earningsLow": earningsLow.toJson(),
        "earningsHigh": earningsHigh.toJson(),
        "revenueAverage": revenueAverage.toJson(),
        "revenueLow": revenueLow.toJson(),
        "revenueHigh": revenueHigh.toJson(),
      };
}

class ExDividendDate {
  ExDividendDate({
    required this.raw,
    required this.fmt,
  });

  double raw;
  String fmt;

  factory ExDividendDate.fromRawJson(String str) =>
      ExDividendDate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExDividendDate.fromJson(Map<String, dynamic> json) => ExDividendDate(
        raw: json["raw"]?.toDouble(),
        fmt: json["fmt"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "fmt": fmt,
      };
}

class EnterpriseValue {
  EnterpriseValue({
    required this.raw,
    this.fmt,
    required this.longFmt,
  });

  int raw;
  String? fmt;
  String longFmt;

  factory EnterpriseValue.fromRawJson(String str) =>
      EnterpriseValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EnterpriseValue.fromJson(Map<String, dynamic> json) =>
      EnterpriseValue(
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

class DefaultKeyStatistics {
  DefaultKeyStatistics({
    required this.maxAge,
    required this.priceHint,
    required this.enterpriseValue,
    required this.forwardPe,
    required this.profitMargins,
    required this.floatShares,
    required this.sharesOutstanding,
    required this.sharesShort,
    required this.sharesShortPriorMonth,
    required this.sharesShortPreviousMonthDate,
    required this.dateShortInterest,
    required this.sharesPercentSharesOut,
    required this.heldPercentInsiders,
    required this.heldPercentInstitutions,
    required this.shortRatio,
    required this.shortPercentOfFloat,
    required this.beta,
    required this.impliedSharesOutstanding,
    required this.morningStarOverallRating,
    required this.morningStarRiskRating,
    this.category,
    required this.bookValue,
    required this.priceToBook,
    required this.annualReportExpenseRatio,
    required this.ytdReturn,
    required this.beta3Year,
    required this.totalAssets,
    required this.defaultKeyStatisticsYield,
    this.fundFamily,
    required this.fundInceptionDate,
    this.legalType,
    required this.threeYearAverageReturn,
    required this.fiveYearAverageReturn,
    required this.priceToSalesTrailing12Months,
    required this.lastFiscalYearEnd,
    required this.nextFiscalYearEnd,
    required this.mostRecentQuarter,
    required this.earningsQuarterlyGrowth,
    required this.revenueQuarterlyGrowth,
    required this.netIncomeToCommon,
    required this.trailingEps,
    required this.forwardEps,
    required this.pegRatio,
    required this.lastSplitFactor,
    required this.lastSplitDate,
    required this.enterpriseToRevenue,
    required this.enterpriseToEbitda,
    required this.the52WeekChange,
    required this.sandP52WeekChange,
    required this.lastDividendValue,
    required this.lastDividendDate,
    required this.lastCapGain,
    required this.annualHoldingsTurnover,
  });

  int maxAge;
  EnterpriseValue priceHint;
  EnterpriseValue enterpriseValue;
  ExDividendDate forwardPe;
  ExDividendDate profitMargins;
  EnterpriseValue floatShares;
  EnterpriseValue sharesOutstanding;
  DividendDate sharesShort;
  DividendDate sharesShortPriorMonth;
  DividendDate sharesShortPreviousMonthDate;
  DividendDate dateShortInterest;
  DividendDate sharesPercentSharesOut;
  ExDividendDate heldPercentInsiders;
  ExDividendDate heldPercentInstitutions;
  DividendDate shortRatio;
  DividendDate shortPercentOfFloat;
  ExDividendDate beta;
  EnterpriseValue impliedSharesOutstanding;
  DividendDate morningStarOverallRating;
  DividendDate morningStarRiskRating;
  dynamic category;
  ExDividendDate bookValue;
  ExDividendDate priceToBook;
  DividendDate annualReportExpenseRatio;
  DividendDate ytdReturn;
  DividendDate beta3Year;
  DividendDate totalAssets;
  DividendDate defaultKeyStatisticsYield;
  dynamic fundFamily;
  DividendDate fundInceptionDate;
  dynamic legalType;
  DividendDate threeYearAverageReturn;
  DividendDate fiveYearAverageReturn;
  DividendDate priceToSalesTrailing12Months;
  ExDividendDate lastFiscalYearEnd;
  ExDividendDate nextFiscalYearEnd;
  ExDividendDate mostRecentQuarter;
  ExDividendDate earningsQuarterlyGrowth;
  DividendDate revenueQuarterlyGrowth;
  EnterpriseValue netIncomeToCommon;
  ExDividendDate trailingEps;
  ExDividendDate forwardEps;
  ExDividendDate pegRatio;
  String lastSplitFactor;
  ExDividendDate lastSplitDate;
  ExDividendDate enterpriseToRevenue;
  ExDividendDate enterpriseToEbitda;
  ExDividendDate the52WeekChange;
  ExDividendDate sandP52WeekChange;
  ExDividendDate lastDividendValue;
  ExDividendDate lastDividendDate;
  DividendDate lastCapGain;
  DividendDate annualHoldingsTurnover;

  factory DefaultKeyStatistics.fromRawJson(String str) =>
      DefaultKeyStatistics.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DefaultKeyStatistics.fromJson(Map<String, dynamic> json) =>
      DefaultKeyStatistics(
        maxAge: json["maxAge"],
        priceHint: EnterpriseValue.fromJson(json["priceHint"]),
        enterpriseValue: EnterpriseValue.fromJson(json["enterpriseValue"]),
        forwardPe: ExDividendDate.fromJson(json["forwardPE"]),
        profitMargins: ExDividendDate.fromJson(json["profitMargins"]),
        floatShares: EnterpriseValue.fromJson(json["floatShares"]),
        sharesOutstanding: EnterpriseValue.fromJson(json["sharesOutstanding"]),
        sharesShort: DividendDate.fromJson(json["sharesShort"]),
        sharesShortPriorMonth:
            DividendDate.fromJson(json["sharesShortPriorMonth"]),
        sharesShortPreviousMonthDate:
            DividendDate.fromJson(json["sharesShortPreviousMonthDate"]),
        dateShortInterest: DividendDate.fromJson(json["dateShortInterest"]),
        sharesPercentSharesOut:
            DividendDate.fromJson(json["sharesPercentSharesOut"]),
        heldPercentInsiders:
            ExDividendDate.fromJson(json["heldPercentInsiders"]),
        heldPercentInstitutions:
            ExDividendDate.fromJson(json["heldPercentInstitutions"]),
        shortRatio: DividendDate.fromJson(json["shortRatio"]),
        shortPercentOfFloat: DividendDate.fromJson(json["shortPercentOfFloat"]),
        beta: ExDividendDate.fromJson(json["beta"]),
        impliedSharesOutstanding:
            EnterpriseValue.fromJson(json["impliedSharesOutstanding"]),
        morningStarOverallRating:
            DividendDate.fromJson(json["morningStarOverallRating"]),
        morningStarRiskRating:
            DividendDate.fromJson(json["morningStarRiskRating"]),
        category: json["category"],
        bookValue: ExDividendDate.fromJson(json["bookValue"]),
        priceToBook: ExDividendDate.fromJson(json["priceToBook"]),
        annualReportExpenseRatio:
            DividendDate.fromJson(json["annualReportExpenseRatio"]),
        ytdReturn: DividendDate.fromJson(json["ytdReturn"]),
        beta3Year: DividendDate.fromJson(json["beta3Year"]),
        totalAssets: DividendDate.fromJson(json["totalAssets"]),
        defaultKeyStatisticsYield: DividendDate.fromJson(json["yield"]),
        fundFamily: json["fundFamily"],
        fundInceptionDate: DividendDate.fromJson(json["fundInceptionDate"]),
        legalType: json["legalType"],
        threeYearAverageReturn:
            DividendDate.fromJson(json["threeYearAverageReturn"]),
        fiveYearAverageReturn:
            DividendDate.fromJson(json["fiveYearAverageReturn"]),
        priceToSalesTrailing12Months:
            DividendDate.fromJson(json["priceToSalesTrailing12Months"]),
        lastFiscalYearEnd: ExDividendDate.fromJson(json["lastFiscalYearEnd"]),
        nextFiscalYearEnd: ExDividendDate.fromJson(json["nextFiscalYearEnd"]),
        mostRecentQuarter: ExDividendDate.fromJson(json["mostRecentQuarter"]),
        earningsQuarterlyGrowth:
            ExDividendDate.fromJson(json["earningsQuarterlyGrowth"]),
        revenueQuarterlyGrowth:
            DividendDate.fromJson(json["revenueQuarterlyGrowth"]),
        netIncomeToCommon: EnterpriseValue.fromJson(json["netIncomeToCommon"]),
        trailingEps: ExDividendDate.fromJson(json["trailingEps"]),
        forwardEps: ExDividendDate.fromJson(json["forwardEps"]),
        pegRatio: ExDividendDate.fromJson(json["pegRatio"]),
        lastSplitFactor: json["lastSplitFactor"],
        lastSplitDate: ExDividendDate.fromJson(json["lastSplitDate"]),
        enterpriseToRevenue:
            ExDividendDate.fromJson(json["enterpriseToRevenue"]),
        enterpriseToEbitda: ExDividendDate.fromJson(json["enterpriseToEbitda"]),
        the52WeekChange: ExDividendDate.fromJson(json["52WeekChange"]),
        sandP52WeekChange: ExDividendDate.fromJson(json["SandP52WeekChange"]),
        lastDividendValue: ExDividendDate.fromJson(json["lastDividendValue"]),
        lastDividendDate: ExDividendDate.fromJson(json["lastDividendDate"]),
        lastCapGain: DividendDate.fromJson(json["lastCapGain"]),
        annualHoldingsTurnover:
            DividendDate.fromJson(json["annualHoldingsTurnover"]),
      );

  Map<String, dynamic> toJson() => {
        "maxAge": maxAge,
        "priceHint": priceHint.toJson(),
        "enterpriseValue": enterpriseValue.toJson(),
        "forwardPE": forwardPe.toJson(),
        "profitMargins": profitMargins.toJson(),
        "floatShares": floatShares.toJson(),
        "sharesOutstanding": sharesOutstanding.toJson(),
        "sharesShort": sharesShort.toJson(),
        "sharesShortPriorMonth": sharesShortPriorMonth.toJson(),
        "sharesShortPreviousMonthDate": sharesShortPreviousMonthDate.toJson(),
        "dateShortInterest": dateShortInterest.toJson(),
        "sharesPercentSharesOut": sharesPercentSharesOut.toJson(),
        "heldPercentInsiders": heldPercentInsiders.toJson(),
        "heldPercentInstitutions": heldPercentInstitutions.toJson(),
        "shortRatio": shortRatio.toJson(),
        "shortPercentOfFloat": shortPercentOfFloat.toJson(),
        "beta": beta.toJson(),
        "impliedSharesOutstanding": impliedSharesOutstanding.toJson(),
        "morningStarOverallRating": morningStarOverallRating.toJson(),
        "morningStarRiskRating": morningStarRiskRating.toJson(),
        "category": category,
        "bookValue": bookValue.toJson(),
        "priceToBook": priceToBook.toJson(),
        "annualReportExpenseRatio": annualReportExpenseRatio.toJson(),
        "ytdReturn": ytdReturn.toJson(),
        "beta3Year": beta3Year.toJson(),
        "totalAssets": totalAssets.toJson(),
        "yield": defaultKeyStatisticsYield.toJson(),
        "fundFamily": fundFamily,
        "fundInceptionDate": fundInceptionDate.toJson(),
        "legalType": legalType,
        "threeYearAverageReturn": threeYearAverageReturn.toJson(),
        "fiveYearAverageReturn": fiveYearAverageReturn.toJson(),
        "priceToSalesTrailing12Months": priceToSalesTrailing12Months.toJson(),
        "lastFiscalYearEnd": lastFiscalYearEnd.toJson(),
        "nextFiscalYearEnd": nextFiscalYearEnd.toJson(),
        "mostRecentQuarter": mostRecentQuarter.toJson(),
        "earningsQuarterlyGrowth": earningsQuarterlyGrowth.toJson(),
        "revenueQuarterlyGrowth": revenueQuarterlyGrowth.toJson(),
        "netIncomeToCommon": netIncomeToCommon.toJson(),
        "trailingEps": trailingEps.toJson(),
        "forwardEps": forwardEps.toJson(),
        "pegRatio": pegRatio.toJson(),
        "lastSplitFactor": lastSplitFactor,
        "lastSplitDate": lastSplitDate.toJson(),
        "enterpriseToRevenue": enterpriseToRevenue.toJson(),
        "enterpriseToEbitda": enterpriseToEbitda.toJson(),
        "52WeekChange": the52WeekChange.toJson(),
        "SandP52WeekChange": sandP52WeekChange.toJson(),
        "lastDividendValue": lastDividendValue.toJson(),
        "lastDividendDate": lastDividendDate.toJson(),
        "lastCapGain": lastCapGain.toJson(),
        "annualHoldingsTurnover": annualHoldingsTurnover.toJson(),
      };
}

class ResultEarnings {
  ResultEarnings({
    required this.maxAge,
    required this.earningsChart,
    required this.financialsChart,
    required this.financialCurrency,
  });

  int maxAge;
  EarningsChart earningsChart;
  FinancialsChart financialsChart;
  String financialCurrency;

  factory ResultEarnings.fromRawJson(String str) =>
      ResultEarnings.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultEarnings.fromJson(Map<String, dynamic> json) => ResultEarnings(
        maxAge: json["maxAge"],
        earningsChart: EarningsChart.fromJson(json["earningsChart"]),
        financialsChart: FinancialsChart.fromJson(json["financialsChart"]),
        financialCurrency: json["financialCurrency"],
      );

  Map<String, dynamic> toJson() => {
        "maxAge": maxAge,
        "earningsChart": earningsChart.toJson(),
        "financialsChart": financialsChart.toJson(),
        "financialCurrency": financialCurrency,
      };
}

class EarningsChart {
  EarningsChart({
    required this.quarterly,
    required this.currentQuarterEstimate,
    required this.currentQuarterEstimateDate,
    required this.currentQuarterEstimateYear,
    required this.earningsDate,
  });

  List<EarningsChartQuarterly> quarterly;
  ExDividendDate currentQuarterEstimate;
  String currentQuarterEstimateDate;
  int currentQuarterEstimateYear;
  List<ExDividendDate> earningsDate;

  factory EarningsChart.fromRawJson(String str) =>
      EarningsChart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EarningsChart.fromJson(Map<String, dynamic> json) => EarningsChart(
        quarterly: List<EarningsChartQuarterly>.from(
            json["quarterly"].map((x) => EarningsChartQuarterly.fromJson(x))),
        currentQuarterEstimate:
            ExDividendDate.fromJson(json["currentQuarterEstimate"]),
        currentQuarterEstimateDate: json["currentQuarterEstimateDate"],
        currentQuarterEstimateYear: json["currentQuarterEstimateYear"],
        earningsDate: List<ExDividendDate>.from(
            json["earningsDate"].map((x) => ExDividendDate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "quarterly": List<dynamic>.from(quarterly.map((x) => x.toJson())),
        "currentQuarterEstimate": currentQuarterEstimate.toJson(),
        "currentQuarterEstimateDate": currentQuarterEstimateDate,
        "currentQuarterEstimateYear": currentQuarterEstimateYear,
        "earningsDate": List<dynamic>.from(earningsDate.map((x) => x.toJson())),
      };
}

class EarningsChartQuarterly {
  EarningsChartQuarterly({
    required this.date,
    required this.actual,
    required this.estimate,
  });

  String date;
  ExDividendDate actual;
  ExDividendDate estimate;

  factory EarningsChartQuarterly.fromRawJson(String str) =>
      EarningsChartQuarterly.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EarningsChartQuarterly.fromJson(Map<String, dynamic> json) =>
      EarningsChartQuarterly(
        date: json["date"],
        actual: ExDividendDate.fromJson(json["actual"]),
        estimate: ExDividendDate.fromJson(json["estimate"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "actual": actual.toJson(),
        "estimate": estimate.toJson(),
      };
}

class FinancialsChart {
  FinancialsChart({
    required this.yearly,
    required this.quarterly,
  });

  List<Yearly> yearly;
  List<FinancialsChartQuarterly> quarterly;

  factory FinancialsChart.fromRawJson(String str) =>
      FinancialsChart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FinancialsChart.fromJson(Map<String, dynamic> json) =>
      FinancialsChart(
        yearly:
            List<Yearly>.from(json["yearly"].map((x) => Yearly.fromJson(x))),
        quarterly: List<FinancialsChartQuarterly>.from(
            json["quarterly"].map((x) => FinancialsChartQuarterly.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "yearly": List<dynamic>.from(yearly.map((x) => x.toJson())),
        "quarterly": List<dynamic>.from(quarterly.map((x) => x.toJson())),
      };
}

class FinancialsChartQuarterly {
  FinancialsChartQuarterly({
    required this.date,
    required this.revenue,
    required this.earnings,
  });

  String date;
  EnterpriseValue revenue;
  EnterpriseValue earnings;

  factory FinancialsChartQuarterly.fromRawJson(String str) =>
      FinancialsChartQuarterly.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FinancialsChartQuarterly.fromJson(Map<String, dynamic> json) =>
      FinancialsChartQuarterly(
        date: json["date"],
        revenue: EnterpriseValue.fromJson(json["revenue"]),
        earnings: EnterpriseValue.fromJson(json["earnings"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "revenue": revenue.toJson(),
        "earnings": earnings.toJson(),
      };
}

class Yearly {
  Yearly({
    required this.date,
    required this.revenue,
    required this.earnings,
  });

  int date;
  EnterpriseValue revenue;
  EnterpriseValue earnings;

  factory Yearly.fromRawJson(String str) => Yearly.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Yearly.fromJson(Map<String, dynamic> json) => Yearly(
        date: json["date"],
        revenue: EnterpriseValue.fromJson(json["revenue"]),
        earnings: EnterpriseValue.fromJson(json["earnings"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "revenue": revenue.toJson(),
        "earnings": earnings.toJson(),
      };
}

class EsgScores {
  EsgScores({
    required this.maxAge,
    required this.totalEsg,
    required this.environmentScore,
    required this.socialScore,
    required this.governanceScore,
    required this.ratingYear,
    required this.ratingMonth,
    required this.highestControversy,
    required this.peerCount,
    required this.esgPerformance,
    required this.peerGroup,
    required this.relatedControversy,
    required this.peerEsgScorePerformance,
    required this.peerGovernancePerformance,
    required this.peerSocialPerformance,
    required this.peerEnvironmentPerformance,
    required this.peerHighestControversyPerformance,
    required this.percentile,
    this.environmentPercentile,
    this.socialPercentile,
    this.governancePercentile,
    required this.adult,
    required this.alcoholic,
    required this.animalTesting,
    required this.catholic,
    required this.controversialWeapons,
    required this.smallArms,
    required this.furLeather,
    required this.gambling,
    required this.gmo,
    required this.militaryContract,
    required this.nuclear,
    required this.pesticides,
    required this.palmOil,
    required this.coal,
    required this.tobacco,
  });

  int maxAge;
  ExDividendDate totalEsg;
  ExDividendDate environmentScore;
  ExDividendDate socialScore;
  ExDividendDate governanceScore;
  int ratingYear;
  int ratingMonth;
  int highestControversy;
  int peerCount;
  String esgPerformance;
  String peerGroup;
  List<String> relatedControversy;
  PeerPerformance peerEsgScorePerformance;
  PeerPerformance peerGovernancePerformance;
  PeerPerformance peerSocialPerformance;
  PeerPerformance peerEnvironmentPerformance;
  PeerPerformance peerHighestControversyPerformance;
  ExDividendDate percentile;
  dynamic environmentPercentile;
  dynamic socialPercentile;
  dynamic governancePercentile;
  bool adult;
  bool alcoholic;
  bool animalTesting;
  bool catholic;
  bool controversialWeapons;
  bool smallArms;
  bool furLeather;
  bool gambling;
  bool gmo;
  bool militaryContract;
  bool nuclear;
  bool pesticides;
  bool palmOil;
  bool coal;
  bool tobacco;

  factory EsgScores.fromRawJson(String str) =>
      EsgScores.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EsgScores.fromJson(Map<String, dynamic> json) => EsgScores(
        maxAge: json["maxAge"],
        totalEsg: ExDividendDate.fromJson(json["totalEsg"]),
        environmentScore: ExDividendDate.fromJson(json["environmentScore"]),
        socialScore: ExDividendDate.fromJson(json["socialScore"]),
        governanceScore: ExDividendDate.fromJson(json["governanceScore"]),
        ratingYear: json["ratingYear"],
        ratingMonth: json["ratingMonth"],
        highestControversy: json["highestControversy"],
        peerCount: json["peerCount"],
        esgPerformance: json["esgPerformance"],
        peerGroup: json["peerGroup"],
        relatedControversy:
            List<String>.from(json["relatedControversy"].map((x) => x)),
        peerEsgScorePerformance:
            PeerPerformance.fromJson(json["peerEsgScorePerformance"]),
        peerGovernancePerformance:
            PeerPerformance.fromJson(json["peerGovernancePerformance"]),
        peerSocialPerformance:
            PeerPerformance.fromJson(json["peerSocialPerformance"]),
        peerEnvironmentPerformance:
            PeerPerformance.fromJson(json["peerEnvironmentPerformance"]),
        peerHighestControversyPerformance:
            PeerPerformance.fromJson(json["peerHighestControversyPerformance"]),
        percentile: ExDividendDate.fromJson(json["percentile"]),
        environmentPercentile: json["environmentPercentile"],
        socialPercentile: json["socialPercentile"],
        governancePercentile: json["governancePercentile"],
        adult: json["adult"],
        alcoholic: json["alcoholic"],
        animalTesting: json["animalTesting"],
        catholic: json["catholic"],
        controversialWeapons: json["controversialWeapons"],
        smallArms: json["smallArms"],
        furLeather: json["furLeather"],
        gambling: json["gambling"],
        gmo: json["gmo"],
        militaryContract: json["militaryContract"],
        nuclear: json["nuclear"],
        pesticides: json["pesticides"],
        palmOil: json["palmOil"],
        coal: json["coal"],
        tobacco: json["tobacco"],
      );

  Map<String, dynamic> toJson() => {
        "maxAge": maxAge,
        "totalEsg": totalEsg.toJson(),
        "environmentScore": environmentScore.toJson(),
        "socialScore": socialScore.toJson(),
        "governanceScore": governanceScore.toJson(),
        "ratingYear": ratingYear,
        "ratingMonth": ratingMonth,
        "highestControversy": highestControversy,
        "peerCount": peerCount,
        "esgPerformance": esgPerformance,
        "peerGroup": peerGroup,
        "relatedControversy":
            List<dynamic>.from(relatedControversy.map((x) => x)),
        "peerEsgScorePerformance": peerEsgScorePerformance.toJson(),
        "peerGovernancePerformance": peerGovernancePerformance.toJson(),
        "peerSocialPerformance": peerSocialPerformance.toJson(),
        "peerEnvironmentPerformance": peerEnvironmentPerformance.toJson(),
        "peerHighestControversyPerformance":
            peerHighestControversyPerformance.toJson(),
        "percentile": percentile.toJson(),
        "environmentPercentile": environmentPercentile,
        "socialPercentile": socialPercentile,
        "governancePercentile": governancePercentile,
        "adult": adult,
        "alcoholic": alcoholic,
        "animalTesting": animalTesting,
        "catholic": catholic,
        "controversialWeapons": controversialWeapons,
        "smallArms": smallArms,
        "furLeather": furLeather,
        "gambling": gambling,
        "gmo": gmo,
        "militaryContract": militaryContract,
        "nuclear": nuclear,
        "pesticides": pesticides,
        "palmOil": palmOil,
        "coal": coal,
        "tobacco": tobacco,
      };
}

class PeerPerformance {
  PeerPerformance({
    required this.min,
    required this.avg,
    required this.max,
  });

  double min;
  double avg;
  double max;

  factory PeerPerformance.fromRawJson(String str) =>
      PeerPerformance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PeerPerformance.fromJson(Map<String, dynamic> json) =>
      PeerPerformance(
        min: json["min"]?.toDouble(),
        avg: json["avg"]?.toDouble(),
        max: json["max"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "avg": avg,
        "max": max,
      };
}

class FinancialData {
  FinancialData({
    required this.maxAge,
    required this.currentPrice,
    required this.targetHighPrice,
    required this.targetLowPrice,
    required this.targetMeanPrice,
    required this.targetMedianPrice,
    required this.recommendationMean,
    required this.recommendationKey,
    required this.numberOfAnalystOpinions,
    required this.totalCash,
    required this.totalCashPerShare,
    required this.ebitda,
    required this.totalDebt,
    required this.quickRatio,
    required this.currentRatio,
    required this.totalRevenue,
    required this.debtToEquity,
    required this.revenuePerShare,
    required this.returnOnAssets,
    required this.returnOnEquity,
    required this.grossProfits,
    required this.freeCashflow,
    required this.operatingCashflow,
    required this.earningsGrowth,
    required this.revenueGrowth,
    required this.grossMargins,
    required this.ebitdaMargins,
    required this.operatingMargins,
    required this.profitMargins,
    required this.financialCurrency,
  });

  int maxAge;
  ExDividendDate currentPrice;
  ExDividendDate targetHighPrice;
  ExDividendDate targetLowPrice;
  ExDividendDate targetMeanPrice;
  ExDividendDate targetMedianPrice;
  ExDividendDate recommendationMean;
  String recommendationKey;
  EnterpriseValue numberOfAnalystOpinions;
  EnterpriseValue totalCash;
  ExDividendDate totalCashPerShare;
  EnterpriseValue ebitda;
  EnterpriseValue totalDebt;
  ExDividendDate quickRatio;
  ExDividendDate currentRatio;
  EnterpriseValue totalRevenue;
  ExDividendDate debtToEquity;
  ExDividendDate revenuePerShare;
  ExDividendDate returnOnAssets;
  ExDividendDate returnOnEquity;
  EnterpriseValue grossProfits;
  EnterpriseValue freeCashflow;
  EnterpriseValue operatingCashflow;
  ExDividendDate earningsGrowth;
  ExDividendDate revenueGrowth;
  ExDividendDate grossMargins;
  ExDividendDate ebitdaMargins;
  ExDividendDate operatingMargins;
  ExDividendDate profitMargins;
  String financialCurrency;

  factory FinancialData.fromRawJson(String str) =>
      FinancialData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FinancialData.fromJson(Map<String, dynamic> json) => FinancialData(
        maxAge: json["maxAge"],
        currentPrice: ExDividendDate.fromJson(json["currentPrice"]),
        targetHighPrice: ExDividendDate.fromJson(json["targetHighPrice"]),
        targetLowPrice: ExDividendDate.fromJson(json["targetLowPrice"]),
        targetMeanPrice: ExDividendDate.fromJson(json["targetMeanPrice"]),
        targetMedianPrice: ExDividendDate.fromJson(json["targetMedianPrice"]),
        recommendationMean: ExDividendDate.fromJson(json["recommendationMean"]),
        recommendationKey: json["recommendationKey"],
        numberOfAnalystOpinions:
            EnterpriseValue.fromJson(json["numberOfAnalystOpinions"]),
        totalCash: EnterpriseValue.fromJson(json["totalCash"]),
        totalCashPerShare: ExDividendDate.fromJson(json["totalCashPerShare"]),
        ebitda: EnterpriseValue.fromJson(json["ebitda"]),
        totalDebt: EnterpriseValue.fromJson(json["totalDebt"]),
        quickRatio: ExDividendDate.fromJson(json["quickRatio"]),
        currentRatio: ExDividendDate.fromJson(json["currentRatio"]),
        totalRevenue: EnterpriseValue.fromJson(json["totalRevenue"]),
        debtToEquity: ExDividendDate.fromJson(json["debtToEquity"]),
        revenuePerShare: ExDividendDate.fromJson(json["revenuePerShare"]),
        returnOnAssets: ExDividendDate.fromJson(json["returnOnAssets"]),
        returnOnEquity: ExDividendDate.fromJson(json["returnOnEquity"]),
        grossProfits: EnterpriseValue.fromJson(json["grossProfits"]),
        freeCashflow: EnterpriseValue.fromJson(json["freeCashflow"]),
        operatingCashflow: EnterpriseValue.fromJson(json["operatingCashflow"]),
        earningsGrowth: ExDividendDate.fromJson(json["earningsGrowth"]),
        revenueGrowth: ExDividendDate.fromJson(json["revenueGrowth"]),
        grossMargins: ExDividendDate.fromJson(json["grossMargins"]),
        ebitdaMargins: ExDividendDate.fromJson(json["ebitdaMargins"]),
        operatingMargins: ExDividendDate.fromJson(json["operatingMargins"]),
        profitMargins: ExDividendDate.fromJson(json["profitMargins"]),
        financialCurrency: json["financialCurrency"],
      );

  Map<String, dynamic> toJson() => {
        "maxAge": maxAge,
        "currentPrice": currentPrice.toJson(),
        "targetHighPrice": targetHighPrice.toJson(),
        "targetLowPrice": targetLowPrice.toJson(),
        "targetMeanPrice": targetMeanPrice.toJson(),
        "targetMedianPrice": targetMedianPrice.toJson(),
        "recommendationMean": recommendationMean.toJson(),
        "recommendationKey": recommendationKey,
        "numberOfAnalystOpinions": numberOfAnalystOpinions.toJson(),
        "totalCash": totalCash.toJson(),
        "totalCashPerShare": totalCashPerShare.toJson(),
        "ebitda": ebitda.toJson(),
        "totalDebt": totalDebt.toJson(),
        "quickRatio": quickRatio.toJson(),
        "currentRatio": currentRatio.toJson(),
        "totalRevenue": totalRevenue.toJson(),
        "debtToEquity": debtToEquity.toJson(),
        "revenuePerShare": revenuePerShare.toJson(),
        "returnOnAssets": returnOnAssets.toJson(),
        "returnOnEquity": returnOnEquity.toJson(),
        "grossProfits": grossProfits.toJson(),
        "freeCashflow": freeCashflow.toJson(),
        "operatingCashflow": operatingCashflow.toJson(),
        "earningsGrowth": earningsGrowth.toJson(),
        "revenueGrowth": revenueGrowth.toJson(),
        "grossMargins": grossMargins.toJson(),
        "ebitdaMargins": ebitdaMargins.toJson(),
        "operatingMargins": operatingMargins.toJson(),
        "profitMargins": profitMargins.toJson(),
        "financialCurrency": financialCurrency,
      };
}

class RecommendationTrend {
  RecommendationTrend({
    required this.trend,
    required this.maxAge,
  });

  List<Trend> trend;
  int maxAge;

  factory RecommendationTrend.fromRawJson(String str) =>
      RecommendationTrend.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecommendationTrend.fromJson(Map<String, dynamic> json) =>
      RecommendationTrend(
        trend: List<Trend>.from(json["trend"].map((x) => Trend.fromJson(x))),
        maxAge: json["maxAge"],
      );

  Map<String, dynamic> toJson() => {
        "trend": List<dynamic>.from(trend.map((x) => x.toJson())),
        "maxAge": maxAge,
      };
}

class Trend {
  Trend({
    required this.period,
    required this.strongBuy,
    required this.buy,
    required this.hold,
    required this.sell,
    required this.strongSell,
  });

  String period;
  int strongBuy;
  int buy;
  int hold;
  int sell;
  int strongSell;

  factory Trend.fromRawJson(String str) => Trend.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Trend.fromJson(Map<String, dynamic> json) => Trend(
        period: json["period"],
        strongBuy: json["strongBuy"],
        buy: json["buy"],
        hold: json["hold"],
        sell: json["sell"],
        strongSell: json["strongSell"],
      );

  Map<String, dynamic> toJson() => {
        "period": period,
        "strongBuy": strongBuy,
        "buy": buy,
        "hold": hold,
        "sell": sell,
        "strongSell": strongSell,
      };
}

class SummaryProfile {
  SummaryProfile({
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
    required this.website,
    required this.industry,
    required this.sector,
    required this.longBusinessSummary,
    required this.companyOfficers,
    required this.maxAge,
  });

  String address1;
  String address2;
  String city;
  String state;
  String zip;
  String country;
  String website;
  String industry;
  String sector;
  String longBusinessSummary;
  List<dynamic> companyOfficers;
  int maxAge;

  factory SummaryProfile.fromRawJson(String str) =>
      SummaryProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SummaryProfile.fromJson(Map<String, dynamic> json) => SummaryProfile(
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        country: json["country"],
        website: json["website"],
        industry: json["industry"],
        sector: json["sector"],
        longBusinessSummary: json["longBusinessSummary"],
        companyOfficers:
            List<dynamic>.from(json["companyOfficers"].map((x) => x)),
        maxAge: json["maxAge"],
      );

  Map<String, dynamic> toJson() => {
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "zip": zip,
        "country": country,
        "website": website,
        "industry": industry,
        "sector": sector,
        "longBusinessSummary": longBusinessSummary,
        "companyOfficers": List<dynamic>.from(companyOfficers.map((x) => x)),
        "maxAge": maxAge,
      };
}
