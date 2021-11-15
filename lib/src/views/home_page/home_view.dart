// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// pub packages
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

// custom widgets
import '../action_views/about_bottom_sheet_view.dart';
import '../../widgets/bottom_nav_bar_buttons.dart';
import '../main_views/generate_view.dart';
import '../main_views/scan_view.dart';

enum _SelectedTab { scan, generate }

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _SelectedTab _selectedTab = _SelectedTab.scan;
  List<StatefulWidget> _pages = [GenerateView(), ScanView()];

  void _handleIndexChanged(int i) {
    setState(() => _selectedTab = _SelectedTab.values[i]);
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
            HapticFeedback.lightImpact();
            showModalBottomSheet(
              isDismissible: false,
              barrierColor: const Color(0xcc0303030),
              // isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(21)),
              ),
              context: context,
              builder: (_) => AboutBottomSheetView(),
            );
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
