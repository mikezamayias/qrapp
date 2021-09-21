import 'package:flutter/material.dart';

class FloatyButton extends StatelessWidget {
  final String tooltip;
  final IconData iconData;
  final VoidCallback onPressed;

  const FloatyButton({
    Key? key,
    required this.tooltip,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: IconButton(
        splashRadius: 1,
        onPressed: onPressed,
        icon: Icon(iconData),
        tooltip: tooltip,
      ),
    );
  }
}
