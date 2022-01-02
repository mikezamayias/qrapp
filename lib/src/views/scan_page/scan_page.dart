// dart packages
import 'dart:developer';
import 'dart:io';
// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// pub packages
import 'package:page_transition/page_transition.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// custom widgets
import '../action_views/scanned_qrcode_view.dart';
import '../../widgets/page_blueprint.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  late Barcode result;
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
      body: _buildQrView(context),
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
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) async {
      setState(() => result = scanData);
      HapticFeedback.lightImpact();
      await controller.pauseCamera();
      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            curve: Curves.easeInToLinear,
            duration: const Duration(milliseconds: 210),
            reverseDuration: const Duration(milliseconds: 210),
            child: ScannedQRCodeView(
              result: result,
            )),
      );
      await controller.resumeCamera();
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
