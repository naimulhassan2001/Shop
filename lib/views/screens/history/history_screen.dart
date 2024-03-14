

import 'package:flutter/material.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("assets/pdf/Api_ramadan_calendar.pdf"),),
      // body: Center(child: SfPdfViewer.asset("assets/pdf/Api_ramadan_calendar.pdf"),),
    );
  }
}
