import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:todo_app/models/charts_yahoo_model.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/models/statistic_yahoo_model.dart';

class ChartsStocksPage extends StatefulWidget {
  final String symbol;

  const ChartsStocksPage({super.key, required this.symbol});

  @override
  State<ChartsStocksPage> createState() => _ChartsStocksPageState();
}

class _ChartsStocksPageState extends State<ChartsStocksPage> {
  List<StockPrice> _stockPrice = [];
  Future<List<StatisticResult>>? futureStatistic;

  late String _days;
  late String _intervals;
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    super.initState();
    _days = '1d';
    _intervals = '60m';
    getChartData(_days, _intervals);
    _trackballBehavior = TrackballBehavior(
      activationMode: ActivationMode.singleTap,
      enable: true,
      tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
    );
    futureStatistic = fetchStatistic();
  }

  Future<List<StatisticResult>> fetchStatistic() async {
    var url =
        'https://query1.finance.yahoo.com/v7/finance/quote?formatted=true&lang=en-US&region=US&symbols=${widget.symbol}&fields=longName%2CshortName%2CregularMarketPrice%2CregularMarketChange%2CregularMarketChangePercent%2CmessageBoardId%2CmarketCap%2CunderlyingSymbol%2CunderlyingExchangeSymbol%2CheadSymbolAsString%2CregularMarketVolume%2Cuuid%2CregularMarketOpen%2CfiftyTwoWeekLow%2CfiftyTwoWeekHigh%2CtoCurrency%2CfromCurrency%2CtoExchange%2CfromExchange%2CcorporateActions';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final statisticResult = List<Map<String, dynamic>>.from(
          jsonResponse['quoteResponse']['result']);
      final quoteResponse = statisticResult
          .map((json) => StatisticResult.fromJson(json))
          .toList();
      return quoteResponse;
    } else {
      throw Exception('Falha ao carregar as moedas');
    }
  }

  Future<void> getChartData(String days, String intervals) async {
    final url =
        'https://query1.finance.yahoo.com/v8/finance/chart/${widget.symbol}?symbol=${widget.symbol}&range=$days&useYfid=true&interval=$intervals&includePrePost=true';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final timestamps = json['chart']['result'][0]['timestamp'].cast<int>();
      final opens = json['chart']['result'][0]['indicators']['quote'][0]['open']
          .cast<double?>();
      final closes = json['chart']['result'][0]['indicators']['quote'][0]
              ['close']
          .cast<double?>();
      final highs = json['chart']['result'][0]['indicators']['quote'][0]['high']
          .cast<double?>();
      final lows = json['chart']['result'][0]['indicators']['quote'][0]['low']
          .cast<double?>();
      final volumes = json['chart']['result'][0]['indicators']['quote'][0]
              ['volume']
          .cast<int?>();
      final prices = <StockPrice>[];
      for (var i = 0; i < timestamps.length; i++) {
        final timestamp = timestamps[i];
        final open = opens[i];
        final close = closes[i];
        final high = highs[i];
        final low = lows[i];
        final volume = volumes[i];
        if (timestamp != null &&
            open != null &&
            close != null &&
            high != null &&
            low != null &&
            volume != null) {
          final price = StockPrice(
            DateTime.fromMillisecondsSinceEpoch(timestamp * 1000),
            open,
            high,
            low,
            close,
            volume,
          );
          prices.add(price);
        }
      }
      setState(() {
        _stockPrice = prices;
        _days = days;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A152A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A152A),
        title: Text(
          widget.symbol,
          style: const TextStyle(fontFamily: 'Open Sans'),
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: const Color(0xFF0E0B1A),
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: Center(
              child: FutureBuilder<List<StatisticResult>>(
                future: futureStatistic,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Wrap(
                      spacing: 30,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                            color: snapshot.data![0].regularMarketChangePercent
                                        .raw >=
                                    0
                                ? Colors.green
                                : Colors.red,
                            snapshot.data![0].regularMarketChangePercent.raw >=
                                    0
                                ? Icons.arrow_circle_up
                                : Icons.arrow_circle_down),
                        Text(
                          snapshot.data![0].regularMarketPrice.fmt,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 28,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                        Text(
                          "${snapshot.data![0].regularMarketChange.fmt} (${snapshot.data![0].regularMarketChangePercent.fmt})",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              color: snapshot.data![0]
                                          .regularMarketChangePercent.raw >=
                                      0
                                  ? Colors.green
                                  : Colors.red),
                        ),
                        Text(
                          "${snapshot.data![0].regularMarketTime.fmt} - ${snapshot.data![0].exchangeTimezoneName}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
          SfCartesianChart(
            primaryXAxis: DateTimeAxis(
              labelPosition: ChartDataLabelPosition.inside,
              tickPosition: TickPosition.inside,
            ),
            primaryYAxis: NumericAxis(
              decimalPlaces: 2,
            ),
            trackballBehavior: _trackballBehavior,
            series: <ChartSeries>[
              AreaSeries<StockPrice, DateTime>(
                dataSource: _stockPrice,
                xValueMapper: (StockPrice chart, _) => chart.timestamp,
                yValueMapper: (StockPrice chart, _) => chart.close,
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 203, 89, 0.32),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderColor: const Color(0xFFFFCB59),
                borderWidth: 1,
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50,
                child: _buildButton('1D', '1d', '60m'),
              ),
              SizedBox(
                width: 50,
                child: _buildButton('5D', '5d', '60m'),
              ),
              SizedBox(
                width: 50,
                child: _buildButton('1M', '1mo', '1d'),
              ),
              SizedBox(
                width: 50,
                child: _buildButton('3M', '3mo', '1d'),
              ),
              SizedBox(
                width: 50,
                child: _buildButton('6M', '6mo', '1d'),
              ),
              SizedBox(
                width: 50,
                child: _buildButton('1Y', '1y', '1d'),
              ),
              SizedBox(
                width: 50,
                child: _buildButton('5Y', '5y', '1d'),
              ),
            ],
          ),
          FutureBuilder<List<StatisticResult>>(
            future: futureStatistic,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Day's range",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                          Text(
                            snapshot.data![0].regularMarketDayRange.fmt,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "52wk range",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                          Text(
                            snapshot.data![0].fiftyTwoWeekRange.fmt,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Previous Close",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                          Text(
                            snapshot.data![0].regularMarketPreviousClose.fmt,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Open",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                          Text(
                            snapshot.data![0].regularMarketOpen.fmt,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Volumn",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                          Text(
                            snapshot.data![0].regularMarketVolume.fmt,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Market Cap",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                          Text(
                            snapshot.data![0].marketCap!.fmt,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "52wk High Change",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                          Text(
                            snapshot.data![0].fiftyTwoWeekHighChangePercent.fmt,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "52wk Low Change",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                          Text(
                            snapshot.data![0].fiftyTwoWeekLowChangePercent!.fmt,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xFF7B788A)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label, String days, String intervals) {
    final isSelected = _days == days;
    return TextButton(
      onPressed: () {
        setState(() {
          _days = days;
          _intervals = intervals;
        });
        getChartData(days, intervals);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor:
            isSelected ? const Color(0xFF0E0B1A) : Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomLeft: Radius.circular(4),
          ),
        ),
      ),
      child: Text(label,
          style: isSelected
              ? const TextStyle(
                  color: Color(0xFFFFFFFF), fontFamily: 'Open Sans')
              : const TextStyle(
                  color: Color(0xFF7B788A), fontFamily: 'Open Sans')),
    );
  }
}
