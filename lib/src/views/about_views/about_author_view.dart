// flutter packages
import 'package:flutter/material.dart';

// custom widgets
import '../../widgets/page_blueprint.dart';

class AboutAuthorView extends StatelessWidget {
  const AboutAuthorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      title: 'Author',
    );
  }
}
