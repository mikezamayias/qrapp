import 'package:flutter/material.dart';

BottomNavigationBarItem _bottomNavButton(
        String tooltip, IconData icon, String label) =>
    BottomNavigationBarItem(
      tooltip: tooltip,
      icon: Icon(icon),
      label: label,
    );

BottomNavigationBarItem generateNavButton() => _bottomNavButton(
      'Generate QR code',
      Icons.qr_code_rounded,
      'Generate',
    );

BottomNavigationBarItem scanNavButton() => _bottomNavButton(
      'Scan QR code',
      Icons.qr_code_scanner_rounded,
      'Scan',
    );
