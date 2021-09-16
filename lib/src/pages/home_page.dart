import 'package:flutter/material.dart';

import 'package:qrapp/src/pages/generate_page.dart';
import 'package:qrapp/src/pages/scan_page.dart';

enum _SelectedTab { scan, generate }

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _SelectedTab _selectedTab = _SelectedTab.scan;
  List _pages = [GeneratePage(), ScanPage()];

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: _pages[_selectedTab.index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
        selectedItemColor: Color(0xff303030),
        unselectedItemColor: Color(0x40303030),
        currentIndex: _selectedTab.index,
        onTap: (i) {
          _handleIndexChanged(i);
          print(_selectedTab.toString());
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            tooltip: 'Generate QR code',
            icon: const Icon(Icons.qr_code_rounded),
            label: 'Generate',
          ),
          BottomNavigationBarItem(
            tooltip: 'Scan QR code',
            icon: const Icon(Icons.qr_code_scanner_rounded),
            label: 'Scan',
          ),
        ],
      ),
    );
  }
}
