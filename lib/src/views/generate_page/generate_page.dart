// flutter packages
import 'package:flutter/material.dart';
// pub packages
import 'package:page_transition/page_transition.dart';

// custom widgets
import '../../widgets/page_blueprint.dart';
import '../action_views/generated_qrcode_view.dart';
import '../../themes/textformfield_theme.dart';

class GeneratePage extends StatefulWidget {
  const GeneratePage({Key? key}) : super(key: key);

  @override
  State<GeneratePage> createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  String data = '';

  void _updateData(value) => setState(() => data = value);

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
      title: 'Generate QR Code',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(21),
          child: TextFormField(
            onFieldSubmitted: _showQRCode,
            onChanged: _updateData,
            cursorColor: const Color(0xff303030),
            decoration: InputDecoration(
              // hintText: 'Encode data to QR code',
              labelText: 'Encode data to QR code',
              floatingLabelStyle: const TextStyle(
                color: Color(0xFF303030),
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
              isDense: false,
              errorMaxLines: 1,
              errorText: null,
              errorStyle: const TextStyle(
                color: Colors.transparent,
                fontSize: 0,
              ),
              alignLabelWithHint: true,
              focusColor: const Color(0xFF303030),
              labelStyle: const TextStyle(
                color: Color(0xFF303030),
              ),
              focusedBorder: stableStateBorder,
              border: stableStateBorder,
              enabledBorder: stableStateBorder,
            ),
          ),
        ),
      ),
    );
  }
}
