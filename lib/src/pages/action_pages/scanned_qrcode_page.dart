import 'package:flutter/material.dart';

import '../../widgets/code_data_qrcode.dart';
import '../../widgets/code_type.dart';
import '../../widgets/page_blueprint.dart';
import '../../widgets/code_data_string.dart';

class ScannedQRCodePage extends StatefulWidget {
  final String format;
  final String code;

  ScannedQRCodePage({
    Key? key,
    required this.format,
    required this.code,
  }) : super(key: key);

  @override
  _ScannedCodePageState createState() => _ScannedCodePageState();
}

class _ScannedCodePageState extends State<ScannedQRCodePage> {
  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      title: 'Scanned QR Code',
      showLeadingIconButton: true,
      trailingActions: [
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
      bodyWidget: Center(
        child: Column(
          children: [
            CodeType(type: 'Format:'),
            CodeDataString(data: widget.format),
            CodeType(type: 'Data:'),
            CodeDataString(data: widget.code),
            CodeType(type: 'QR Code:'),
            CodeDataQRCode(data: widget.code),
          ],
        ),
      ),
    );
  }
}
