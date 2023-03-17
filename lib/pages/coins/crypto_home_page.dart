import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/pages/coins/list_crypto.dart';
import 'package:todo_app/pages/coins/market_page.dart';
import 'package:todo_app/pages/coins/rewards_page.dart';
import 'package:todo_app/pages/profiles/profile_home_page.dart';
import 'package:todo_app/pages/wallets/todo_list_page.dart';

class CryptoHomePage extends StatefulWidget {
  const CryptoHomePage({super.key});

  @override
  State<CryptoHomePage> createState() => _CryptoHomePageState();
}

class _CryptoHomePageState extends State<CryptoHomePage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          ListCrypto(),
          TodoListPage(),
          RewardPage(),
          MarketPage(),
          ProfileHomePage(title: "Profile"),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 6,
            blurRadius: 9,
            offset: const Offset(0, 3),
          )
        ]),
        child: BottomNavigationBar(
          selectedItemColor: const Color(0xFF0063F5),
          unselectedItemColor: const Color(0xFF6C757D),
          backgroundColor: const Color(0xFFFFFFFF),
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontFamily: 'Ubuntu'),
          unselectedLabelStyle: const TextStyle(fontFamily: 'Ubuntu'),
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          iconSize: 24,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(FontAwesomeIcons.house),
            ),
            BottomNavigationBarItem(
              label: "Portifolio",
              icon: Icon(FontAwesomeIcons.chartPie),
            ),
            BottomNavigationBarItem(
              label: "Rewards",
              icon: Icon(FontAwesomeIcons.gift),
            ),
            BottomNavigationBarItem(
              label: "Market",
              icon: Icon(FontAwesomeIcons.chartSimple),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(FontAwesomeIcons.user),
            ),
          ],
        ),
      ),
    );
  }
}
