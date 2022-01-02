import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  final String handleUrl;
  final IconData icon;

  const SocialButton({
    Key? key,
    required this.handleUrl,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (!await launch(handleUrl)) {
          throw 'Could not launch $handleUrl';
        }
      },
      icon: Icon(icon),
    );
  }
}

String handle = 'mzamayias';

SocialButton get twitterButton => SocialButton(
      handleUrl: 'https://twitter.com/$handle',
      icon: FontAwesomeIcons.twitter,
    );

SocialButton get githubButton => SocialButton(
      handleUrl: 'https://github.com/$handle',
      icon: FontAwesomeIcons.github,
    );

SocialButton get instagramButton => SocialButton(
      handleUrl: 'https://instagram.com/$handle',
      icon: FontAwesomeIcons.instagram,
    );

List<SocialButton> socialButtons = [
  twitterButton,
  githubButton,
  instagramButton,
];
