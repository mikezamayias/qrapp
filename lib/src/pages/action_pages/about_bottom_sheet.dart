import 'package:flutter/material.dart';

class AboutBottomSheet extends StatelessWidget {
  const AboutBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      elevation: 9,
      backgroundColor: const Color(0xfff3f3f3),
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(21),
          topRight: const Radius.circular(21),
        ),
      ),
      onClosing: () {},
      builder: (_) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Center(
                child: Text(
                  'About',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: const Color(0xff303030),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Author',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: const Color(0xff303030),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Open Source Libraries',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: const Color(0xff303030),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Licence',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: const Color(0xff303030),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
