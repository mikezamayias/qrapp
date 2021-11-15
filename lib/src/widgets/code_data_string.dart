// flutter packages
import 'package:flutter/material.dart';

class CodeDataString extends StatelessWidget {
  final String data;

  const CodeDataString({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 3, 21, 0),
      child: SelectableText(
        data,
        style: const TextStyle(
          color: const Color(0xff303030),
          fontSize: 18,
        ),
        showCursor: true,
        toolbarOptions: const ToolbarOptions(
          copy: true,
          paste: false,
          cut: true,
          selectAll: true,
        ),
      ),
    );
  }
}
