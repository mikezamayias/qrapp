import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneratePage extends StatelessWidget {
  const GeneratePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Under development!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff303030),
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
