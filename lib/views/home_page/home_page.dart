// flutter packages
import 'package:flutter/material.dart';

import '../about_page/about_page.dart';
// custom widgets
import '../generate_page/generate_page.dart';
import '../history_page/history_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<StatefulWidget> _pages = [
    const HistoryPage(),
    const GeneratePage(),
    const AboutPage(),
  ];
  int _selectedNavIndex = 0;
  final _pageController = PageController(initialPage: 0);

  void _onPageChanged(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  void _onTap(int index) {
    setState(() {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: _pages,
          onPageChanged: _onPageChanged,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: _onTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            tooltip: 'Show QR code history',
            icon: Icon(Icons.history_rounded),
            label: 'History',
          ),
          BottomNavigationBarItem(
            tooltip: 'Scan QR code',
            icon: Icon(Icons.qr_code_scanner_rounded),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            tooltip: 'About',
            icon: Icon(Icons.info_outline_rounded),
            label: 'About',
          )
        ],
      ),
    );
  }
}
