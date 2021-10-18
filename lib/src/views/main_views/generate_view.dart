import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qrapp/src/widgets/page_blueprint.dart';

import '../action_views/generated_qrcode_view.dart';

class GenerateView extends StatefulWidget {
  const GenerateView({Key? key}) : super(key: key);

  @override
  State<GenerateView> createState() => _GenerateViewState();
}

class _GenerateViewState extends State<GenerateView> {
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
          padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
          child: TextFormField(
            onFieldSubmitted: _showQRCode,
            onChanged: _updateData,
            cursorColor: const Color(0xff303030),
            decoration: const InputDecoration(
              labelText: 'Encode data to QR code',
              focusColor: const Color(0xff3030),
              labelStyle: const TextStyle(
                color: const Color(0xff303030),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(
                  color: const Color(0xff303030),
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(21)),
                // gapPadding: 3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
