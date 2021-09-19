import 'package:flutter/material.dart';

class FormatText extends StatelessWidget {
  final String format;

  const FormatText({
    Key? key,
    required this.format,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 3, 21, 0),
      child: Text(
        format,
        style: TextStyle(
          color: Color(0xff303030),
          fontSize: 18,
        ),
      ),
    );
  }
}
