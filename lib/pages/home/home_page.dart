import 'package:flutter/material.dart';
import 'package:todo_app/pages/home/alert_finances_page.dart';
import 'package:todo_app/pages/home/calendar_finances_page.dart';
import 'package:todo_app/pages/home/list_finances_page.dart';
import 'package:todo_app/pages/home/news_finances_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    ListFinancePage(),
    NewsFinancesPage(),
    CalendarFinancesPage(),
    AlertFinancesPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A142F),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              spreadRadius: 3,
              blurRadius: 9,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: const Color(0xFFFFFFFF),
          unselectedItemColor: const Color(0xFF7B788A),
          selectedFontSize: 16,
          showSelectedLabels: false,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF211C37),
              icon: Icon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF211C37),
              icon: Icon(Icons.business),
              label: 'Page 2',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF211C37),
              icon: Icon(Icons.school),
              label: 'Page 3',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF211C37),
              icon: Icon(Icons.abc_sharp),
              label: 'Page 4',
            ),
          ],
        ),
      ),
    );
  }
}
