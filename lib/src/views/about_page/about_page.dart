// flutter packages
import 'package:flutter/material.dart';
import 'package:qrapp/src/widgets/page_blueprint.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  static final List<AboutSection> sections = [
    AboutSection(
      title: 'Version',
      value: '1.0.0',
    ),
    AboutSection(
      title: 'Author',
      value: 'Mike Zamayias',
    ),
  ];
  static final List<ExpansionPanelInfo> _expansionStates = [
    ExpansionPanelInfo(
      title: 'App Details',
      body: Padding(
        padding: const EdgeInsets.fromLTRB(21, 0, 21, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final section in sections)
              Row(
                children: [
                  Text(
                    section.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    section.value,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    ),
    ExpansionPanelInfo(
      title: 'Hello World 2',
      body: const Padding(
        padding: EdgeInsets.all(9),
        child: Text('Hello World 2'),
      ),
    ),
  ];

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
              _expansionStates[panelIndex].isExpanded = !isExpanded;
            }),
            children: [
              for (final expansionState in _expansionStates)
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

class ExpansionPanelInfo {
  String title;
  Widget body;
  bool? isExpanded;

  ExpansionPanelInfo({
    required this.title,
    required this.body,
  });
}

class AboutSection {
  String title;
  String value;

  AboutSection({
    required this.title,
    required this.value,
  });
}
