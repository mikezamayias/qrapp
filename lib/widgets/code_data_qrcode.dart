// flutter packages
import 'package:flutter/material.dart';
// pub packages
import 'package:qr_flutter/qr_flutter.dart';

class CodeDataQRCode extends StatelessWidget {
  final String? data;

  const CodeDataQRCode({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 3, 21, 0),
      child: QrImage(
        data: data ?? 'QRapp!',
        version: QrVersions.auto,
        size: MediaQuery.of(context).size.width * 0.72,
        foregroundColor: const Color(0xff303030),
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: Color(0xff303030),
        ),
      ),
    );
  }
}
