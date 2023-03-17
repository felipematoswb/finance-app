import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:todo_app/pages/coins/models/sales_data.dart';

class CryptoChart extends StatefulWidget {
  final List<SalesData> chartData;

  final String id;

  const CryptoChart({super.key, required this.chartData, required this.id});

  @override
  State<CryptoChart> createState() => _CryptoChartState();
}

class _CryptoChartState extends State<CryptoChart> {
  late List<SalesData> _chartData;
  late int _days;

  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    super.initState();
    _chartData = widget.chartData;
    _days = 1;

    _trackballBehavior = TrackballBehavior(
      activationMode: ActivationMode.singleTap,
      enable: true,
      tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
    );
  }

  Future<void> _getChartData(int days) async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/${widget.id}/market_chart?vs_currency=usd&days=$days&interval=hourly'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<SalesData> chartData = [];
      for (final point in data['prices']) {
        final timestamp =
            DateTime.fromMillisecondsSinceEpoch(point[0]).toLocal();
        final price = point[1];
        chartData.add(SalesData(timestamp, price));
      }
      setState(() {
        _chartData = chartData;
        _days = days;
      });
    } else {
      throw Exception('Failed to load chart data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.id.toUpperCase()} Chart'),
      ),
      body: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: DateTimeAxis(
              intervalType: _days > 1
                  ? DateTimeIntervalType.days
                  : DateTimeIntervalType.hours,
              dateFormat: _days > 1 ? DateFormat.Md() : DateFormat.Hm(),
            ),
            primaryYAxis: NumericAxis(),
            trackballBehavior: _trackballBehavior,
            series: <ChartSeries>[
              AreaSeries<SalesData, DateTime>(
                dataSource: _chartData,
                xValueMapper: (SalesData sales, _) => sales.time,
                yValueMapper: (SalesData sales, _) => sales.price,
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade400,
                    Colors.blue.shade200,
                    Colors.blue.shade50,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderColor: Colors.blue,
                borderWidth: 3,
              )
            ],
          ),
          const SizedBox(height: 16),
          DropdownButton<int>(
            value: _days,
            items: const <DropdownMenuItem<int>>[
              DropdownMenuItem(
                value: 1,
                child: Text('1D'),
              ),
              DropdownMenuItem(
                value: 7,
                child: Text('7D'),
              ),
              DropdownMenuItem(
                value: 14,
                child: Text('15D'),
              ),
              DropdownMenuItem(
                value: 30,
                child: Text('30D'),
              ),
              DropdownMenuItem(
                value: 90,
                child: Text('90D'),
              ),
            ],
            onChanged: (int? value) {
              if (value != null) {
                _getChartData(value);
              }
            },
          ),
        ],
      ),
    );
  }
}
