// flutter packages
import 'package:flutter/material.dart';
// pub packages
import 'package:qr_code_scanner/qr_code_scanner.dart';

// custom widgets
import '../../widgets/code_data_qrcode.dart';
import '../../widgets/code_data_string.dart';
import '../../widgets/code_type.dart';
import '../../widgets/page_blueprint.dart';

class ScannedQRCodeView extends StatefulWidget {
  final Barcode result;

  const ScannedQRCodeView({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  _ScannedCodePageState createState() => _ScannedCodePageState();
}

class _ScannedCodePageState extends State<ScannedQRCodeView> {
  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      title: 'Scanned QR Code',
      showLeadingIconButton: true,
      leadingIconButton: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () => Navigator.pop(context),
        color: const Color(0xff303030),
      ),
      trailingActions: [
        IconButton(
          icon: const Icon(Icons.share_rounded),
          color: const Color(0xff303030),
          tooltip: 'Share QR Code',
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('This feature is under development.'),
            ),
          ),
        ),
      ],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CodeType(type: 'Format:'),
            CodeDataString(data: widget.result.format.toString()),
            const CodeType(type: 'Data:'),
            CodeDataString(data: widget.result.code!),
            const CodeType(type: 'QR Code:'),
            CodeDataQRCode(data: widget.result.code),
          ],
        ),
      ),
    );
  }
}
