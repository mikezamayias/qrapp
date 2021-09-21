import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratePage extends StatefulWidget {
  const GeneratePage({Key? key}) : super(key: key);

  @override
  State<GeneratePage> createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  String data = '';

  void _updateData(value) => setState(() => data = value);

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
          data != ''
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
                  child: QrImage(
                    data: data,
                    version: QrVersions.auto,
                    size: MediaQuery.of(context).size.width * 0.72,
                    foregroundColor: const Color(0xff303030),
                    eyeStyle: QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: const Color(0xff303030),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
