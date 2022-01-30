// flutter packages
import 'package:flutter/material.dart';

// custom widgets
import '../about_page/about_author_view.dart';
import '../about_page/about_licenses_view.dart';
import '../../widgets/about_bottom_sheet_list_tile.dart';

class AboutBottomSheetView extends StatelessWidget {
  const AboutBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      elevation: 9,
      backgroundColor: const Color(0xfff3f3f3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(21),
          topRight: Radius.circular(21),
        ),
      ),
      onClosing: () {},
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AboutBottomSheetListTile(
            title: 'About',
            isTitle: true,
          ),
          AboutBottomSheetListTile(
            title: 'Author',
            iconData: Icons.code_rounded,
            page: AboutAuthorView(),
          ),
          AboutBottomSheetListTile(
            title: 'Licenses',
            iconData: Icons.article_rounded,
            page: AboutLicensesView(),
          ),
        ],
      ),
    );
  }
}
