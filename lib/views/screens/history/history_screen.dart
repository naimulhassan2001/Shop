

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: Text("assets/pdf/Api_ramadan_calendar.pdf"),),
      body: Center(child: SfPdfViewer.asset("assets/pdf/Api_ramadan_calendar.pdf"),),
    );
  }
}
