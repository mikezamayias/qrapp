// flutter packages
import 'package:flutter/material.dart';
// pub packages
import 'package:qr_flutter/qr_flutter.dart';

// custom widgets
import '../../widgets/page_blueprint.dart';

class GeneratedQRCodeView extends StatelessWidget {
  final String data;

  const GeneratedQRCodeView({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      title: 'Generated QR code',
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
          child: QrImage(
            data: data,
            version: QrVersions.auto,
            size: MediaQuery.of(context).size.width * 0.72,
            foregroundColor: const Color(0xff303030),
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Color(0xff303030),
            ),
          ),
        ),
      ),
    );
  }
}
