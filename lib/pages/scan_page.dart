import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrapp/widgets/floaty_button.dart';
import 'package:qrapp/widgets/floaty_button_bar.dart';

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

  Widget _iconButton(
          String tooltip, IconData iconData, VoidCallback onPressed) =>
      Container(
        margin: EdgeInsets.all(3),
        child: IconButton(
          splashRadius: 1,
          onPressed: onPressed,
          icon: Icon(iconData),
          tooltip: tooltip,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildQrView(context),
        FloatyButtonBar(
          children: [
            FloatyButton(
              tooltip: 'Pause camera',
              iconData: Icons.pause_rounded,
              onPressed: () async => await controller?.pauseCamera(),
            ),
            FloatyButton(
              tooltip: 'Resume camera',
              iconData: Icons.refresh_rounded,
              onPressed: () async => await controller?.resumeCamera(),
            ),
          ],
        ),
      ],
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
      });
      HapticFeedback.lightImpact();
      await controller.pauseCamera();
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
