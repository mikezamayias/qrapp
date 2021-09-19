import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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

  Widget _pauseCameraButton() => _iconButton(
        'Pause camera',
        Icons.pause_rounded,
        () async => await controller?.pauseCamera(),
      );

  Widget _resumeCameraButton() => _iconButton(
        'Resume camera',
        Icons.refresh_rounded,
        () async => await controller?.resumeCamera(),
      );

  Widget _floatyButtonBar(List<Widget> children) => Padding(
        padding: const EdgeInsets.all(21.0),
        child: Card(
          color: Color(0xfff3f3f3),
          shadowColor: Color(0xff303030),
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildQrView(context),
        _floatyButtonBar([
          _pauseCameraButton(),
          _resumeCameraButton(),
        ])
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
