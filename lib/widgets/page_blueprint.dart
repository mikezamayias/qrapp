// flutter packages
import 'package:flutter/material.dart';

class PageBlueprint extends StatelessWidget {
  const PageBlueprint({
    Key? key,
    required this.title,
    this.showLeadingIconButton = false,
    this.leadingIconButton,
    this.trailingActions,
    this.body,
  }) : super(key: key);

  final String title;
  final bool showLeadingIconButton;
  final IconButton? leadingIconButton;
  final List<IconButton>? trailingActions;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff3f3f3),
        appBar: AppBar(
          automaticallyImplyLeading: showLeadingIconButton,
          leading: leadingIconButton,
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: const Color(0xFF8F6146),
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: trailingActions,
        ),
        body: body,
      ),
    );
  }
}
