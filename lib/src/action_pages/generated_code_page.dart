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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Generated QR Code',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: const Color(0xff303030),
          ),
        ),
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
      backgroundColor: const Color(0xfff3f3f3),
    );
  }
}
