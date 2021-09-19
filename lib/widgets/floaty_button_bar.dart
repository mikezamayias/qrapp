import 'package:flutter/material.dart';

import 'floaty_button.dart';

class FloatyButtonBar extends StatelessWidget {
  final List<FloatyButton> children;

  const FloatyButtonBar({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(21.0),
      child: Card(
        color: Color(0xfff3f3f3),
        shadowColor: Color(0xff303030),
        elevation: 9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
