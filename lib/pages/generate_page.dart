import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneratePage extends StatelessWidget {
  const GeneratePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Under development!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff303030),
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
