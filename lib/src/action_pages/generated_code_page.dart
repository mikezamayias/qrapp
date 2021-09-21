import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratedCodePage extends StatelessWidget {
  final data;

  const GeneratedCodePage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xfff3f3f3),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xff303030),
        ),
        title: Text(
          'Generated QR Code',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: const Color(0xff303030),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            color: const Color(0xff303030),
            tooltip: 'Share QR Code',
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('This feature is under development.'),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
          child: data != null
              ? QrImage(
                  data: data,
                  version: QrVersions.auto,
                  size: MediaQuery.of(context).size.width * 0.72,
                  foregroundColor: const Color(0xff303030),
                  eyeStyle: QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: const Color(0xff303030),
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
