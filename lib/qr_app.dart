// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrapp/views/home_page/home_page.dart';

import 'themes/themes.dart';
// import 'views/home_page/home_page.dart';

class QrApp extends StatefulWidget {
  const QrApp({Key? key}) : super(key: key);

  @override
  State<QrApp> createState() => _QrAppState();
}

class _QrAppState extends State<QrApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      home: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        // child: HomePage(),
        child: HomePage(),
      ),
    );
  }
}
