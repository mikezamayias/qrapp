// flutter packages
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return AboutDialog(
      applicationIcon: Icon(
        Icons.qr_code_rounded,
        color: const Color(0xFF303030),
      ),
      applicationName: 'QRapp',
      applicationVersion: '1.0.0',
      applicationLegalese: 'MIT License',
      children: <Widget>[
        Text('This is a demo application for the Flutter framework.'),
        Text('It is used to demonstrate the Flutter framework.'),
        Text('It is used to demonstrate the Flutter framework.'),
      ],
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
