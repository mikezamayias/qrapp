import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qrapp/src/pages/about_pages/author_page.dart';
import 'package:qrapp/src/pages/about_pages/open_source_libraries_page.dart';

class AboutBottomSheet extends StatelessWidget {
  const AboutBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      elevation: 9,
      backgroundColor: const Color(0xfff3f3f3),
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(21),
          topRight: const Radius.circular(21),
        ),
      ),
      onClosing: () {},
      builder: (_) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'About',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: const Color(0xff303030),
                ),
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              leading: const Icon(
                Icons.account_circle_rounded,
                color: const Color(0xff303030),
                size: 18,
              ),
              title: Text(
                'Author',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: const Color(0xff303030),
                ),
              ),
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    curve: Curves.easeInToLinear,
                    duration: const Duration(milliseconds: 210),
                    reverseDuration: const Duration(milliseconds: 210),
                    child: AuthorPage(),
                  )),
            ),
            ListTile(
              minLeadingWidth: 0,
              leading: const Icon(
                Icons.article_rounded,
                color: const Color(0xff303030),
                size: 18,
              ),
              title: Text(
                'License',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: const Color(0xff303030),
                ),
              ),
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    curve: Curves.easeInToLinear,
                    duration: const Duration(milliseconds: 210),
                    reverseDuration: const Duration(milliseconds: 210),
                    child: LicensePage(),
                  )),
            ),
            ListTile(
              minLeadingWidth: 0,
              leading: const Icon(
                Icons.source_rounded,
                color: const Color(0xff303030),
                size: 18,
              ),
              title: Text(
                'Open Source Libraries',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: const Color(0xff303030),
                ),
              ),
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    curve: Curves.easeInToLinear,
                    duration: const Duration(milliseconds: 210),
                    reverseDuration: const Duration(milliseconds: 210),
                    child: OpenSourceLibrariesPage(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
