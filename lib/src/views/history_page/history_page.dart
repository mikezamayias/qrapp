// flutter packages
import 'package:flutter/material.dart';

// custom widgets
import '../../widgets/page_blueprint.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      title: 'History',
    );
  }
}
