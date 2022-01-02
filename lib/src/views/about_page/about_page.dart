// flutter packages
import 'package:flutter/material.dart';
import 'package:qrapp/src/models/expansion_panel_section.dart';
import 'package:qrapp/src/views/about_page/panel_header.dart';
import 'package:qrapp/src/widgets/page_blueprint.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return const PageBlueprint(
      title: 'About',
      body: PanelHeader(),
      // body: Column(
      //   mainAxisSize: MainAxisSize.max,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     ExpansionPanelList(
      //       elevation: 0,
      //       expandedHeaderPadding: const EdgeInsets.all(9),
      //       dividerColor: const Color(0xFF8F6146),
      //       children: [
      //         for (final expansionPanelSection in expansionPanelSections)
      //           ExpansionPanel(
      //             canTapOnHeader: true,
      //             isExpanded: expansionPanelSection.isExpanded ?? true,
      //             headerBuilder: (context, isExpanded) =>
      //                 ListTile(title: expansionPanelSection.title),
      //             body: Padding(
      //               padding: const EdgeInsets.fromLTRB(21, 12, 21, 12),
      //               child: expansionPanelSection.body,
      //             ),
      //           ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
