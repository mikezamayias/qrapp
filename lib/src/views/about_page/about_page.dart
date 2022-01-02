// flutter packages
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return const AboutDialog(
      applicationIcon: Icon(
        Icons.qr_code_rounded,
        color: Color(0xFF303030),
      ),
      applicationName: 'QRapp',
      applicationVersion: '1.0.0',
      applicationLegalese: 'MIT License',
    );
  }
}

/* 
LicensePage(
      applicationIcon: Icon(
        Icons.qr_code_rounded,
        color: const Color(0xFF303030),
      ),
      applicationName: 'QRapp!',
      applicationVersion: '1.0.0',
      applicationLegalese: 'MIT License',
    ) */
