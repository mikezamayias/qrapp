import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qrapp/src/widgets/code_data_qrcode.dart';
import 'package:qrapp/src/widgets/code_type.dart';
import 'package:qrapp/src/widgets/page_blueprint.dart';

import '../../widgets/code_data_string.dart';

class ScannedDialog extends StatefulWidget {
  final String format;
  final String code;
  final VoidCallback goBackAction;
  final VoidCallback shareAction;

  ScannedDialog({
    Key? key,
    required this.format,
    required this.code,
    required this.goBackAction,
    required this.shareAction,
  }) : super(key: key);

  @override
  _ScannedDialogState createState() => _ScannedDialogState();
}

class _ScannedDialogState extends State<ScannedDialog> {
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
