// flutter packages
import 'package:flutter/material.dart';
// pub packages
import 'package:page_transition/page_transition.dart';

class AboutBottomSheetListTile extends StatelessWidget {
  final IconData? iconData;
  final String title;
  final Widget? page;
  final bool isTitle;

  const AboutBottomSheetListTile({
    Key? key,
    this.iconData,
    required this.title,
    this.page,
    this.isTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      leading: iconData != null
          ? Icon(
              iconData,
              color: const Color(0xff303030),
              size: 18,
            )
          : null,
      title: isTitle
          ? Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: const Color(0xff303030),
              ),
            )
          : Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: const Color(0xff303030),
              ),
            ),
      onTap: page != null
          ? () => Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                curve: Curves.easeInToLinear,
                duration: const Duration(milliseconds: 210),
                reverseDuration: const Duration(milliseconds: 210),
                child: page!,
              ))
          : () {},
    );
  }
}
