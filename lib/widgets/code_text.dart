import 'package:flutter/material.dart';

class CodeText extends StatelessWidget {
  final String code;

  const CodeText({
    Key? key,
    required this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 3, 21, 0),
      child: Text(
        code,
        style: TextStyle(
          color: Color(0xff303030),
          fontSize: 18,
        ),
      ),
    );
  }
}
