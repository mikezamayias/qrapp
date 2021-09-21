import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'action_pages/generated_code_page.dart';

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
          child: GeneratedCodePage(
            data: value,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
            child: Text(
              'Encode Data',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color(0xff303030),
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
            child: TextFormField(
              onFieldSubmitted: _showQRCode,
              onChanged: _updateData,
              cursorColor: const Color(0xff303030),
              decoration: const InputDecoration(
                labelText: 'Data to encode as QR code',
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
        ],
      ),
    );
  }
}
