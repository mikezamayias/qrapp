// flutter packages
import 'package:flutter/material.dart';
// pub packages
import 'package:page_transition/page_transition.dart';
import 'package:qr_flutter/qr_flutter.dart';

// custom widgets
import '../../widgets/page_blueprint.dart';
import '../action_views/generated_qrcode_view.dart';

class GeneratePage extends StatefulWidget {
  const GeneratePage({Key? key}) : super(key: key);

  @override
  State<GeneratePage> createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  final TextEditingController _textEditingController = TextEditingController();

  String _data = 'QRapp';

  void _updateData(value) => setState(() => _data = value);

  void _showQRCode(value) => Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          curve: Curves.easeInToLinear,
          duration: const Duration(milliseconds: 210),
          reverseDuration: const Duration(milliseconds: 210),
          child: GeneratedQRCodeView(
            data: value,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      title: 'Generate',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QrImage(
                data: _data,
                version: QrVersions.auto,
                size: MediaQuery.of(context).size.width * 0.72,
                foregroundColor: const Color(0xff303030),
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Color(0xff303030),
                ),
              ),
              TextFormField(
                controller: _textEditingController,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                onFieldSubmitted: _showQRCode,
                onChanged: _updateData,
                cursorColor: const Color(0xff303030),
                decoration: const InputDecoration(
                  labelText: 'Data',
                  errorText: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
