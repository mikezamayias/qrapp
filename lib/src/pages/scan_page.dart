import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrapp/src/widgets/page_blueprint.dart';

import '../widgets/scanned_dialog.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      title: 'Scan QR Code',
      bodyWidget: _buildQrView(context),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
        print(result!.code);
      });
      HapticFeedback.lightImpact();
      await controller.pauseCamera();
      showDialog(
        barrierDismissible: false,
        barrierColor: Color(0xaa303030),
        context: context,
        builder: (_) => WillPopScope(
          onWillPop: () => Future.value(true).then((exit) async {
            Navigator.of(context).pop();
            await controller.resumeCamera();
            return true;
          }),
          child: ScannedDialog(
            format: describeEnum(result!.format),
            code: result!.code,
            goBackAction: () async {
              Navigator.of(context).pop();
              await controller.resumeCamera();
            },
            shareAction: () {
              print('Need to share!');
            },
          ),
        ),
      );
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
