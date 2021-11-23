// flutter packages
import 'package:flutter/material.dart';

// custom widgets
import '../generate_page/generate_page.dart';
import '../scan_page/scan_page.dart';
import '../about_page/about_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<StatefulWidget> _pages = [GeneratePage(), ScanPage(), AboutPage()];
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
        duration: Duration(milliseconds: 300),
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
        enableFeedback: true,
        selectedItemColor: const Color(0xff303030),
        unselectedItemColor: const Color(0x40303030),
        currentIndex: _selectedNavIndex,
        onTap: _onTap,
        items: <BottomNavigationBarItem>[
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
