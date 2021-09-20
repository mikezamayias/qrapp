import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import '../widgets/bottom_nav_bar_buttons.dart'
    show generateNavButton, scanNavButton;
import 'generate_page.dart';
import 'scan_page.dart';

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
      bottomNavigationBar: SimpleGestureDetector(
        onVerticalSwipe: (direction) {
          if (direction == SwipeDirection.up) {
            showModalBottomSheet(
              context: context,
              builder: (_) => BottomSheet(
                onClosing: () {},
                builder: (_) => Container(),
                enableDrag: false,
                elevation: 9,
                backgroundColor: const Color(0xfff3f3f3),
                shape: const RoundedRectangleBorder(
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(21),
                    topRight: const Radius.circular(21),
                  ),
                ),
              ),
            );
          } else {
            // Action to do when user swipes down from bottom navigation bar.
          }
        },
        swipeConfig: const SimpleSwipeConfig(
          verticalThreshold: 60,
          horizontalThreshold: 60,
        ),
        child: BottomNavigationBar(
          enableFeedback: true,
          selectedItemColor: const Color(0xff303030),
          unselectedItemColor: const Color(0x40303030),
          currentIndex: _selectedTab.index,
          onTap: (i) {
            _handleIndexChanged(i);
            print(_selectedTab.toString());
          },
          items: <BottomNavigationBarItem>[
            generateNavButton(),
            scanNavButton(),
          ],
        ),
      ),
    );
  }
}
