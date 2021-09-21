import 'package:flutter/material.dart';

class PageBlueprint extends StatelessWidget {
  const PageBlueprint({
    Key? key,
    required this.title,
    required this.showLeadingIconButton,
    required this.leadingIconButton,
    required this.trailingActions,
    required this.bodyWidget,
  }) : super(key: key);

  final String title;
  final bool showLeadingIconButton;
  final IconButton leadingIconButton;
  final List<IconButton> trailingActions;
  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: const Color(0xfff3f3f3),
        centerTitle: true,
        automaticallyImplyLeading: showLeadingIconButton,
        leading: leadingIconButton,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: const Color(0xff303030),
          ),
        ),
        actions: trailingActions,
      ),
      body: bodyWidget,
    );
  }
}
