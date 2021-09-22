import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qrapp/src/pages/about_pages/author_page.dart';
import 'package:qrapp/src/pages/about_pages/open_source_libraries_page.dart';
import 'package:qrapp/src/widgets/about_bottom_sheet_list_tile.dart';

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
            AboutBottomSheetListTile(
              title: 'About',
              isTitle: true,
            ),
            AboutBottomSheetListTile(
              title: 'Author',
              iconData: Icons.code_rounded,
              page: AuthorPage(),
            ),
            AboutBottomSheetListTile(
              title: 'Licenses',
              iconData: Icons.article_rounded,
              page: LicensePage(),
            ),
            AboutBottomSheetListTile(
              title: 'Open Source Libraries',
              iconData: Icons.source_rounded,
              page: OpenSourceLibrariesPage(),
            ),
          ],
        ),
      ),
    );
  }
}
