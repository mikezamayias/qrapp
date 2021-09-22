import 'package:flutter/material.dart';
import 'package:qrapp/src/widgets/page_blueprint.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      title: 'Author',
    );
  }
}
