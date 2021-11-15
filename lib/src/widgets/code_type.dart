// flutter packages
import 'package:flutter/material.dart';

class CodeType extends StatelessWidget {
  final String type;

  const CodeType({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 21, 21, 0),
      child: SelectableText(
        type,
        style: const TextStyle(
          color: const Color(0xff303030),
          fontSize: 15,
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
