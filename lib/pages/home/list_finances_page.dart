import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/models/finance_yahoo_model.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/pages/charts/charts_stocks_page.dart';

import 'package:todo_app/widgets/my_drawer.dart';

class ListFinancePage extends StatefulWidget {
  const ListFinancePage({super.key});

  @override
  State<ListFinancePage> createState() => _ListFinancePageState();
}

class _ListFinancePageState extends State<ListFinancePage> {
  Future<List<Quote>>? futureCoins;

  @override
  void initState() {
    super.initState();
    futureCoins = fetchCoins();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Top Negociadas'),
          backgroundColor: const Color(0xFF1A142F),
          bottom: const TabBar(
            indicatorColor: Color(0xFFEBB337),
            labelColor: Color(0xFFEBB337),
            tabs: [
              Tab(text: 'Indices'),
              Tab(text: 'Indices Futures'),
              Tab(text: 'Stocks'),
            ],
          ),
        ),
        drawer: const MyDrawer(),
        body: Container(
          color: const Color(0xFF1A142F),
          child: TabBarView(
            children: [
              Center(
                child: FutureBuilder<List<Quote>>(
                  future: futureCoins,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final coins = snapshot.data;

                      return ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            const Padding(
                          padding: EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                          ),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        itemCount: coins!.length,
                        itemBuilder: (context, index) {
                          final coin = coins[index];

                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChartsStocksPage(
                                      symbol: coin.symbol,
                                    ),
                                  ));
                            },
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coin.symbol,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'Open Sans',
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  coin.longName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    fontFamily: 'Open Sans',
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${coin.marketState} | ${coin.regularMarketTime.fmt} | ${coin.fullExchangeName}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFF7B788A),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  coin.ask.fmt,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Open Sans',
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${coin.regularMarketChange.fmt} (${coin.regularMarketChangePercent.fmt})",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      fontFamily: 'Open Sans',
                                      color:
                                          coin.regularMarketChangePercent.raw >=
                                                  0
                                              ? Colors.green
                                              : Colors.red),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Vol ${coin.regularMarketVolume.fmt}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    fontFamily: 'Open Sans',
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text(
                        'Erro ao carregar as moedas: ${snapshot.error}',
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              const Text('data'),
              const Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<Quote>> fetchCoins() async {
  const url =
      'https://query1.finance.yahoo.com/v1/finance/screener/predefined/saved?formatted=true&lang=pt-BR&region=BR&scrIds=most_actives_br&start=0&count=25&enableSectorIndustryLabelFix=true';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final coinList = List<Map<String, dynamic>>.from(
        jsonResponse['finance']['result'][0]['quotes']);
    final quotes = coinList.map((json) => Quote.fromJson(json)).toList();
    return quotes;
  } else {
    throw Exception('Falha ao carregar as moedas');
  }
}
