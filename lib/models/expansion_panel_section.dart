import 'package:flutter/material.dart';

import 'about_section.dart';
import 'social_media.dart';

class ExpansionPanelSection {
  Widget title;
  Widget body;
  bool? isExpanded = false;

  ExpansionPanelSection({
    required this.title,
    required this.body,
  });
}

List<ExpansionPanelSection> get expansionPanelSections {
  return [
    ExpansionPanelSection(
      title: const Text('App'),
      body: Column(
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
                section.content,
              ],
            )
        ],
      ),
    ),
      ExpansionPanelSection(
        title: const Text('Get in touch'),
        body: Row(
          mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: socialButtons,
      ),
      ),
    ];
}
