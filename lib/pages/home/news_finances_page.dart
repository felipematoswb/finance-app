import 'package:flutter/material.dart';

class NewsFinancesPage extends StatefulWidget {
  const NewsFinancesPage({super.key});

  @override
  State<NewsFinancesPage> createState() => _NewsFinancesPageState();
}

class _NewsFinancesPageState extends State<NewsFinancesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Page 3'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tab A'),
              Tab(text: 'Tab B'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Page 3 - Tab A')),
            Center(child: Text('Page 3 - Tab B')),
          ],
        ),
      ),
    );
  }
}
