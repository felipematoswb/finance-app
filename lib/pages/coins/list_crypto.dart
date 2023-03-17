import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/pages/coins/crypto_chart.dart';
import 'package:todo_app/pages/coins/models/sales_data.dart';

class ListCrypto extends StatefulWidget {
  const ListCrypto({super.key});

  @override
  State<ListCrypto> createState() => _ListCryptoState();
}

Future<List> getCoins() async {
  var url = Uri.parse(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Error');
  }
}

class _ListCryptoState extends State<ListCrypto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF005BE3),
          ),
          width: MediaQuery.of(context).size.width * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
                child: Text(
                  'Welcome, Agilian',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                  'Make you first Investiment today!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                  ),
                  child: const Text(
                    'Invest Today',
                    style: TextStyle(color: Color(0xFF005BE3)),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 30,
            child: const Text(
              'Trendings Coins',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder<List>(
            future: getCoins(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }

              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      margin:
                          const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                            snapshot.data![index]['image'],
                          ),
                        ),
                        title: Text(
                          '${snapshot.data![index]['symbol']}'.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                        subtitle: Text(
                          '${snapshot.data![index]['name']}'.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$${snapshot.data![index]['current_price'].toString()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            Text(
                              snapshot.data![index]
                                          ['price_change_percentage_24h'] >
                                      0
                                  ? '+${snapshot.data![index]['price_change_percentage_24h'].toStringAsFixed(2)}'
                                  : snapshot.data![index]
                                          ['price_change_percentage_24h']
                                      .toStringAsFixed(2),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 14,
                                  color: snapshot.data![index]
                                              ['price_change_percentage_24h'] >
                                          0
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ],
                        ),
                        onTap: () =>
                            _showCryptoChart(snapshot.data![index]['id']),
                      ),
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showCryptoChart(String id) async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/$id/market_chart?vs_currency=usd&days=1'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<SalesData> chartData = [];
      for (final point in data['prices']) {
        final timestamp =
            DateTime.fromMillisecondsSinceEpoch(point[0]).toLocal();
        final price = point[1];
        chartData.add(SalesData(timestamp, price));
      }
      if (!mounted) return;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CryptoChart(
              chartData: chartData,
              id: id,
            ),
          ));
    } else {
      throw Exception('Failed to load chart data from API');
    }
  }
}
