import 'package:flutter/material.dart';

class AboutSection {
  String title;
  Widget content;

  AboutSection({
    required this.title,
    required this.content,
  });
}

List<AboutSection> get sections => [
      AboutSection(
        title: 'Version',
        content: const Text(
          '1.0.0',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      AboutSection(
        title: 'Author',
        content: const Text(
          'Mike Zamayias',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    ];
