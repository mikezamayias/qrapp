import 'package:flutter/material.dart';

import 'about_section.dart';

class ExpansionPanelInfo {
  String title;
  Widget body;
  bool? isExpanded;

  ExpansionPanelInfo({
    required this.title,
    required this.body,
  });
}

List<ExpansionPanelInfo> get expansionStates => [
      ExpansionPanelInfo(
        title: 'App',
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
                    section.content,
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
