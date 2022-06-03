// flutter packages
import 'package:flutter/material.dart';

// custom widgets
import '../about_page/about_page.dart';
import '../history_page/history_page.dart';
import '../qr_code_page/qr_code_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<StatefulWidget> _pages = [
    const HistoryPage(),
    const QrCodePage(),
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
          onPageChanged: _onPageChanged,
          children: _pages,
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
            tooltip: 'Scan or Generate QR code',
            icon: Icon(Icons.qr_code_scanner_rounded),
            label: 'QR Code',
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
