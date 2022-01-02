// flutter packages
import 'package:flutter/material.dart';
import 'package:qrapp/src/models/expansion_panel_info.dart';
import 'package:qrapp/src/widgets/page_blueprint.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      title: 'About',
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ExpansionPanelList(
            expandedHeaderPadding: const EdgeInsets.all(9),
            dividerColor: const Color(0xFF8F6146),
            expansionCallback: (panelIndex, isExpanded) => setState(() {
              expansionStates[panelIndex].isExpanded = !isExpanded;
            }),
            children: [
              for (final expansionState in expansionStates)
                ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: expansionState.isExpanded ?? true,
                  headerBuilder: (context, isExpanded) =>
                      ListTile(title: Text(expansionState.title)),
                  body: expansionState.body,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
