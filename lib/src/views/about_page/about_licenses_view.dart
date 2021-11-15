// flutter packages
import 'package:flutter/material.dart';

// custom packages
import '../../widgets/page_blueprint.dart';

class AboutLicensesView extends StatelessWidget {
  const AboutLicensesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      title: 'Licenses',
      showLeadingIconButton: true,
      leadingIconButton: IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: () => Navigator.pop(context),
        color: const Color(0xff303030),
      ),
      body: LicensePage(
        applicationName: 'QRapp!',
        applicationIcon: Icon(Icons.qr_code_2_rounded),
        applicationVersion: '0.0.1',
        applicationLegalese: 'Copyright ${DateTime.now().year}',
      ),
    );
  }
}
