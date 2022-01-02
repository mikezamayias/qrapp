import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            ListTile(
              leading: Icon(FontAwesomeIcons.code),
              title: Text('App'),
            ),
          ],
        ),
      ),
    );
  }
}
