import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  // In order to get hot reload to work we need to pause the camera if the
  // platform is android, or resume the camera if the platform is iOS.
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
    return Column(
      children: <Widget>[
        Expanded(flex: 4, child: _buildQrView(context)),
        Expanded(
          flex: 1,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                if (result != null)
                  Text(
                    'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}',
                  )
                else
                  Text('Scan a code'),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: <Widget>[
                //     Container(
                //       margin: EdgeInsets.all(8),
                //       child: ElevatedButton(
                //         onPressed: () async {
                //           await controller?.toggleFlash();
                //           setState(() {});
                //         },
                //         child: FutureBuilder(
                //           future: controller?.getFlashStatus(),
                //           builder: (context, snapshot) {
                //             return Text('Flash: ${snapshot.data}');
                //           },
                //         ),
                //       ),
                //     ),
                //     Container(
                //       margin: EdgeInsets.all(8),
                //       child: ElevatedButton(
                //         onPressed: () async {
                //           await controller?.flipCamera();
                //           setState(() {});
                //         },
                //         child: FutureBuilder(
                //           future: controller?.getCameraInfo(),
                //           builder: (context, snapshot) {
                //             if (snapshot.data != null) {
                //               return Text(
                //                   'Camera facing ${describeEnum(snapshot.data!)}');
                //             } else {
                //               return Text('loading');
                //             }
                //           },
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8),
                      child: IconButton(
                        onPressed: () async {
                          await controller?.pauseCamera();
                        },
                        icon: Icon(Icons.pause_rounded),
                        tooltip: 'Pause camera',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: IconButton(
                        onPressed: () async {
                          await controller?.resumeCamera();
                        },
                        icon: Icon(Icons.refresh_rounded),
                        tooltip: 'Resume camera',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
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
      // await controller.pauseCamera();
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
