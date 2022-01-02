import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PanelHeader extends StatelessWidget {
  const PanelHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21),
      ),
      child: const ListTile(
        title: Text('Get in touch'),
      ),
    );
  }
}
